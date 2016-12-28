Function Get-GraphGroups {
    Param(
        [string]$Filter,
        [string]$GroupId
    )
    try {
        if(-not [string]::IsNullOrEmpty($GroupId)) {
            $UserId = $UserId.Replace('@','%40')
            Invoke-GraphMethod -query "groups/$($GroupId)" -filter $Filter -Scope 'Group.Read.All'
        }
        else {
            Invoke-GraphMethod -query "groups" -filter $Filter -Scope 'Group.Read.All'
        }
    }
    catch {
        Write-Error -Message $_.Exception.Message
    }
}