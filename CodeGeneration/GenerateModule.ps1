#region Get Templates
$EnumTemplate = Get-Content "$PSScriptRoot\Templates\EnumTemplate.ps1" -Raw
$ComplexTypeTemplate = Get-Content "$PSScriptRoot\Templates\ComplexTypeTemplate.ps1" -Raw
$EntityTypeTemplate = Get-Content "$PSScriptRoot\Templates\EntityTypeTemplate.ps1" -Raw
$BaseClass = Get-Content "$PSScriptRoot\Templates\BaseClass.ps1" -raw
$Script:FinalFile = New-Object System.Collections.ArrayList
#endregion

Function Write-MSGraphAPINameToHashFile {
    Param(
        $Name,
        $NamePrefix,
        $GraphVersion
    )
    $String = "`$Script:MSGraphAPIClassHash.Add('$($Name)', '$($NamePrefix)_$($GraphVersion)_$($Name)')`n"
    $String += "`$Script:MSGraphAPIClassHash.Add('microsoft.graph.$($Name)', '$($NamePrefix)_$($GraphVersion)_$($Name)')`n"
    $null = $Script:FinalFile.Add($String)
}

Function Get-MSGraphAPIEnumType {
    Param(
        $Enum,
        [ValidateSet('v1','beta')]
        $GraphVersion,
        $NamePrefix = "MSGraphAPI"
    )
    $EnumName = "$($NamePrefix)_$($GraphVersion)_$($Enum.Name)"
    #Write-MSGraphAPINameToHashFile -Name $Enum.Name -NamePrefix $NamePrefix -GraphVersion $GraphVersion
    $EnumProperties = @()
    foreach($member in $Enum.Member){
        $EnumProperties += @("    $($Member.Name) = $($Member.Value)")
    }
    $EnumProperties = $EnumProperties -join [Environment]::NewLine
    return ( $EnumTemplate -f "$EnumName","$EnumProperties" )
}

Function Get-MSGraphAPIPoshType {
    Param(
        $TypeName,
        $GraphVersion,
        $NamePrefix
    )
    $SwitchType = $TypeName
    $Matches = $null
    $IsCollection = $false
    if($TypeName.StartsWith('Collection(')) {
        $SwitchType = $TypeName.TrimStart('Collection(').TrimEnd(')')
        $IsCollection = $true
    }
    $return = 'object'
    Switch -Wildcard ($SwitchType) {
        'microsoft.graph.Json'{
            $return = 'string'
        }
        'Edm.Int32' {
            $return = 'Nullable[int]'
        }
        'Edm.String' {
            $return = 'string'
        }
        'Edm.Binary' {
            $return = 'object'
        }
        'Edm.DateTimeOffset' {
            $return = 'Nullable[DateTimeOffset]'
        }
        'Edm.Guid' {
            $return = 'Nullable[Guid]'
        }
        'Edm.Boolean' {
            $return = 'Nullable[bool]'
        }
        'Edm.Double' {
            $return = 'Nullable[Double]'
        }
        'Edm.Date' {
            $return = 'Nullable[DateTime]'
        }
        'Edm.Int64' {
            $return = 'Nullable[int64]'
        }
        'Edm.Int16' {
            $return = 'Nullable[int16]'
        }
        'Edm.Stream' {
            $return = 'object'
        }
        'Edm.Byte' {
            $return = 'object'
        }
        'Edm.Single' {
            $return = 'object'
        }
        'Edm.TimeOfDay' {
            $return = 'object'
        }
        'microsoft.graph*' {
            $GraphType = $SwitchType.Replace('microsoft.graph.','')
            $return = "$($NamePrefix)_$($GraphVersion)_$($GraphType)"
        }
    }
    if($IsCollection){
        $return = "$($return)[]"
    }
    return $return
}

