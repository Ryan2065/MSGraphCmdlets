Function Write-GraphLog {
    Param (
        $Message,
        $Exception,
        [switch]$Verbose
    )
    $Output = "$(Get-Date) $Message"
    
    if($Exception -ne $null) {
        $ErrorJSON = ''
        try {
            $ErrorJSON = $Exception.ErrorDetails.Message | ConvertFrom-Json -ErrorAction Continue
        }
        catch { }
        $ErrorMessage = ''
        if(-not [string]::IsNullOrEmpty($ErrorJSON)) {
            $ErrorJSON = "`nError JSON Information:`n" + `
            "Error: $($ErrorJSON.Error)`n" + `
            "Error Description: $($ErrorJSON.Error_Description)`n" + `
            "Error Codes: $($ErrorJSON.Error_Codes)`n" + `
            "Error Timestamp: $($ErrorJSON.Timestamp)`n" + `
            "Trace Id: $($ErrorJSON.Trace_Id)`n" + `
            "Correlation Id: $($ErrorJSON.Correlation_Id)"
        }


        $Output = $Output + @"

ERROR Details:
Script Name:        $($Exception.InvocationInfo.ScriptName)

Error Line Number:  $($Exception.InvocationInfo.ScriptLineNumber)

Error Line:         $($Exception.InvocationInfo.Line.Trim())

Error Message:      $($Exception.Exception)$($ErrorJSON)
"@
    }
    if($Exception -ne $null) {
        Write-Error $Output
    }
    elseif ($Verbose -eq $true) {
        Write-Verbose $Output
    }
    else {
        Write-Output $Output
    }
}

Function Get-GraphAuthenticationToken {
<#
    .SYNOPSIS
        Used to get the authentication token to Microsoft Graph
 
    .DESCRIPTION
        Creates an OAuth 2.0 token through https://login.microsoftonline.com. If silent is not used, it will prompt
        you for credentials. 
   
    .EXAMPLE
        $secpasswd = ConvertTo-SecureString 'PASSWORD' -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ('USER@TENANT', $secpasswd)
        $GraphParams = @{
            'TenantName' = 'TENANT'
            'Credential' = $mycreds
            'clientid' = 'CLIENTGUID'
        }
        Get-GraphAuthenticationToken @GraphParams
 
    .PARAMETER TenantName
        The name of your tenant

    .PARAMETER Credential
        Only used with the Silent switch. Your credential object. Can be created with the code:
        $secpasswd = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ('user@tenant', $secpasswd)

    .PARAMETER clientid
        Client ID of your Azure Application

    .PARAMETER redirectUri
        Redirect URI of your Azure Application

    .NOTES
        AUTHOR: Ryan Ephgrave
        LASTEDIT: 12/14/2016 19:09:06
 
   .LINK
        https://github.com/Ryan2065/MSGraphCmdlets/wiki/Getting-Started
#>
    Param (
        [Parameter(Position=0, Mandatory=$true)][string]$TenantName,
        [Parameter(Position=1, Mandatory=$true)][pscredential]$Credential,
        [Parameter(Position=2, Mandatory=$true)][guid]$clientid,
        [Parameter(Position=3, Mandatory=$true)][string]$redirectUri,
        [Parameter(Position=4, Mandatory=$false)][string]$scope = 'openid'
    )
    try {

        $username = $Credential.UserName
        $password = $Credential.Password
        $Marshal = [System.Runtime.InteropServices.Marshal]
        $Bstr = $Marshal::SecureStringToBSTR($Password)
        $Password = $Marshal::PtrToStringAuto($Bstr)
        $Marshal::ZeroFreeBSTR($Bstr)
    }
    catch {
        Write-GraphLog 'Error retrieving password from credential object!' $_
        break
    }

    $resourceAppIdURI = "https://graph.microsoft.com"
    #$PayLoad = "resource=https://graph.microsoft.com/&client_id=$($clientId)&client_secret=$($clientsecret)&grant_type=password&username=$($Username)&scope=$($scope)&password=$($Password)"
    $PayLoad = "resource=https://graph.microsoft.com/&client_id=$($clientId)&grant_type=password&username=$($Username)&scope=$($scope)&password=$($Password)"
    $response = ''
    try {
        Write-GraphLog 'Trying to get token...' -Verbose
        $Response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/Common/oauth2/token" -Method POST -Body $PayLoad
        Write-GraphLog 'Successfully received token!' -Verbose
    }
    catch {
        $ExceptionMessage = $_.ErrorDetails.Message | ConvertFrom-Json
        if($ExceptionMessage.Error -eq 'invalid_grant') {
            $ErrorMessage = "Invalid grant errors are generally caused by the application not having permissions in your environment. " + `
            "Please go to the link below and sign in as an Azure AD Domain Admin. You will need to give this application permissions in your environment. " + `
            "Visit the wiki on GitHub for more information.  Wiki Page: https://github.com/Ryan2065/MSGraphCmdlets/wiki/Getting-Started`n" +  `
            "URL for permissions:`n https://login.microsoftonline.com/$($TenantName)/oauth2/authorize?resource=https://graph.microsoft.com&client_id=$($clientid)&response_type=code&haschrome=1&redirect_uri=$($redirectUri)"
            Write-GraphLog -Message $ErrorMessage -Exception $_
            break
        }
    }
    $ResponseJSON = $Response | ConvertFrom-Json
    $GraphAPIAuthenticationHeader = $null
    $GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
    $GraphAPIAuthenticationHeader.Add("Authorization", "Bearer " + $ResponseJSON.access_token)
    $Global:GraphAuthenticationHash = @{
            'Parameters' = @{
            'TenantName' = $TenantName
            'Credential' = $Credential
            'clientid' = $clientid
            'redirecturi' = $redirectUri
        }
        'Token' = $ResponseJSON.access_token
        'Header' = $GraphAPIAuthenticationHeader
    }
}

