Function Import-GraphDLLs {
    $null = Add-Type -Path "$PSScriptRoot\DLLs\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"
    $null = Add-Type -Path "$PSScriptRoot\DLLs\Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll"
}

Function Test-GraphAuthenticationToken {
    If(($Global:GraphAPIAuthenticationToken -eq $null) -or ($Global:GraphAPIAuthenticationHeader -eq $null) -or ($Global:GraphTenant -eq $null)) {
        Throw 'Authentication token not set! Please run Set-GraphAuthenticationToken before running any of the Graph cmdlets'
    }
}

Function Set-GraphAuthenticationToken {
    Param (
        [Parameter(Mandatory=$true)]
        $TenantName = $null
    )
    $Global:GraphTenant = $TenantName
    $clientId = "1950a258-227b-4e31-a9cf-717495945fc2"
    $resourceAppIdURI = "https://graph.windows.net"
    $redirectUri = "urn:ietf:wg:oauth:2.0:oob"
    $authority = "https://login.windows.net/$TenantName"
    $Context = New-Object "Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext" -ArgumentList $authority
    $Global:GraphAPIAuthenticationToken = $Context.AcquireToken($resourceAppIdURI, $clientId,$redirectUri, "Auto")
    $Global:GraphAPIAuthenticationHeader = @{
        'Content-Type'='application\json'
        'Authorization'=$Global:GraphAPIAuthenticationToken.CreateAuthorizationHeader()
    }
}

Import-GraphDLLs

Import-Module "$PSScriptRoot\AzureActiveDirectory\Graph-AzureActiveDirectory.ps1"

$Global:GraphAPIVersion = '1.6'