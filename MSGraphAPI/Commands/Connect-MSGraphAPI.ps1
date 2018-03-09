Function Connect-MSGraphAPI {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Tenant,
        [Parameter(Mandatory=$true)]
        [string]$ClientId,
        [Parameter(Mandatory=$true)]
        [string]$RedirectURI,
        [Parameter(Mandatory=$true)]
        [string]$Resource,
        [Parameter(Mandatory=$true)]
        [pscredential]$Credential,
        [ValidateSet('v1.0', 'beta')]
        [string]$GraphEndpoint = 'v1.0',
        [Parameter(Mandatory=$false)]
        [switch]$ReturnClientObject
    )
    $Script:MSGraphClient = [MSGraphAPI.ConnectADAL]::GetGraphClientByUserAndPassword(
        $Tenant,
        $ClientId,
        $RedirectURI,
        $Resource,
        $Credential.UserName,
        $Credential.GetNetworkCredential().SecurePassword,
        $GraphEndpoint
    )
    if($ReturnClientObject){
        return $Script:MSGraphClient
    }
}