Function Get-MSGraphAPIComplexType {
    Param(
        $ComplexType,
        [ValidateSet('v1','beta')]
        $GraphVersion,
        $NamePrefix = "MSGraphAPI"
    )
    $ComplexTypeName = $ComplexType.Name
    Write-MSGraphAPINameToHashFile -Name $ComplexTypeName -NamePrefix $NamePrefix -GraphVersion $GraphVersion
    $ClassName = "$($NamePrefix)_$($GraphVersion)_$($ComplexTypeName)"
    if(-not [string]::IsNullOrEmpty($ComplexType.BaseType)) {
        $BaseClass = $ComplexType.BaseType.Replace('microsoft.graph.','')
        $BaseClass = "$($NamePrefix)_$($GraphVersion)_$($BaseClass)"
        $ClassName = "$($ClassName) : $($BaseClass)"
    }
    else {
        $ClassName = "$($ClassName) : MSGraphAPI_Base"
    }
    $Properties = @()
    foreach($Property in $ComplexType.Property) {
        $PropertyType = Get-MSGraphAPIPoshType -TypeName $Property.Type -GraphVersion $GraphVersion -NamePrefix $NamePrefix
        
        $PropertyType = "[$($PropertyType)]"
        $Properties += "    $($PropertyType) `$$($Property.Name)"
    }
    $Props = $Properties -join [Environment]::NewLine
    return ($ComplexTypeTemplate -f $ClassName,$Props)
}

Function Get-MSGraphAPIEntityType {
    Param(
        $EntityType,
        [ValidateSet('v1','beta')]
        $GraphVersion,
        $NamePrefix = "MSGraphAPI",
        $Actions,
        $Functions
    )
    $EntityTypeName = $EntityType.Name
    Write-MSGraphAPINameToHashFile -Name $EntityTypeName -NamePrefix $NamePrefix -GraphVersion $GraphVersion
    $ClassName = "$($NamePrefix)_$($GraphVersion)_$($EntityTypeName)"
    if(-not [string]::IsNullOrEmpty($EntityType.BaseType)) {
        $BaseClass = $EntityType.BaseType.Replace('microsoft.graph.','')
        $BaseClass = "$($NamePrefix)_$($GraphVersion)_$($BaseClass)"
        $ClassName = "$($ClassName) : $($BaseClass)"
    }
    else {
        $ClassName = "$($ClassName) : MSGraphAPI_Base"
    }
    $Properties = @()
    foreach($Property in $EntityType.Property) {
        $PropertyType = Get-MSGraphAPIPoshType -TypeName $Property.Type -GraphVersion $GraphVersion -NamePrefix $NamePrefix
        $PropertyType = "[$($PropertyType)]"
        $Properties += "    $($PropertyType) `$$($Property.Name)"
    }
    $Props = $Properties -join [Environment]::NewLine

    $NavigationProperties = @()
    foreach($NavProperty in $EntityType.NavigationProperty){
        $NavPropertyText  = "    [object]Get_$($NavProperty.Name)(){`n"
        $NavPropertyText += "        return (Invoke-MSGraphMethod -query `"`$(`$this.GraphPath)/$($NavProperty.Name)`")`n"
        $NavPropertyText += "    }"
        $NavigationProperties += @($NavPropertyText)
    }
    $NavProps = $NavigationProperties -join [Environment]::NewLine

    $ActionObjects = @()
    $GraphType = "microsoft.graph.$($EntityType.Name)"
    foreach($Action in $Actions) {
        $ProcessAction = $false
        foreach($param in $Action.Parameter) {
            if($param.Name -eq 'bindingParameter'){
                if($param.Type -eq $GraphType) {
                    $ProcessAction = $true
                }
            }
        }
        if($ProcessAction){
            $ActionText = "    [object]$($Action.Name)("
            $ParamHashItems = @()
            foreach($param in $Action.Parameter) {
                if($param.Name -ne 'bindingParameter'){
                    $tempType = Get-MSGraphAPIPoshType -TypeName $param.Type -GraphVersion $GraphVersion -NamePrefix $NamePrefix
                    $ActionText += "[$($tempType)]`$$($param.Name),"
                    $ParamHashItems += "            '$($param.Name)'=`$$($param.Name)"
                }
            }
            $ActionText = $ActionText.TrimEnd(',')
            $ActionText += "){`n"
            if($ParamHashItems.Count -gt 0){
                $ActionText += "        `$ParamHash = @{`n"
                $ActionText += ( $ParamHashItems -join [Environment]::NewLine )
                $ActionText += "`n        }`n"
            }
            $ActionText += "        return (Start-MSGraphAPIAction -BaseURI `$this.GraphURL -Action '$($Action.Name)'"
            if($ParamHashItems.Count -gt 0){
                $ActionText += " -ParamHash `$ParamHash"
            }
            $ActionText += ")`n"
            $ActionText += "    }"
            $ActionObjects += $ActionText
        }
    }
    $ActionText = $ActionObjects -join [System.Environment]::NewLine

    $FunctionObjects = @()
    $GraphType = "microsoft.graph.$($EntityType.Name)"
    foreach($Function in $Functions) {
        $ProcessFunction = $false
        foreach($param in $Function.Parameter) {
            if($param.Name -eq 'bindingParameter'){
                if($param.Type -eq $GraphType) {
                    $ProcessFunction = $true
                }
            }
        }
        if($ProcessFunction){
            $FunctionText = "    [object]$($Function.Name)("
            $ParamHashItems = @()
            foreach($param in $Function.Parameter) {
                if($param.Name -ne 'bindingParameter'){
                    $tempType = Get-MSGraphAPIPoshType -TypeName $param.Type -GraphVersion $GraphVersion -NamePrefix $NamePrefix
                    $FunctionText += "[$($tempType)]`$$($param.Name),"
                    $ParamHashItems += "            '$($param.Name)'=`$$($param.Name)"
                }
            }
            $FunctionText = $FunctionText.TrimEnd(',')
            $FunctionText += "){`n"
            if($ParamHashItems.Count -gt 0){
                $FunctionText += "        `$ParamHash = @{`n"
                $FunctionText += ( $ParamHashItems -join [Environment]::NewLine )
                $FunctionText += "`n        }`n"
            }
            $FunctionText += "        return (Start-MSGraphAPIFunction -BaseURI `$this.GraphURL -Function '$($Function.Name)'"
            if($ParamHashItems.Count -gt 0){
                $FunctionText += " -ParamHash `$ParamHash"
            }
            $FunctionText += ")`n"
            $FunctionText += "    }"
            $FunctionObjects += $FunctionText
        }
    }
    $FunctionText = $FunctionObjects -join [System.Environment]::NewLine

    return ($EntityTypeTemplate -f $ClassName,$Props,$NavProps,$ActionText,$FunctionText)
}

