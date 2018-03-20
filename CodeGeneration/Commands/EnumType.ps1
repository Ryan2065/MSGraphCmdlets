Function Get-MSGraphAPIEnumType {
    Param(
        $Enum,
        [ValidateSet('v1','beta')]
        $GraphVersion,
        $NamePrefix = "MSGraphAPI"
    )
    $EnumName = "$($NamePrefix)_$($GraphVersion)_$($Enum.Name)"
    $EnumProperties = @()
    foreach($member in $Enum.Member){
        $EnumProperties += @("    $($Member.Name) = $($Member.Value)")
    }
    $EnumProperties = $EnumProperties -join [Environment]::NewLine
    return ( $EnumTemplate -f "$EnumName","$EnumProperties" )
}