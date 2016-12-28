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
            if($null -ne $Exception.ErrorDetails.Message) {
                $ErrorJSON = $Exception.ErrorDetails.Message | ConvertFrom-Json -ErrorAction Continue
            }
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
    Param (
        [Parameter(Position=0, Mandatory=$true)][string]$TenantName,
        [Parameter(Position=1, Mandatory=$true)][pscredential]$Credential
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
    $PayLoad = "resource=https://graph.microsoft.com/&client_id=1950a258-227b-4e31-a9cf-717495945fc2&grant_type=password&username=$($UserName)&scope=user_impersonation&password=$($Password)" 
    $response = '' 
    try { 
        Write-GraphLog 'Trying to get token...' -Verbose
        $Response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/Common/oauth2/token" -Method POST -Body $PayLoad
    } 
    catch {
        Write-GraphLog -Exception $_
    }
    $ResponseJSON = $Response | ConvertFrom-Json
    $GraphAPIAuthenticationHeader = $null
    $GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
    $GraphAPIAuthenticationHeader.Add("Authorization", "Bearer $($ResponseJSON.access_token)")
    $Global:GraphAuthenticationHash = @{
            'Parameters' = @{
            'TenantName' = $TenantName
            'Credential' = $Credential
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
        $method = 'Get',
        $body,
        $ContentType
    )

    try {
        if ($null -ne $Global:GraphAuthenticationHash.Parameters['TenantName']) {
            $Parameters = $Global:GraphAuthenticationHash['Parameters']
            Get-GraphAuthenticationToken @Parameters
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

Import-Module "$PSScriptRoot\Classes_v1.ps1"

Import-Module "$PSScriptRoot\User.ps1"

Import-Module "$PSScriptRoot\Group.ps1"