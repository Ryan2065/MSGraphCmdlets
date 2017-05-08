Function Get-GraphDeviceConfigurationAssignments {
<#
    .SYNOPSIS
        Will query Microsoft Graph for a list of deviceConfigurationAssignments

    .DESCRIPTION
        Will query Microsoft Graph for a list of deviceConfigurationAssignments

    .EXAMPLE
        Function Get-GraphDeviceConfigurationAssignments

    .PARAMETER Id
        Gets specified object based on Id.

    .PARAMETER Filter
        Filters the response based on a set of criteria.

    .PARAMETER Search
        A property and value pair separated by a colon.

    .PARAMETER Select
        Comma-separated list of properties to include in the response.

    .PARAMETER Expand
        Comma-separated list of relationships to expand and include in the response.

    .PARAMETER OrderBy
        Comma-separated list of properties that are used to sort the order of items in the response collection.

    .PARAMETER Top
        The number of items to return in a result set.

    .PARAMETER Skip
        The number of items to skip in a result set.

    .PARAMETER Count
        A collection and the number of items in the collection.



    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets/wiki/Function Get-GraphDeviceConfigurationAssignments
    
    .Notes
        Author: Ryan Ephgrave
#>
Param(
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [ValidateNotNullOrEmpty()]
        [string]$filter,
        [ValidateNotNullOrEmpty()]
        [string]$search,
        [ValidateNotNullOrEmpty()]
        [string]$select,
        [ValidateNotNullOrEmpty()]
        [string]$expand,
        [ValidateNotNullOrEmpty()]
        [string]$orderby,
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$top,
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$skip,
        [ValidateNotNullOrEmpty()]
        [Nullable[bool]]$count,
        [ValidateNotNullOrEmpty()]
        [string]$Version = 'beta'
    )

    $ParamHash = @{
        'Version'=$Version
    }
    if($Id) {
        $ParamHash['query'] = "deviceConfigurationAssignments/$($Id)"
    }
    else {
        $ParamHash['query'] = 'deviceConfigurationAssignments'
    }
    if(-not [string]::IsNullOrEmpty($Filter)){
        $ParamHash['Filter'] = $Filter
   }
    if(-not [string]::IsNullOrEmpty($Search)){
        $ParamHash['Search'] = $Search
   }
    if(-not [string]::IsNullOrEmpty($Select)){
        $ParamHash['Select'] = $Select
   }
    if(-not [string]::IsNullOrEmpty($Expand)){
        $ParamHash['Expand'] = $Expand
   }
    if(-not [string]::IsNullOrEmpty($OrderBy)){
        $ParamHash['OrderBy'] = $OrderBy
   }
    if(-not [string]::IsNullOrEmpty($Top)){
        $ParamHash['Top'] = $Top
   }
    if(-not [string]::IsNullOrEmpty($Skip)){
        $ParamHash['Skip'] = $Skip
   }
    if(-not [string]::IsNullOrEmpty($Count)){
        $ParamHash['Count'] = $Count
   }


    Invoke-GraphMethod @ParamHash


}

