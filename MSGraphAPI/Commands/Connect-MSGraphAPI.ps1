Function Connect-MSGraphAPI {
    Param(
        [string]$Tenant,
        [string]$ClientId,
        [string]$RedirectURI,
        [string]$Resource,
        [pscredential]$Credential,
        [ValidateSet('v1.0', 'beta')]
        [string]$GraphEndpoint = 'v1.0',
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