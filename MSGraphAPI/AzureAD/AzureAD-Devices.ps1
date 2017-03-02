Function Get-GraphDevices {
    Param(
        [string]$Filter,
        [string]$DeviceId,
        [string]$GraphVersion = 'v1.0'
    )

    try {
        if(-not [string]::IsNullOrEmpty($DeviceId)) {
            Invoke-GraphMethod -query "devices/$($DeviceId)" -filter $Filter -Version $GraphVersion
        }
        else {
            $Params = @{
                'query'='Devices'
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
