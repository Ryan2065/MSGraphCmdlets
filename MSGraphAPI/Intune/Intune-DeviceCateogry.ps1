Function New-GraphIntuneDeviceCateogry {
<#
    .SYNOPSIS
        Will create a new Device Category

    .DESCRIPTION
        Calls post method to deviceManagement/deviceCategories

    .EXAMPLE
        New-GraphIntuneDeviceCateogry -DisplayName 'Category' -Description 'My description'

    .PARAMETER DisplayName
        Display name of the device category

    .PARAMETER Description
        Description of the device category

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Description
    )
        $CategoryHash = @{
            '@odata.type' = '#microsoft.graph.deviceCategory'
            'displayName' = $DisplayName
            'description' = $Description
        }
        $CategoryJSON = $CategoryHash | ConvertTo-Json -Depth 10
        $GraphHash = @{
            'Method' = 'Post'
            'Version' = Get-GraphIntuneVersion
            'Query' = 'deviceManagement/deviceCategories'
            'body' = $CategoryJSON
            'ContentType' = 'application/json'
        }
        Invoke-GraphMethod @GraphHash
}

Function Get-GraphIntuneDeviceCateogry {
<#
    .SYNOPSIS
        Retrieves Intune device categories

    .DESCRIPTION
        Calls get from deviceManagement/deviceCategories

    .EXAMPLE
        Get-GraphIntuneDeviceCateogry -DisplayName 'MyCategory'
        Will search for the category with display name of MyCategory

    .PARAMETER DisplayName
        Filters the results based on displayName

    .PARAMETER Id
        Retrieves a specific device category

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>    
    Param(
        [Parameter(ParameterSetName='DisplayName')]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName,
        [Parameter(ParameterSetName='Id')]
        [ValidateNotNullOrEmpty()]
        [string]$Id
    )
    $InvokeHash = @{
        query = "deviceManagement/deviceCategories"
        Version = Get-GraphIntuneVersion
        Method = 'Get'
    }
    if($DisplayName) {
        $InvokeHash['Search'] = "displayName:$($DisplayName)"
    }
    elseif($Id){
        $InvokeHash['query'] = "deviceManagement/deviceCategories/$($Id)"
    }
    Invoke-GraphMethod @InvokeHash
}

Function Set-GraphIntuneDeviceCategory{
<#
    .SYNOPSIS
        Will update the device category

    .DESCRIPTION
        Calls Patch to deviceManagement/deviceCategories/ID

    .EXAMPLE
        Set-GraphIntuneDeviceCategory -Id 'GUID' -DisplayName 'My New Name'

    .PARAMETER Id
        Id of device category
    
    .PARAMETER DisplayName
        New display name

    .PARAMETER Description
        New description

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param(
        [Parameter(
            Mandatory=$true,
            Position=0,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string]$Description
    )
    Process {
        foreach($CategoryId in $Id){
                $UpdateHash = @{}
                $SendPatch = $false
                if($DisplayName) {
                    $UpdateHash['displayName'] = $DisplayName
                    $SendPatch = $true
                }
                if ($Description) {
                    $UpdateHash['description'] = $Description
                    $SendPatch = $true
                }
                if($SendPatch){
                    $UpdateJSON = $UpdateHash | ConvertTo-Json -Depth 10
                    $InvokeHash = @{
                        'query' = "deviceManagement/deviceCategories/$($CategoryId)"
                        'Version' = Get-GraphIntuneVersion
                        'Method' = 'Patch'
                        'body' = $UpdateJSON
                        'ContentType' = 'application/json'
                    }
                    Invoke-GraphMethod @InvokeHash
                }
        }
    }
}

Function Remove-GraphIntuneDeviceCategory {
<#
    .SYNOPSIS
        Will remove the device category

    .DESCRIPTION
        Calls delete to deviceManagement/deviceCategories/Id

    .EXAMPLE
        Remove-GraphIntuneDeviceCategory -Id 'My Id'

    .PARAMETER Id
        Id of device category

    .Parameter Force
        Delete without prompting

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param(
        [Parameter(
            Mandatory=$true,
            Position=0,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Id,
        [switch]$force
    )
    Process {
        foreach($CategoryId in $Id) {
            $Response = 'y'
            if(-not $force){
                $Category = Get-GraphIntuneDeviceCateogry -Id $($CategoryId)
                $Response = Read-Host "Do you want to remove category $($Category.displayName)? (y/n)"
            }
            if($Response -eq 'y') {
                $InvokeHash = @{
                    'query' = "deviceManagement/deviceCategories/$($CategoryId)"
                    'Version' = Get-GraphIntuneVersion
                    'Method' = 'Delete'
                }
                Invoke-GraphMethod @InvokeHash
            }
        }
    }
}