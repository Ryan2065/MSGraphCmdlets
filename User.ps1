Function Get-GraphUsers {
    Param(
        [string]$Filter,
        [string]$UserId
    )

    try {
        Test-GraphAuthenticationToken
        if(-not [string]::IsNullOrEmpty($UserId)) {
            $UserId = $UserId.Replace('@','%40')
            $uri = "https://graph.windows.net/$($Global:GraphTenant)/users/$($UserId)?api-version=1.6"
        }
        else {
            $uri = "https://graph.windows.net/$($Global:GraphTenant)/users?api-version=1.6"
            if(-not [string]::IsNullOrEmpty($Filter)) {
                $uri = $uri + "&`$filter=$($Filter)"
            }
        }
        (Invoke-RestMethod -Method Get -Uri $uri -Headers $Global:GraphAPIAuthenticationHeader).value
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}

Function New-GraphUser {
    Param (
        [Parameter(Mandatory=$false)]
        [bool]$accountEnabled = $true,
        [Parameter(Mandatory=$true)]
        [string]$userPrincipalName,
        [Parameter(Mandatory=$true)]
        [string]$displayName,
        [Parameter(Mandatory=$true)]
        [string]$password,
        [Parameter(Mandatory=$false)]
        [bool]$forceChangePasswordNextLogin = $true,
        [Parameter(Mandatory=$false)]
        [hashtable]$additionalProperties = $null,
        [Parameter(Mandatory=$true)]
        $MailNickName
    )
    try {
        Test-GraphAuthenticationToken
        [hashtable]$UserHashTable = @{
            'accountEnabled'=$accountEnabled
            'userPrincipalName'=$userPrincipalName
            'displayName'=$displayName
            'passwordProfile'=@{
                                'password'=$password
                                'forceChangePasswordNextLogin'=$forceChangePasswordNextLogin
                             }
            'mailNickname'=$MailNickName
        }
        if($additionalProperties -ne $null) {
            foreach($key in $additionalProperties.Keys) {
                if($UserHashTable.ContainsKey($key)) {
                    $UserHashTable.Remove($key)
                }
            }
            $UserHashTable = $UserHashTable + $additionalProperties
        }
        $UserJSON = $UserHashTable | ConvertTo-Json -Depth 10

        $uri = "https://graph.windows.net/$($Global:GraphTenant)/users?api-version=1.6"
        Invoke-RestMethod -Uri $uri -Headers $Global:GraphAPIAuthenticationHeader -Method Post -Body $UserJSON -ContentType 'application/json' 
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}

Function Set-GraphUserProperties {
    Param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Properties = $null,
        [Parameter(Mandatory=$true)]
        [string]$UserId
    )

}