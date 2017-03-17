Function Get-GraphDevices {
<#
    .SYNOPSIS
        Will get all the devices by querying Microsoft Graph

    .DESCRIPTION
        Queries for devices

    .EXAMPLE
        Get-GraphDevices
        This will list all devices the authenticated user can see in Azure

    .PARAMETER Filter
        This parameter will allow you to search for a device by name

    .PARAMETER DeviceId
        Specify the Id of the Device to get only one Id

    .PARAMETER GraphVersion
        By default this only searches for devices in v1.0. If you want to access the beta features, use Beta

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/api/device_list
    
    .Notes
        Ryan Ephgrave
        
#>
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
