<#Function New-GraphIntuneDeviceProfile {
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateSet(
            'Android LOB App',
            'Android Store App',
            'iOS LOB App',
            'iOS Store App',
            'Web App',
            'Windows Phone 8.1 Store App',
            'Windows Store App'
        )]
        [string]$ApplicationType
    )
}#>