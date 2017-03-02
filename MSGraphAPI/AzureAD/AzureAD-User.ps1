Function Get-GraphUsers {
    Param(
        [string]$Filter,
        [string]$UserId
    )

    try {
        if(-not [string]::IsNullOrEmpty($UserId)) {
            $UserId = $UserId.Replace('@','%40')
            Invoke-GraphMethod -query "users/$($UserId)" -filter $Filter
        }
        else {
            Invoke-GraphMethod -query "users" -filter $Filter
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
        [string]$Pass,
        [Parameter(Mandatory=$false)]
        [bool]$forceChangePasswordNextLogin = $true,
        [Parameter(Mandatory=$true)]
        $MailNickName
    )
    try {
        [hashtable]$UserHashTable = @{
            'accountEnabled'=$accountEnabled
            'displayName'=$displayName
            'mailNickname'=$MailNickName
            'userPrincipalName'=$userPrincipalName
            'passwordProfile'=@{
                                'password'=$Pass
                                'forceChangePasswordNextSignIn'=$forceChangePasswordNextLogin
                             }
            
        }
        $UserJSON = $UserHashTable | ConvertTo-Json -Depth 10
        Invoke-GraphMethod -Method 'Post' -query 'users' -body $UserJSON -ContentType 'application/json'
    }
    catch {
        Write-GraphLog -Exception $_
    }
}
