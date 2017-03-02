Function New-GraphIntuneDeviceCateogry {
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$DisplayName,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Description
    )
    try{
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
    catch{
        Write-GraphLog -Exception $_
    }
}

Function Get-GraphIntuneDeviceCateogry {
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
            try{
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
            catch {
                Write-GraphLog -Exception $_
            }
        }
    }
}

Function Remove-GraphIntuneDeviceCategory {
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