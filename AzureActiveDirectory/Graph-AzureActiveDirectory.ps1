Function Get-GraphADUsers {
    Param(
        [string]$Filter
    )

    try {
        Test-GraphAuthenticationToken
        $uri = "https://graph.windows.net/$($Global:GraphTenant)/users?api-version=$($Global:GraphAPIVersion)"
        if(-not [string]::IsNullOrEmpty($Filter)) {
            $uri = $uri + "&`$filter=$($Filter)"
        }
        (Invoke-RestMethod -Method Get -Uri $uri -Headers $Global:GraphAPIAuthenticationHeader).value
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}

Function New-GraphADUser {
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
        [hashtable]$additionalProperties = $null
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
        }
        if($additionalProperties -ne $null) {
            foreach($key in $additionalProperties.Keys) {
                if($UserHashTable.ContainsKey($key)) {
                    $UserHashTable.Remove($key)
                }
            }
            $UserHashTable = $UserHashTable + $additionalProperties
        }
        $UserJSON = $UserHashTable | ConvertTo-Json

        $uri = "https://graph.windows.net/$($Global:GraphTenant)/users?api-version=$($Global:GraphAPIVersion)"
        Invoke-RestMethod -Uri $uri -Headers $Global:GraphAPIAuthenticationHeader -Method Post -Body $UserJSON -ContentType 'application/json' 
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}