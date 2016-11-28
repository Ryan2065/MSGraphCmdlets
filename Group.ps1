Function Get-GraphGroups {
    Params(
        [string]$Filter
    )
    try {
        Test-GraphAuthenticationToken
        $uri = "https://graph.windows.net/$($Global:GraphTenant)/groups?api-version=1.6"
        if(-not [string]::IsNullOrEmpty($Filter)) {
            $uri = $uri + "&`$filter=$($Filter)"
        }
        (Invoke-RestMethod -Method Get -Uri $uri -Headers $Global:GraphAPIAuthenticationHeader).value
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}