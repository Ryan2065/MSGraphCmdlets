Function Get-GraphIntuneVersion {
<#
    .SYNOPSIS
        Helper function for Graph version

    .DESCRIPTION
        Help function so the version info only needs to be changed in one spot when Intune switches from beta to v1.0

    .EXAMPLE
        Get-GraphIntuneVersion

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    return 'beta'
}