Function New-GraphIntuneApp {
<#
    .SYNOPSIS
        Creates a Intune App through Graph

    .DESCRIPTION
        Creates an Intune app. Currently in Beta through Graph

    .EXAMPLE
        New-GraphIntuneApp -ApplicationType 'Android Store App' -DisplayName 'Candy Crush' -Description 'A game that shouldn't be installed many places' -publisher 'Candy Crush Publisher' -minimumSupportedAndroidOS 'v4_1' -appStoreUrl 'https://play.google.com/store/apps/details?id=com.king.candycrushsaga'

    .PARAMETER ApplicationType
        What type of application to create.

    .PARAMETER DisplayName
        The admin provided or imported title of the app. 

    .PARAMETER Description
        The description of the app. 

    .PARAMETER publisher
        The publisher of the app

    .PARAMETER appStoreUrl
        The app store URL for the type of app being created

    .PARAMETER minimumSupportedAndroidOS
        Minimum supported OS for the Android app

    .PARAMETER minimumSupportediOS
        Minimum supported OS for iOS app

    .PARAMETER iosDeviceType
        iOS type required for app.

    .PARAMETER iconType
        file type of icon being uploaded.
    
    .PARAMETER iconBase64
        Icon content in base64
    
    .PARAMETER isFeatured
        Is the icon featured.
    
    .PARAMETER WebAppURL
        App url for web app. 
    
    .PARAMETER UseManagedBrowser
        Is managed browser required for web app

    .PARAMETER InformationURL
        Information URL
    
    .PARAMETER PrivacyURL
        Privacy URL
    
    .PARAMETER Developer
        Developer of application
    
    .PARAMETER Owner
        Owner of the application
    
    .PARAMETER Notes
        App notes

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/beta/resources/intune_apps_app_conceptual
    
    .Notes
        Author: Ryan Ephgrave
#>
    [CmdletBinding()]
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
        [string]$ApplicationType,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        [string]$DisplayName,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Description,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        [string]$publisher,
        [Parameter(ParameterSetName='AndroidStoreApp', Mandatory=$true)]
        [Parameter(ParameterSetName='iOSStoreApp', Mandatory=$true)]
        [Parameter(ParameterSetName='WindowsPhoneStoreApp', Mandatory=$true)]
        [Parameter(ParameterSetName='WindowsStoreApp', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$appStoreUrl,
        [Parameter(ParameterSetName='AndroidStoreApp', Mandatory=$true)]
        [Parameter(ParameterSetName='AndroidLOBApp', Mandatory=$true)]
        [ValidateSet(
            'v4_0',
            'v4_0_3',
            'v4_1',
            'v4_2',
            'v4_3',
            'v4_4',
            'v5_0',
            'v5_1'
        )]
        [string]$minimumSupportedAndroidOS,
        [Parameter(ParameterSetName='iOSStoreApp', Mandatory=$true)]
        [Parameter(ParameterSetName='iOSLOBApp', Mandatory=$true)]
        [ValidateSet(
            'v8_0',
            'v9_0',
            'v10_0'
        )]
        [string]$minimumSupportediOS,
        [Parameter(ParameterSetName='iOSStoreApp', Mandatory=$true)]
        [Parameter(ParameterSetName='iOSLOBApp', Mandatory=$true)]
        [ValidateSet(
            'iPad',
            'iPhone',
            'Both'
        )]
        [string]$iosDeviceType,
        [string]$iconType,
        [string]$iconBase64,
        [bool]$isFeatured = $false,
        [Parameter(ParameterSetName='WebApp', Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$WebAppURL,
        [Parameter(ParameterSetName='WebApp', Mandatory=$false)]
        [bool]$UseManagedBrowser,
        [ValidateNotNullOrEmpty()]
        [string]$InformationURL,
        [ValidateNotNullOrEmpty()]
        [string]$PrivacyURL,
        [ValidateNotNullOrEmpty()]
        [string]$Developer,
        [ValidateNotNullOrEmpty()]
        [string]$Owner,
        [ValidateNotNullOrEmpty()]
        [string]$Notes
    )
        [hashtable]$AppHashTable = @{}
        $AppHashTable['displayName'] = $DisplayName
        $AppHashTable['description'] = $Description
        $AppHashTable['publisher'] = $publisher
        $AppHashTable['isFeatured'] = $isFeatured
        switch($ApplicationType) {
            'Android LOB App' {
                $AppHashTable['@odata.type'] = '#microsoft.graph.androidLobApp'
                Write-Host 'This is not supported yet...'
            }
            'iOS LOB App'{

            }
            'Android Store App' {
                $AppHashTable['@odata.type'] = '#microsoft.graph.androidStoreApp'
                $AppHashTable['appStoreUrl'] = $appStoreUrl
                $AppHashTable['minimumSupportedOperatingSystem'] = @{
                    '@odata.type' = '#microsoft.graph.androidMinimumOperatingSystem'
                    "$minimumSupportedAndroidOS" = $true
                }
            }
            'iOS Store App' {
                $AppHashTable['@odata.type'] = '#microsoft.graph.iosStoreApp'
                $AppHashTable['appStoreUrl'] = $appStoreUrl
                $AppHashTable['minimumSupportedOperatingSystem'] = @{
                    '@odata.type' = '#microsoft.graph.iosMinimumOperatingSystem'
                    "$minimumSupportediOS" = $true
                }
                Switch($iosDeviceType) {
                    'iPad' {
                        $AppHashTable['applicableDeviceType'] = @{
                            '@odata.type' = '#microsoft.graph.iosDeviceType'
                            "iPad" = $true
                        }
                    }
                    'iPhone' {
                        $AppHashTable['applicableDeviceType'] = @{
                            '@odata.type' = '#microsoft.graph.iosDeviceType'
                            "iPhoneAndIPod" = $true
                        }
                    }
                    'Both' {
                        $AppHashTable['applicableDeviceType'] = @{
                            '@odata.type' = '#microsoft.graph.iosDeviceType'
                            "iPhoneAndIPod" = $true
                            "iPad" = $true
                        }
                    }
                }
            }
            'Web App' {
                $AppHashTable['@odata.type'] = '#microsoft.graph.webApp'
                $AppHashTable['useManagedBrowser'] = $UseManagedBrowser
                $AppHashTable['appUrl'] = $WebAppURL
            }
            'Windows Phone 8.1 Store App' {
                $AppHashTable['@odata.type'] = '#microsoft.graph.windowsPhone81StoreApp'
                $AppHashTable['appStoreUrl'] = $appStoreUrl
            }
            'Windows Store App' {
                $AppHashTable['@odata.type'] = '#microsoft.graph.windowsStoreApp'
                $AppHashTable['appStoreUrl'] = $appStoreUrl
            }
        }
        if(-not [string]::IsNullOrEmpty($iconType)){
            $AppHashTable['largeIcon'] = @{
                '@odata.type' = '#microsoft.graph.mimeContent'
                'type' = $iconType
                'value' = $iconBase64
            }
        }
        if($InformationURL) {
            $AppHashTable['informationUrl'] = $InformationURL
        }
        if($PrivacyURL) {
            $AppHashTable['privacyInformationUrl'] = $PrivacyURL
        }
        if($Developer) {
            $AppHashTable['developer'] = $Developer
        }
        if($Owner) {
            $AppHashTable['owner'] = $Owner
        }
        if($Notes) {
            $AppHashTable['notes'] = $Notes
        }
        $AppJSON = $AppHashTable | ConvertTo-Json -Depth 10
        Invoke-GraphMethod -Method 'Post' -Version (Get-GraphIntuneVersion) -query 'deviceAppManagement/mobileApps' -body $AppJSON -ContentType 'application/json'
}

Function Remove-GraphIntuneApp {
<#
    .SYNOPSIS
        Removes specified application

    .DESCRIPTION
        Will delete an Intune application

    .EXAMPLE
        Get-GraphIntuneApp | Remove-GraphIntuneApp -WhatIf

    .PARAMETER id
        Id of the app you want to remove. Supports pipeline.

    .PARAMETER force
        Remove app without prompting.

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/beta/resources/intune_apps_app_conceptual
    
    .Notes
        Author: Ryan Ephgrave
#>
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param(
        [Parameter(
            Mandatory=$true,
            Position=0,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [ValidateNotNullOrEmpty()]
        [string]$id,
        [Parameter(Mandatory=$false)]
        [switch]$force
    )
    process {
        foreach($AppId in $id){
            if($force) {
                    if($PSCmdlet.ShouldProcess("$($AppId)","Invoke-GraphMethod -Method Delete")){
                        Invoke-GraphMethod -Version (Get-GraphIntuneVersion) -method 'Delete' -query "deviceAppManagement/mobileApps/$($AppId)"
                    }
            }
            else {
                $AppInfo = Get-GraphIntuneApps -AppId $AppId
                if(-not [string]::IsNullOrEmpty($AppInfo)) {
                    $Result = Read-Host "Do you want to delete the app $($AppInfo.DisplayName)? (Y/N)"
                    if($Result -eq 'y') {
                            if($PSCmdlet.ShouldProcess("$($AppId)","Invoke-GraphMethod -Method Delete")){
                                Invoke-GraphMethod -Version (Get-GraphIntuneVersion) -method 'Delete' -query "deviceAppManagement/mobileApps/$($AppId)"
                            }
                    }
                }
            }
        }
    }
}

Function Get-GraphIntuneApps {
<#
    .SYNOPSIS
        List Intune apps

    .DESCRIPTION
        Will query deviceAppManagement/mobileApps to get a list of Intune apps. Filters out managed apps 

    .EXAMPLE
        Get-GraphIntuneApps

    .PARAMETER Id  
        Get specific app by Id.

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/beta/resources/intune_apps_app_conceptual
    
    .Notes
        Author: Ryan Ephgrave
#>    
    Param(
        [string]$Id
    )
    $results = ''
    if(-not [string]::IsNullOrEmpty($Id)) {
        $results = Invoke-GraphMethod -Version (Get-GraphIntuneVersion) -query "deviceAppManagement/mobileApps/$($Id)" -method 'Get'
    }
    else {
        $results = Invoke-GraphMethod -Version (Get-GraphIntuneVersion) -query "deviceAppManagement/mobileApps" -method 'Get'
    }
    foreach($result in $results) {
        $Type = $result."@odata.type"
        if(-not $type.contains('managed')){
            $result
        }
    }
}

<#
Function Set-GraphIntuneApp {
    [CmdletBinding()]
    Param(
        [Parameter(
            Mandatory=$true,
            Position=0,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [ValidateNotNullOrEmpty()] 
        [string]$DisplayName,
        [ValidateNotNullOrEmpty()]
        [string]$Description,
        [ValidateNotNullOrEmpty()] 
        [string]$publisher,
        [ValidateNotNullOrEmpty()]
        [string]$appUrl,
        [ValidateSet(
            'v4_0',
            'v4_0_3',
            'v4_1',
            'v4_2',
            'v4_3',
            'v4_4',
            'v5_0',
            'v5_1'
        )]
        [string]$minimumSupportedAndroidOS,
        [ValidateSet(
            'v8_0',
            'v9_0',
            'v10_0'
        )]
        [string]$minimumSupportediOS,
        [ValidateSet(
            'iPad',
            'iPhone',
            'Both'
        )]
        [string]$iosDeviceType,
        [string]$iconType,
        [string]$iconBase64,
        [Nullable[bool]]$isFeatured,
        [bool]$UseManagedBrowser,
        [ValidateNotNullOrEmpty()]
        [string]$InformationURL,
        [ValidateNotNullOrEmpty()]
        [string]$PrivacyURL,
        [ValidateNotNullOrEmpty()]
        [string]$Developer,
        [ValidateNotNullOrEmpty()]
        [string]$Owner,
        [ValidateNotNullOrEmpty()]
        [string]$Notes
    )
    Process{
        
    }
}
#>