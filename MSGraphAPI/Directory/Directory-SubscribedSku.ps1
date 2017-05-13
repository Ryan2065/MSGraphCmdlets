Function Get-GraphSubscribedSkus {
<#
    .SYNOPSIS
        Will list subscribedSkus from Graph

    .DESCRIPTION
        Contains information about a service SKU that a company is subscribed to.
        Only the read operation is supported on subscribed SKUs; create, update, and delete are not supported. Query filter expressions are not supported.

    .EXAMPLE
        Get-GraphSubscribedSkus

    .PARAMETER Filter
        Filters results
    
    .PARAMETER Id
        Searches for specific SubscribedSku

    .PARAMETER GraphVersion
        Specifies the Graph version

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/resources/subscribedsku
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param (
        [string]$Filter,
        [string]$Id,
        [string]$GraphVersion = 'v1.0'
    )
    try {
        if(-not [string]::IsNullOrEmpty($Id)) {
            Invoke-GraphMethod -query "subscribedskus/$($Id)" -filter $Filter -Version $GraphVersion
        }
        else {
            $Params = @{
                'query'='subscribedskus'
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