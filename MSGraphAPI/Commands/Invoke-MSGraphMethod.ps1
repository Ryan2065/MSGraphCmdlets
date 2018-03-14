Function Invoke-MSGraphMethod {
    <#
        .SYNOPSIS
            Will run specified graph query with REST.
    
        .DESCRIPTION
            Handles the authentication piece assuming Get-GraphAuthenticationToken was already called once before in the PowerShell session.
    
        .EXAMPLE
            Invoke-GraphMethod -Method 'Post' -Version 'beta' -query 'deviceAppManagement/mobileApps' -body $AppJSON -ContentType 'application/json'
            This will create an application in Graph.
    
        .EXAMPLE
            Invoke-GraphMethod -Query 'me/messages' -Search 'from:help@contoso.com' -Select 'from,subject'
            Searches all messages in the current authenticated user mailbox for ones from e-mail help@contoso.com. Only will return the properties from and subject
    
        .PARAMETER Query
            The the query parameter of the URI - For example, in https://graph.microsoft.com/v1.0/messages "messages" is the query. To call this, simply call Invoke-GraphMethod like this:
            Invoke-GraphMethod -Query "messages"
    
        .PARAMETER Version
            Not required - Used to specify v1.0 or beta. Defaults to v1.0
    
        .PARAMETER Method
            REST method to use. 
    
        .PARAMETER Body
            Content body for REST method
    
        .PARAMETER ContentType
            Type of content for body
    
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
    
        .PARAMETER SkipToken
            Paging token that is used to get the next set of results.
    
        .PARAMETER Count
            A collection and the number of items in the collection.
    
        .LINK
            https://github.com/Ryan2065/MSGraphCmdlets
        
        .Notes
            Author: Ryan Ephgrave
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $query,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $Version = 'v1.0',
        [Parameter(Mandatory=$false)]
        [ValidateSet(
            'Default',
            'Delete',
            'Get',
            'Head',
            'Merge',
            'Options',
            'Patch',
            'Post',
            'Put',
            'Trace'
        )]
        $method = 'Get',
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $body,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $ContentType,
        [Parameter(Mandatory=$false)]
        $filter,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $search,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $select,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $expand,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $orderby,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$top,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$skip,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $skipToken,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[bool]]$count,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string[]]$scopes
    )
    #refresh the token if it needs to be refreshed
    if(Test-MSGraphAPIConnection){
        $uri = "https://graph.microsoft.com/$($version)/$($query)?"
        $BaseURI = $Query.TrimEnd('/')
        if(-not [string]::IsNullOrEmpty($Filter)) {
            $uri = "$($uri)`$filter=$([System.Web.HttpUtility]::UrlEncode($Filter))&"
        }
        if(-not [string]::IsNullOrEmpty($search)) {
            $uri = "$($uri)`$search=`"$([System.Web.HttpUtility]::UrlEncode($search))`"&"
        }
        if(-not [string]::IsNullOrEmpty($select)) {
            $uri = "$($uri)`$select=$([System.Web.HttpUtility]::UrlEncode($select))&"
        }
        if(-not [string]::IsNullOrEmpty($expand)) {
            $uri = "$($uri)`$expand=$([System.Web.HttpUtility]::UrlEncode($expand))&"
        }
        if(-not [string]::IsNullOrEmpty($orderby)) {
            $uri = "$($uri)`$orderby=$([System.Web.HttpUtility]::UrlEncode($orderby))&"
        }
        if(-not [string]::IsNullOrEmpty($top)){
            $uri = "$($uri)`$top=$($top)&"
        }
        if(-not [string]::IsNullOrEmpty($skip)){
            $uri = "$($uri)`$skip=$($skip)&"
        }
        if(-not [string]::IsNullOrEmpty($skipToken)) {
            $uri = "$($uri)`$skipToken=$([System.Web.HttpUtility]::UrlEncode($skip))&"
        }
        if($count) {
            $uri = "$($uri)`$count=true&"
        }
        $uri = ($uri.TrimEnd('&')).TrimEnd('?')
        $RestParams = @{
            'Method' = $method
        }
        if(-not [string]::IsNullOrEmpty($body)) {
            $RestParams['Body'] = $body
        }
        if(-not [string]::IsNullOrEmpty($ContentType)) {
            $RestParams['ContentType'] = $ContentType
        }
        $returned = Invoke-RestMethod -Uri $uri -Headers $Script:MSGraphAPISettings.AuthorizationHeader @RestParams
        if(-not [string]::IsNullOrEmpty($returned.'@odata.nextLink')){
            Get-GraphNextLink -NextLink $returned.'@odata.nextLink' -BaseURI $BaseURI
        }
        if($returned.Value) {
            New-MSGraphClassMember -Context $returned.'@odata.context' -InputObject $returned.Value -Version $Version -BaseURI $BaseURI
        }
        else {
            New-MSGraphClassMember -Context $returned.'@odata.context' -InputObject $returned -Version $Version -BaseURI $BaseURI
        }
    }
}

Function Get-GraphNextLink {
    <#
        .SYNOPSIS
            Will get the next page of results if there are additional pages

        .DESCRIPTION
            Will get the next page of results if there are additional pages

        .EXAMPLE
            Get-GraphNextLink -NextLink $returned.'@odata.nextLink'

        .PARAMETER NextLink
            Returned through a query when the results are > 100.

        .LINK
            https://github.com/Ryan2065/MSGraphCmdlets
        
        .Notes
            Author: Ryan Ephgrave
    #>
    Param(
        $NextLink,
        [string]$BaseURI
    )
    if(Test-MSGraphAPIConnection){
        $returned = Invoke-RestMethod -Uri $NextLink -Headers $Script:MSGraphAPISettings.AuthorizationHeader
        if(-not [string]::IsNullOrEmpty($returned.'@odata.nextLink')){
            Get-GraphNextLink -NextLink $returned.'@odata.nextLink'
        }
        if($returned.Value) {
            New-MSGraphClassMember -Context $returned.'@odata.context' -InputObject $returned.Value -Version $Version -BaseURI $BaseURI
        }
        else {
            New-MSGraphClassMember -Context $returned.'@odata.context' -InputObject $returned -Version $Version -BaseURI $BaseURI
        }
    }
}