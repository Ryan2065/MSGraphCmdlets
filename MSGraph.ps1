Function Import-GraphDLL {
    $null = Add-Type -Path "$PSScriptRoot\DLLs\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
    $null = Add-Type -Path "$PSScriptRoot\DLLs\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
}

Function Get-GraphAuthenticationToken {
<#
    .SYNOPSIS
        Used to get the authentication token to Microsoft Graph
 
    .DESCRIPTION
        Creates an OAuth 2.0 token through https://login.microsoftonline.com. If silent is not used, it will prompt
        you for credentials. 
   
    .EXAMPLE
        Get-GraphAuthenticationToken -TenantName 'MOD675166.onmicrosoft.com'
        This will prompt you for your username and password. If this is your first time running the cmdlets, it will
        also prompt for permissions to your domain. This must be done by a domain admin.

    .EXAMPLE
        Get-GraphAuthenticationToken -TenantName 'MOD675166.onmicrosoft.com' -ClientID 'GUID' -ClientSecret 'SECRET' -redirectURI 'http://uri.com'
        This is the same as the above example, except it passes in a custom clientid and secret. You will need to use this
        if you want to use a custom application instead of the one provided. It is recommended to do this to increase security
        in your environment. See the wiki for instructions on how to do this.

    .EXAMPLE
        Get-GraphAuthenticationToken -TenantName 'MOD675166.onmicrosoft.com' -Silent -UserName 'USERNAME' -Password 'PASSWORD'
        This will silently get the token using the default clientid and secret. If this is the first time the cmdlets are being
        run in the environment, you will need to use the first example to give permissions, then you can use silent.
 
    .PARAMETER TenantName
        The name of your tenant

    .PARAMETER Silent
        Switch to run without username / password prompt. Requires username & password.

    .PARAMETER Username
        Only used with the Silent switch. Your username in the form of "username@Tenant"

    .PARAMETER Password
        Password for the above username. String variable. Password is sent encrypted as https, but it's a string value that's sent.

    .PARAMETER clientid
        Required if you are using a custom Azure Application. They are free to set up and more secure than using the built in one, so it's
        recommended. Look at the wiki for instructions on how to set it up.

    .PARAMETER clientsecret
        Required if you are using a custom Azure Application. They are free to set up and more secure than using the built in one, so it's
        recommended. Look at the wiki for instructions on how to set it up.

    .PARAMETER redirectUri
        Required if you are using a custom Azure Application. They are free to set up and more secure than using the built in one, so it's
        recommended. Look at the wiki for instructions on how to set it up.

    .NOTES
        AUTHOR: Ryan Ephgrave
        LASTEDIT: 12/14/2016 19:09:06
 
   .LINK
        https://github.com/Ryan2065/MSGraphCmdlets/wiki/Getting-Started
#>
    Param (
        [Parameter(Position=0, Mandatory=$true)][string]$TenantName,
        [Parameter(Position=1, Mandatory=$false)][guid]$clientid = 'e47b7b33-9bee-43b1-9635-9f94166b3873',
        [Parameter(Position=2, Mandatory=$false)][string]$clientsecret = 'QU2KWsEQHoOOmuoVQvS3NMQ',
        [Parameter(Position=3, Mandatory=$false)][string]$redirectUri = 'https://github.com/Ryan2065/MSGraphCmdlets',
        [Parameter(ParameterSetName='Silent', Mandatory=$false)][switch]$Silent,
        [Parameter(ParameterSetName='Silent', Mandatory=$false)][string]$Username,
        [Parameter(ParameterSetName='Silent', Mandatory=$false)][securestring]$Password,
        [Parameter(ParameterSetName='Silent', Mandatory=$false)][string]$scope = 'openid'
    )

    $Marshal = [System.Runtime.InteropServices.Marshal]
    $Bstr = $Marshal::SecureStringToBSTR($Password)
    $Password = $Marshal::PtrToStringAuto($Bstr)
    $Marshal::ZeroFreeBSTR($Bstr)

    $resourceAppIdURI = "https://graph.microsoft.com"
    if(-not $Silent) {
        $authority = "https://login.microsoftonline.com/$TenantName"
        $Context = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority
        $GraphAPIAuthenticationToken = $Context.AcquireToken($resourceAppIdURI, $clientId, $redirectUri, "Auto")
        $Global:GraphAuthenticationHash = @{
            'Parameters' = @{
                'TenantName' = $TenantName
                'clientid' = $clientid
                'clientsecret' = $clientsecret
                'redirecturi' = $redirectUri
                'Silent' = $false
            }
            'Token' = $GraphAPIAuthenticationToken
            'Header' =  @{
                'Content-Type'='application\json'
                'Authorization'=$GraphAPIAuthenticationToken.CreateAuthorizationHeader()
            }
        }
    }
    else {
        $PayLoad = "resource=https://graph.microsoft.com/&client_id=$($clientId)&client_secret=$($clientsecret)&grant_type=password&username=$($Username)&scope=$($scope)&password=$($Password)"
        $Response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/Common/oauth2/token" -Method POST -Body $PayLoad
        $ResponseJSON = $Response | ConvertFrom-Json
        $GraphAPIAuthenticationHeader = $null
        $GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
        $GraphAPIAuthenticationHeader.Add("Authorization", "Bearer " + $ResponseJSON.access_token)
        $Global:GraphAuthenticationHash = @{
                'Parameters' = @{
                'TenantName' = $TenantName
                'Username' = $Username
                'Password' = $Password
                'clientid' = $clientid
                'clientsecret' = $clientsecret
                'redirecturi' = $redirectUri
                'Silent' = $true
            }
            'Token' = $ResponseJSON.access_token
            'Header' = $GraphAPIAuthenticationHeader
        }
    }
}

Function Invoke-GraphMethod {
    param(
        $Version = 'v1.0',
        $query,
        $filter,
        $Class,
        $scope
    )
    
    if ($null -ne $Global:GraphAuthenticationHash.Parameters['TenantName']) {
        $Parameters = $Global:GraphAuthenticationHash['Parameters']
        Get-GraphAuthenticationToken @Parameters -scope $scope
    }

    $uri = "https://graph.microsoft.com/$($version)/$($query)"
    if(-not [string]::IsNullOrEmpty($Filter)) {
        $uri = $uri + "&`$filter=$($Filter)"
    }
    $returned = Invoke-RestMethod -Method Get -Uri $uri -Headers $Global:GraphAuthenticationHash['Header']
    $returnedvalue = $returned.value
    foreach($instance in $returnedvalue) {
        if(-not [string]::IsNullOrEmpty($Class)) {
            Get-GraphClass -Class $Class -object $instance
        }
        else {
            $instance
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

Import-GraphDLL

Import-Module "$PSScriptRoot\User.ps1"

Import-Module "$PSScriptRoot\Classes_v1.ps1"
