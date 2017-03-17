Function Get-GraphSubscribedSkus {
<#
    .SYNOPSIS
        Will list subscribedSkus from Graph

    .DESCRIPTION
        Contains information about a service SKU that a company is subscribed to.
        Only the read operation is supported on subscribed SKUs; create, update, and delete are not supported. Query filter expressions are not supported.

    .EXAMPLE
        Get-GraphSubscribedSkus

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/resources/subscribedsku
    
    .Notes
        Author: Ryan Ephgrave
#>
    Invoke-GraphMethod -query 'subscribedskus'

}