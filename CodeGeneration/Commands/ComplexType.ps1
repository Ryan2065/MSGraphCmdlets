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