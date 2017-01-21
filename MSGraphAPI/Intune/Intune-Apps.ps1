Function New-GraphIntuneApp {
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
    try {
        [hashtable]$AppHashTable = @{}
        $AppHashTable['displayName'] = $DisplayName
        $AppHashTable['description'] = $Description
        $AppHashTable['publisher'] = $publisher
        $AppHashTable['isFeatured'] = $isFeatured
        switch($ApplicationType) {
            'Android LOB App' {
                #$AppHashTable['@odata.type'] = '#microsoft.graph.androidLobApp'
                Write-Host 'This is not supported yet...'
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
        Invoke-GraphMethod -Method 'Post' -Version 'beta' -query 'deviceAppManagement/mobileApps' -body $AppJSON -ContentType 'application/json'
    }
    catch {
        Write-GraphLog -Exception $_
    }
}

Function Remove-GraphIntuneApp {
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
                try {
                    Invoke-GraphMethod -Version 'beta' -method 'Delete' -query "deviceAppManagement/mobileApps/$($AppId)"
                }
                catch {
                    Write-GraphLog -Exception $_
                }
            }
            else {
                $AppInfo = Get-GraphIntuneApps -AppId $AppId
                if(-not [string]::IsNullOrEmpty($AppInfo)) {
                    $Result = Read-Host "Do you want to delete the app $($AppInfo.DisplayName)? (Y/N)"
                    if($Result -eq 'y') {
                        try {
                            Invoke-GraphMethod -Version 'beta' -method 'Delete' -query "deviceAppManagement/mobileApps/$($AppId)"
                        }
                        catch {
                            Write-GraphLog -Exception $_
                        }
                    }
                }
            }
        }
    }
}

Function Get-GraphIntuneApps {
    Param(
        [string]$Id
    )
    $results = ''
    if(-not [string]::IsNullOrEmpty($Id)) {
        $results = Invoke-GraphMethod -Version 'beta' -query "deviceAppManagement/mobileApps/$($Id)" -method 'Get'
    }
    else {
        $results = Invoke-GraphMethod -Version 'beta' -query "deviceAppManagement/mobileApps" -method 'Get'
    }
    foreach($result in $results) {
        $Type = $result."@odata.type"
        if(-not $type.contains('managed')){
            $result
        }
    }
}

