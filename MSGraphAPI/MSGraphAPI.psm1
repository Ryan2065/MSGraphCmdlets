Function Write-GraphLog {
<#
    .SYNOPSIS
        Function to help log in the MSGraphAPI cmdlets

    .DESCRIPTION
        Easily create a log message with date stamp

    .EXAMPLE
        Write-GraphLog -Exception $Exception
        This will output error information including the script name with the error, error lime number, error line, and message.

    .EXAMPLE
        Write-GraphLog -Message 'My Message' -Verbose
        This will write my message to the verbose stream with date/time information in front of the message

    .EXAMPLE
        Write-GraphLog -Message 'My Message'
        This will write My Message to the output stream

    .PARAMETER Message
        The message you want displayed. This will have the date/time information added to the beginning

    .PARAMETER Exception
        This will parse the exception object for information like error message, error line number, script name, etc. 
        Good way to quickly get additional information.

    .PARAMETER Verbose
        Switch to write to the Verbose stream. Can view verbose output with $VerbosePreference = 'Continue'

    .NOTES
        Used in the MSGraphAPI cmdlets

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
#>
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
<#
    .SYNOPSIS
        Will get an authentication token for https://graph.microsoft.com

    .DESCRIPTION
        Will request the token from https://login.microsoftonline.com/Common/oauth2/token

    .EXAMPLE
        Get-GraphAuthenticationToken -TenantName 'MyTenant.onmicrosoft.com' -Credential (Get-Credential)
        This will get a token for the specified tenant using the credentials. Credentials can also be created using this code:
        $secpasswd = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ('USER@TENANT', $secpasswd)

    .PARAMETER TenantName
        Name of the tenant. Usually in the form of xxxxx.onmicrosoft.com

    .PARAMETER Credential
        Credential object. Can be generated with the code:
        $secpasswd = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ('USER@TENANT', $secpasswd)

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
#>
    Param (
        [Parameter(Position=0, Mandatory=$true)][string]$TenantName,
        [Parameter(Position=1, Mandatory=$true)][pscredential]$Credential,
        [Parameter(Position=2, Mandatory=$false)][string[]]$Scopes,
        [Parameter(Position=3, Mandatory=$false)][string]$clientid,
        [Parameter(Position=4, Mandatory=$false)][string]$redirecturi,
        [Parameter(Position=5, Mandatory=$false)][string]$clientsecret
        
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
    if([string]::IsNullOrEmpty($Scopes)) {
        $PayLoad = "resource=https://graph.microsoft.com/&client_id=1950a258-227b-4e31-a9cf-717495945fc2&grant_type=password&username=$($UserName)&scope=user_impersonation&password=$($Password)" 
        $response = ''
        try {
            Write-GraphLog 'Trying to get token...' -Verbose
            $Response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/$($TenantName)/oauth2/token" -Method POST -Body $PayLoad
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
    else {
        if($null -eq $clientid) {
            $clientid = 'cb89a343-cd2e-463f-81cd-9527bdbda08d'
        }
        if($null -eq $redirecturi) {
            $redirecturi = 'urn:ietf:wg:oauth:2.0:oob'
        }
        $Authority = "https://login.microsoftonline.com/$($TenantName)/oauth2/token"
        $ResourceURI = 'https://graph.microsoft.com'
        $App = [Microsoft.Identity.Client.PublicClientApplication]::new($Authority, $clientid)
        $App.RedirectUri = $redirecturi
        $Result = ($app.AcquireTokenAsync($Scopes)).Result
        $GraphAPIAuthenticationHeader = $null
        $GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
        $GraphAPIAuthenticationHeader.Add("Authorization", "Bearer $($Result.Token)")
        $Global:GraphAuthenticationHash = @{
                'Parameters' = @{
                'TenantName' = $TenantName
                'Credential' = $Credential
                'clientID' = $clientid
                'redirecturi' = $redirecturi
            }
            'Token' = $Result.Token
            'Header' = $GraphAPIAuthenticationHeader
        }
    }
}

Function Invoke-GraphMethod {
<#
    .SYNOPSIS
        Will run specified graph query with REST.

    .DESCRIPTION
        Handles the authentication piece assuming Get-GraphAuthenticationToken was already called once before in the PowerShell session.

    .EXAMPLE
        Invoke-GraphMethod -Method 'Post' -Version 'beta' -query 'deviceAppManagement/mobileApps' -body $AppJSON -ContentType 'application/json'
        This will create an application in Graph.

    .EXAMPLE
        Invoke-GraphMethod -Query 'me/messages' -Search 'from:help@contoso.com' -Select 'from,subject'
        Searches all messages in the current authenticated user mailbox for ones from e-mail help@contoso.com. Only will return the properties from and subject

    .PARAMETER Query
        The the query parameter of the URI - For example, in https://graph.microsoft.com/v1.0/messages "messages" is the query. To call this, simply call Invoke-GraphMethod like this:
        Invoke-GraphMethod -Query "messages"

    .PARAMETER Version
        Not required - Used to specify v1.0 or beta. Defaults to v1.0

    .PARAMETER Method
        REST method to use. 

    .PARAMETER Body
        Content body for REST method

    .PARAMETER ContentType
        Type of content for body

    .PARAMETER Filter
        Filters the response based on a set of criteria.

    .PARAMETER Search
        A property and value pair separated by a colon.

    .PARAMETER Select
        Comma-separated list of properties to include in the response.

    .PARAMETER Expand
        Comma-separated list of relationships to expand and include in the response.

    .PARAMETER OrderBy
        Comma-separated list of properties that are used to sort the order of items in the response collection.

    .PARAMETER Top
        The number of items to return in a result set.

    .PARAMETER Skip
        The number of items to skip in a result set.

    .PARAMETER SkipToken
        Paging token that is used to get the next set of results.

    .PARAMETER Count
        A collection and the number of items in the collection.

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $query,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $Version = 'v1.0',
        [Parameter(Mandatory=$false)]
        [ValidateSet(
            'Default',
            'Delete',
            'Get',
            'Head',
            'Merge',
            'Options',
            'Patch',
            'Post',
            'Put',
            'Trace'
        )]
        $method = 'Get',
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $body,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $ContentType,
        [Parameter(Mandatory=$false)]
        $filter,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $search,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $select,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $expand,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $orderby,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$top,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$skip,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $skipToken,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[bool]]$count
    )
    
    try {
        if ($null -ne $Global:GraphAuthenticationHash) {
            $Parameters = $Global:GraphAuthenticationHash['Parameters']
            Get-GraphAuthenticationToken @Parameters
        }
        else {
            throw 'You must call Get-GraphAuthenticationToken first!'
        }
    }
    catch {
        Write-GraphLog -Exception $_
        break
    }

    $uri = "https://graph.microsoft.com/$($version)/$($query)?"

    if(-not [string]::IsNullOrEmpty($Filter)) {
        $uri = "$($uri)`$filter=$($Filter.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($search)) {
        $uri = "$($uri)`$search=`"$($search.replace(' ','%20').replace("'",'%27'))`"&"
    }

    if(-not [string]::IsNullOrEmpty($select)) {
        $uri = "$($uri)`$select=$($select.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($expand)) {
        $uri = "$($uri)`$expand=$($expand.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($orderby)) {
        $uri = "$($uri)`$orderby=$($orderby.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($top)){
        $uri = "$($uri)`$top=$($top)&"
    }

    if(-not [string]::IsNullOrEmpty($skip)){
        $uri = "$($uri)`$skip=$($skip)&"
    }

    if(-not [string]::IsNullOrEmpty($skipToken)) {
        $uri = "$($uri)`$skipToken=$($skip)&"
    }

    if($count) {
        $uri = "$($uri)`$count=true&"
    }

    $uri = ($uri.TrimEnd('&')).TrimEnd('?')

    $RestParams = @{
        'Method' = $method
    }

    if(-not [string]::IsNullOrEmpty($body)) {
        $RestParams['Body'] = $body
    }
    if(-not [string]::IsNullOrEmpty($ContentType)) {
        $RestParams['ContentType'] = $ContentType
    }
    try {
        $returned = Invoke-RestMethod -Uri $uri -Headers $Global:GraphAuthenticationHash['Header'] @RestParams
        if([string]::IsNullOrEmpty($returned.Value)) {
            $returned
        }
        else {
            $returned.Value
        }
    }
    catch {
        Write-GraphLog -Exception $_
    }
    <#
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
    }#>
}

Function Get-GraphMetadata {
    param(
        $Version = 'v1.0'
    )
    (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/$($Version)/`$metadata" -Headers $Global:GraphAuthenticationHash['Header'] ).Edmx.DataServices.Schema
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
       try{
           $tempObject.RawJSON = $object
       }
       catch { }
       return $tempObject
    }
    catch {
        throw $_
    }
}

Function Set-GraphHash {
    Param(
        $Hash,
        $Value,
        $Key
    )
    if(-not [string]::IsNullOrEmpty($Value)) {
        $Hash[$Key] = $Value
    }
    return $Hash
}

Function New-GraphDynamicParameter {
    [CmdletBinding()]
    param(
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [ValidateSet(
            'string',
            'int',
            'bool'
        )]
        [string]$Type,
        [string]$ParameterSetName = '__AllParameterSets',
        [bool]$Mandatory,
        [Nullable[int]]$Position,
        [bool]$ValueFromPipelineByPropertyName,
        [string]$HelpMessage = ' ',
        [Parameter(ParameterSetName='ValidateSet')]
        [string[]]$ValidateSet,
        [Parameter(ParameterSetName='ValidateSet')]
        [bool]$IgnoreCase = $true
    )
    $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
    $ParameterAttribute.ParameterSetName = $ParameterSetName
    $ParameterAttribute.Mandatory = $Mandatory
    $ParameterAttribute.Position = $Position
    $ParameterAttribute.ValueFromPipelineByPropertyName = $ValueFromPipelineByPropertyName
    $ParameterAttribute.HelpMessage = $HelpMessage
    $AttributeCollection = New-Object 'Collections.ObjectModel.Collection[System.Attribute]'
    $AttributeCollection.Add($ParameterAttribute)
    if ($PSCmdlet.ParameterSetName -eq 'ValidateSet') {
        $ParameterValidateSet = New-Object System.Management.Automation.ValidateSetAttribute -ArgumentList $ValidateSet -Strict (!$IgnoreCase)
        $AttributeCollection.Add($ParameterValidateSet)
    }
    $Parameter = New-Object System.Management.Automation.RuntimeDefinedParameter -ArgumentList @($Name, [type]$Type, $AttributeCollection)
    return $Parameter
}

$PowerShellFiles = Get-ChildItem $PSScriptRoot -Recurse -Filter "*.ps1"
Foreach($File in $PowerShellFiles) {
    If(-not $File.DirectoryName.EndsWith('Tests')){
        Import-Module $File.FullName
    }
}

$null = [System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Microsoft.Identity.Client\Microsoft.Identity.Client.Platform.dll")
$null = [System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Microsoft.Identity.Client\Microsoft.Identity.Client.dll")