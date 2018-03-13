Function Connect-MSGraphAPI {
    [CmdletBinding(DefaultParameterSetName='GetGraphClientByUserAndPassword')]
    Param(
        [Parameter(Mandatory=$true, ParameterSetName='GetGraphClientByUserAndPassword')]
            [string]$Tenant,
        [Parameter(Mandatory=$true, ParameterSetName='GetGraphClientByUserAndPassword')]
            [string]$ClientId,
        [Parameter(Mandatory=$true, ParameterSetName='GetGraphClientByUserAndPassword')]
            [string]$RedirectURI,
        [Parameter(Mandatory=$true, ParameterSetName='GetGraphClientByUserAndPassword')]
            [string]$Resource,
        [Parameter(Mandatory=$true, ParameterSetName='GetGraphClientByUserAndPassword')]
            [pscredential]$Credential
    )
    if($PSCmdlet.ParameterSetName -eq 'GetGraphClientByUserAndPassword'){
        $token = [MSGraphAPI.ConnectADAL]::GetGraphClientByUserAndPassword(
            $Tenant,
            $ClientId,
            $RedirectURI,
            $Resource,
            $Credential.UserName,
            $Credential.GetNetworkCredential().SecurePassword
        )
        $Header = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
        $null = $Header.Add("Authorization", "Bearer $($token.AccessToken)")
        $Script:MSGraphAPISettings = New-Object -TypeName MSGraphAPISettings -Property @{
            AuthorizationHeader = $Header
            ConnectParameters = @{
                Tenant = $Tenant
                ClientId = $ClientId
                RedirectURI = $RedirectURI
                Resource = $Resource
                Credential = $Credential
            }
            ExpiresOn = $Token.ExpiresOn.UtcDateTime
        }
    }
}

