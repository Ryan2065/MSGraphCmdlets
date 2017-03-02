Function Get-GraphGroups {
    Param(
        [string]$Filter,
        [string]$GroupId,
        [string]$GraphVersion = 'v1.0'
    )

    try {
        if(-not [string]::IsNullOrEmpty($GroupId)) {
            Invoke-GraphMethod -query "groups/$($GroupId)" -filter $Filter -Version $GraphVersion
        }
        else {
            $Params = @{
                'query'='groups'
                'version'=$GraphVersion
            }
            if(-not [string]::IsNullOrEmpty($Filter)) {$Params['filter'] = $Filter}
            Invoke-GraphMethod @Params
        }
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}
