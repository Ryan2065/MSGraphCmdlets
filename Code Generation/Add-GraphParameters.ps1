Class ParameterClass {
    [string]$Name
    [bool]$ValidateNullOrEmpty
    [bool]$Mandatory
    [string]$Type
    [string]$DefaultValue
    ParameterClass($Name, $ValidateNullOrEmpty, $Mandatory, $Type) {
        $this.Name = $Name
        $this.ValidateNullOrEmpty = $ValidateNullOrEmpty
        $this.Mandatory = $Mandatory
        $this.Type = $type
    }
    ParameterClass($Name, $ValidateNullOrEmpty, $Mandatory, $Type, $DefaultValue) {
        $this.Name = $Name
        $this.ValidateNullOrEmpty = $ValidateNullOrEmpty
        $this.Mandatory = $Mandatory
        $this.Type = $type
        $this.DefaultValue = $DefaultValue
    }
}

Function New-GraphParameters {
    Param(
        $ParamClassArray
    )
    $count = 1
    $ParamString = "Param("
    Foreach($Param in $ParamClassArray) {
        if($count -ne 1) {
            $ParamString = $ParamString + ","
        }
        if($param.ValidateNullOrEmpty) {
            $ParamString = $ParamString + "`n        [ValidateNotNullOrEmpty()]"
        }
        if($param.Mandatory) {
            $ParamString = $ParamString + "`n        [Parameter(Mandatory=`$true)]"
        }
        $ParamString = $ParamString + "`n        $($Param.type)`$$($Param.Name)"
        if(-not [string]::IsNullOrEmpty($param.DefaultValue)) {
            $ParamString = $ParamString + " = $($param.defaultValue)"
        }
        $count++
    }
    return "$($ParamString)`n    )"
}

Function Remove-GraphParam {
    param(
        $ParamArray,
        $Name
    )
    $NewParamArray = @()
    foreach($param in $ParamArray) {
        if($param.Name -ne $Name) {
            $NewParamArray += @($param)
        }
    }
    return $NewParamArray
}

Function Add-GraphParameters {
    Param(
        $Data,
        $Customizations,
        $Annotations,
        $Type,
        $Version = 'v1.0'
    )
    Switch($Type) {
        'EntitySet' {
            $ParamArray = @()
            $ParamArray += @([ParameterClass]::new('Id', $true, $false, '[string]'))
            $ParamArray += @([ParameterClass]::new('filter', $true, $false, '[string]'))
            $ParamArray += @([ParameterClass]::new('search', $true, $false, '[string]'))
            $ParamArray += @([ParameterClass]::new('select', $true, $false, '[string]'))
            $ParamArray += @([ParameterClass]::new('expand', $true, $false, '[string]'))
            $ParamArray += @([ParameterClass]::new('orderby', $true, $false, '[string]'))
            $ParamArray += @([ParameterClass]::new('top', $true, $false, '[Nullable[int]]'))
            $ParamArray += @([ParameterClass]::new('skip', $true, $false, '[Nullable[int]]'))
            $ParamArray += @([ParameterClass]::new('count', $true, $false, '[Nullable[bool]]'))
            $ParamArray += @([ParameterClass]::new('Version', $true, $false, '[string]', "'$Version'"))
            if($Annotations) {
                foreach($instance in $Annotations.Annotation.Record.PropertyValue) {
                    Switch($instance.Property) {
                        'Searchable' {
                            if($instance.bool -eq 'false') {
                                $ParamArray = Remove-GraphParam -ParamArray $ParamArray -Name 'search'
                            }
                        }
                        'Expandable' {
                            if($instance.bool -eq 'false') {
                                $ParamArray = Remove-GraphParam -ParamArray $ParamArray -Name 'expand'
                            }
                        }
                        'Selectable' {
                            if($instance.bool -eq 'false') {
                                $ParamArray = Remove-GraphParam -ParamArray $ParamArray -Name 'select'
                            }
                        }
                        'Countable' {
                            if($instance.bool -eq 'false') {
                                $ParamArray = Remove-GraphParam -ParamArray $ParamArray -Name 'count'
                            }
                        }
                        'Filterable' {
                            if($instance.bool -eq 'false') {
                                $ParamArray = Remove-GraphParam -ParamArray $ParamArray -Name 'filter'
                            }
                        }
                    }
                }
            }
            New-GraphParameters -ParamClassArray $ParamArray
        }
    }
}