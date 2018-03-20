Function Write-MSGraphAPINameToHashFile {
    Param(
        $Name,
        $NamePrefix,
        $GraphVersion
    )
    #region Write to ClassHash so we can easily look up the correct type through Invoke-MSGraphMethod
    $String = "`$null = `$Script:MSGraphAPIClassHash.Add('$($Name)', '$($NamePrefix)_$($GraphVersion)_$($Name)')`n"
    $String += "`$null = `$Script:MSGraphAPIClassHash.Add('microsoft.graph.$($Name)', '$($NamePrefix)_$($GraphVersion)_$($Name)')`n"
    #endregion



    $null = $Script:FinalFile.Add($String)
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
