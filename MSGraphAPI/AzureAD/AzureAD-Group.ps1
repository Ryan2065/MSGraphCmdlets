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
