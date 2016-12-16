Function Get-GraphGroups {
    Param(
        [string]$Filter
    )
    try {
        Test-GraphAuthenticationToken
        #$uri = "https://graph.windows.net/$($Global:GraphTenant)/groups?api-version=1.6"
        $uri = "https://graph.microsoft.com/v1.0/users"
        if(-not [string]::IsNullOrEmpty($Filter)) {
            $uri = $uri + "&`$filter=$($Filter)"
        }
        $returned = (Invoke-RestMethod -Method Get -Uri $uri -Headers $Global:GraphAPIAuthenticationHeader).value
        foreach($instance in $returned) {
            #Create-GraphClass -Metadata $instance -version 'v1'
            $instance
        }
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}