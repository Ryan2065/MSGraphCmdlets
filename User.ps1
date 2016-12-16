

Function Get-GraphUsers {
    Param(
        [string]$Filter,
        [string]$UserId
    )

    try {
        if(-not [string]::IsNullOrEmpty($UserId)) {
            $UserId = $UserId.Replace('@','%40')
            Invoke-GraphMethod -query "users/$($UserId)" -filter $Filter -Scope 'User.ReadWrite.All'
        }
        else {
            Invoke-GraphMethod -query "users" -filter $Filter -Class 'Graphuser_v1' -Scope 'User.ReadWrite.All'
        }
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
