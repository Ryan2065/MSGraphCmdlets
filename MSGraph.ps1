Function Import-GraphDLLs {
    $null = Add-Type -Path "$PSScriptRoot\DLLs\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
    $null = Add-Type -Path "$PSScriptRoot\DLLs\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
}

Function Test-GraphAuthenticationToken {
    If(($Global:GraphAPIAuthenticationHeader -eq $null) -or ($Global:GraphTenant -eq $null)) {
        Throw 'Authentication token not set! Please run Set-GraphAuthenticationToken before running any of the Graph cmdlets'
    }
}

Function Set-GraphAuthenticationToken {
    Param (
        [Parameter(Mandatory=$true)]
        $TenantName = $null,
        [switch]$Silent,
        [string]$Username,
        [string]$Password
    )
    
    $Global:GraphTenant = $TenantName
    $clientId = "1950a258-227b-4e31-a9cf-717495945fc2"
    $resourceAppIdURI = "https://graph.windows.net"
    $redirectUri = "urn:ietf:wg:oauth:2.0:oob"

    if(-not $Silent) {
        $authority = "https://login.windows.net/$TenantName"
        $Context = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority
        $Global:GraphAPIAuthenticationToken = $Context.AcquireToken($resourceAppIdURI, $clientId,$redirectUri, "Auto")
        $Global:GraphAPIAuthenticationHeader = @{
            'Content-Type'='application\json'
            'Authorization'=$Global:GraphAPIAuthenticationToken.CreateAuthorizationHeader()
        }
    }
    else {
        $PayLoad = "resource=https://graph.windows.net/&client_id=$($clientId)&grant_type=password&username=$($Username)&scope=openid&password=$($Password)"
        $Response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/Common/oauth2/token" -Method POST -Body $PayLoad
        $Script:ResponseJSON = $Response | ConvertFrom-Json
        $Global:GraphAPIAuthenticationHeader = $null
        $Global:GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
        $Global:GraphAPIAuthenticationHeader.Add("Authorization", "Bearer " + $ResponseJSON.access_token)
    }
}

Function Get-GraphMetadata {
    param(
        $Version = 'v1.0'
    )
    (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/$($Version)/`$metadata").Edmx.DataServices.Schema
}

Import-GraphDLLs

Import-Module "$PSScriptRoot\User.ps1"

$Global:GraphAPIVersion = '1.6'