$NamePrefix = "MSGraphAPI"
$GraphVersion = "v1"
[xml]$Metadata = Get-Content "$PSScriptRoot\`$metadata.xml" -Raw
$OutputFile = "$PSScriptRoot\Generated\$($NamePrefix)_$($GraphVersion).class.ps1"
if(Test-Path $OutputFile) { Remove-Item -Path $OutputFile -Force }
$null = $Script:FinalFile.Add($BaseClass)


Foreach($ChildNode in $Metadata.Edmx.DataServices.Schema.ChildNodes) {
    
    Switch($ChildNode.LocalName) {
        'EnumType' {
            $null = $Script:FinalFile.Add( (Get-MSGraphAPIEnumType -Enum $ChildNode -GraphVersion $GraphVersion -NamePrefix $NamePrefix) )
        }
        'ComplexType' {
            $null = $Script:FinalFile.Add( (Get-MSGraphAPIComplexType -ComplexType $ChildNode -GraphVersion $GraphVersion -NamePrefix $NamePrefix) )
        }
        'EntityType' {
            $null = $Script:FinalFile.Add( (Get-MSGraphAPIEntityType -EntityType $ChildNode -GraphVersion $GraphVersion -NamePrefix $NamePrefix -Actions $Metadata.Edmx.DataServices.Schema.Action -Functions $Metadata.Edmx.DataServices.Schema.Function ) )
        }
    }
}

($Script:FinalFile -join [Environment]::NewLine ) | Out-File -FilePath $OutputFile -Encoding 'utf8' -Force