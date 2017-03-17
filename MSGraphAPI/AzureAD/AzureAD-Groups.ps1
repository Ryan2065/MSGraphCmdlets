Function Get-GraphGroups {
<#
    .SYNOPSIS
        Querys the Groups endpoint to get a list of Azure AD groups

    .DESCRIPTION
        Queries groups in Azure AD

    .EXAMPLE
        Get-GraphGroups -Filter "startswith(displayName,'Sec')"

    .PARAMETER Filter
        Use OData filter query. Additional documentation found here: https://developer.microsoft.com/en-us/graph/docs/overview/query_parameters

    .PARAMETER GroupId
        Query a specific group by Id

    .PARAMETER GraphVersion
        Graph version to query. Acceptible values are v1.0 or beta

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/api/group_list
    
    .Notes
        Author: Ryan Ephgrave
#>
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
