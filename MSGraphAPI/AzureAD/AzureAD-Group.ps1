<#Function Get-GraphGroup {
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
<#    Param(
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
#>
Function New-GraphGroup {
    <#
        .SYNOPSIS
            Will create a new instance of Group
    
        .DESCRIPTION
            Will create a new instance of Group
    
        .EXAMPLE
            New-GraphGroup -PropertyHash ParamHash
    
        .PARAMETER PropertyHash
            Hashtable of properties to set

        .PARAMETER GraphVersion
            Version of graph

        .PARAMETER displayName
            The name to display in the address book for the group.

        .PARAMETER mailEnabled
            Set to true for mail-enabled groups. Set this to true if creating an Office 365 group. Set this to false if creating dynamic or security group.

        .PARAMETER mailNickname
            The mail alias for the group.

        .PARAMETER securityEnabled
            Set to true for security-enabled groups. Set this to true if creating a dynamic or security group. Set this to false if creating an Office 365 group.
    
        .Notes
            Author: Ryan Ephgrave
    #>
    Param(
        [Parameter(Mandatory=$false)]
        [hashtable]$PropertyHash,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$GraphVersion = 'v1.0',
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$displayName,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[bool]]$mailEnabled,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$mailNickname,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[bool]]$securityEnabled,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string[]]$groupTypes,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$description
    )

    $BodyHash = @{}

    if($PropertyHash) { $BodyHash = $PropertyHash }

    if(-not [string]::IsNullOrEmpty($displayName)) {
        $BodyHash['displayName'] = $displayName
    }

    if(-not [string]::IsNullOrEmpty($mailEnabled)) {
        $BodyHash['mailEnabled'] = $mailEnabled
    }

    if(-not [string]::IsNullOrEmpty($mailNickname)) {
        $BodyHash['mailNickname'] = $mailNickname
    }

    if(-not [string]::IsNullOrEmpty($securityEnabled)) {
        $BodyHash['securityEnabled'] = $securityEnabled
    }

    if(-not [string]::IsNullOrEmpty($groupTypes)) {
        $BodyHash['groupTypes'] = $groupTypes
    }

    if(-not [string]::IsNullOrEmpty($description)) {
        $BodyHash['description'] = $description
    }

    $BodyJson = ConvertTo-Json -InputObject $BodyHash

    Invoke-GraphMethod -method 'Post' -query 'Groups' -body $BodyJson -ContentType 'application/json'
}

Function Set-GraphGroup {
    <#
        .SYNOPSIS
            Will update a Group
    
        .DESCRIPTION
            Will update a Group
    
        .EXAMPLE
            Set-GraphGroup -PropertyHash ParamHash
    
        .PARAMETER PropertyHash
            Hashtable of properties to set

        .PARAMETER GraphVersion
            Version of graph
    
        .Notes
            Author: Ryan Ephgrave
    #>
    Param(
        [Parameter(Mandatory=$false)]
        [hashtable]$PropertyHash,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$GraphVersion = 'v1.0'
    )

    $BodyHash = @{}

    if($PropertyHash) { $BodyHash = $PropertyHash }

    $BodyJSON = $BodyHash | ConvertTo-Json -Depth 10

    Invoke-GraphMethod -method 'Patch' -query 'Groups' -body $BodyHash -ContentType 'application/json'
}