Function Invoke-GraphMethod {
    Param(
        $Version = 'v1.0',
        $query,
        $filter,
        $Class,
        $scope,
        $method = 'Get',
        $body,
        $ContentType
    )

    try {
        if ($null -ne $Global:GraphAuthenticationHash.Parameters['TenantName']) {
            $Parameters = $Global:GraphAuthenticationHash['Parameters']
            Get-GraphAuthenticationToken @Parameters -scope $scope
        }
    }
    catch {
        Write-Error -Exception $_
    }

    $uri = "https://graph.microsoft.com/$($version)/$($query)"

    if(-not [string]::IsNullOrEmpty($Filter)) {
        $uri = $uri + "&`$filter=$($Filter)"
    }
    $RestParams = @{
        'Method' = $method
    }

    if($null -ne $body) {
        $RestParams['Body'] = $body
    }
    if($null -ne $ContentType) {
        $RestParams['ContentType'] = $ContentType
    }
    try {
        $returned = Invoke-RestMethod -Uri $uri -Headers $Global:GraphAuthenticationHash['Header'] @RestParams
        Write-GraphLog -Message $returned -Verbose
    }
    catch {
        Write-GraphLog -Exception $_
    }
    if($null -ne $returned) {
        if(($null -ne $returned."@odata.type") -and ($null -eq $returned.Value)) {
            try {
                $type = ($returned."@odata.type").split('.')
                $type = $type[$type.count - 1]
                $type = "Graph$($type)_$(($Version.split('.'))[0])"
                Get-GraphClass -Class $type -object $returned
            }
            catch {
                $returned
            }
        }
        $returnedvalue = $returned.value
        foreach($instance in $returnedvalue) {
            if(-not [string]::IsNullOrEmpty($Class)) {
                Get-GraphClass -Class $Class -object $instance
            }
            elseif($instance."@odata.type" -ne $null) {
                try {
                    $type = ($instance."@odata.type").split('.')
                    $type = $type[$type.count - 1]
                    $type = "Graph$($type)_$(($Version.split('.'))[0])"
                    Get-GraphClass -Class $type -object $instance
                }
                catch {
                    $instance
                }
            }
            else {
                
                $instance
            }
        }
    }
}

Function Get-GraphMetadata {
    param(
        $Version = 'v1.0'
    )
    (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/$($Version)/`$metadata").Edmx.DataServices.Schema
}

Function Get-GraphClass {
    param(
        $object,
        $Class
    )
    try {
       $tempObject = New-Object "$Class"
       $tempObjectProperties = ($tempObject | Get-Member -MemberType Property).Name
       $psObjectProperties = ($Object | Get-Member -MemberType NoteProperty).Name
       foreach($property in $tempObjectProperties) {
           if($psObjectProperties -contains $property) {
               $tempObject."$property" = $object."$property"
           }
       }
       return $tempObject
    }
    catch {
        throw $_
    }
}

Import-Module "$PSScriptRoot\User.ps1"

Import-Module "$PSScriptRoot\Classes_v1.ps1"
