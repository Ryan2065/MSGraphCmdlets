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
                    if($tempType.StartsWith('MSGraphAPI')){
                        $tempType = 'object'
                    }
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
                    if($tempType.StartsWith('MSGraphAPI')){
                        $tempType = 'object'
                    }
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