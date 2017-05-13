Class ParameterInfo {
    [string]$Name
    [string]$Description
}

Function Add-GraphHelp {
    Param(
        $Data,
        $Customizations,
        $Annotations,
        $FunctionName,
        $Type
    )

    $returndata = ''



    $returndata = @"
<#
    .SYNOPSIS
        $(Get-GraphHelpSynopsis -Data $Data -type $type -Customizations $Customizations)

    .DESCRIPTION
        $(Get-GraphHelpDescription -Data $Data -type $type -Customizations $Customizations)

$(Get-GraphHelpExample -Data $Data -type $type -Customizations $Customizations -FunctionName $FunctionName)

$(Get-GraphHelpParameter -Data $Data -type $type -Customizations $Customizations -Annotations $Annotations)

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets/wiki/$($FunctionName)
    
    .Notes
        Author: Ryan Ephgrave
#>
"@

    return $returndata

}

Function Get-GraphHelpSynopsis {
    Param(
        $type,
        $Data,
        $Customizations
    )
    Switch($Type) {
        'EntitySet' {
            $Name = $Data.Name
            return "Will query Microsoft Graph for a list of $($Name)"
        }
    }
}

Function Get-GraphHelpDescription {
    Param(
        $type,
        $Data,
        $Customizations
    )
    Switch($Type) {
        'EntitySet' {
            $Name = $Data.Name
            return "Will query Microsoft Graph for a list of $($Name)"
        }
    }
}

Function Get-GraphHelpExample {
    Param(
        $type,
        $Data,
        $Customizations,
        $FunctionName
    )
    Switch($Type) {
        'EntitySet' {
            return "    .EXAMPLE`n        $($FunctionName)"
        }
    }
}

Function Get-GraphHelpParameter {
    Param(
        $type,
        $Data,
        $Customizations,
        $Annotations
    )
    Switch($Type) {
        'EntitySet' {
            $ParameterList = @()
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Id'
            $tempobject.Description = 'Gets specified object based on Id.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Filter'
            $tempobject.Description = 'Filters the response based on a set of criteria.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Search'
            $tempobject.Description = 'A property and value pair separated by a colon.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Select'
            $tempobject.Description = 'Comma-separated list of properties to include in the response.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Expand'
            $tempobject.Description = 'Comma-separated list of relationships to expand and include in the response.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'OrderBy'
            $tempobject.Description = 'Comma-separated list of properties that are used to sort the order of items in the response collection.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Top'
            $tempobject.Description = 'The number of items to return in a result set.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Skip'
            $tempobject.Description = 'The number of items to skip in a result set.'
            $ParameterList += @($tempobject)
            $tempobject = New-Object ParameterInfo
            $tempobject.Name = 'Count'
            $tempobject.Description = 'A collection and the number of items in the collection.'
            $ParameterList += @($tempobject)
            if($Annotations) {
                foreach($instance in $Annotations.Annotation.Record.PropertyValue) {
                    Switch($instance.Property) {
                        'Searchable' {
                            if($instance.bool -eq 'false') {
                                $ParameterList = Remove-GraphParam -ParamArray $ParameterList -Name 'search'
                            }
                        }
                        'Expandable' {
                            if($instance.bool -eq 'false') {
                                $ParameterList = Remove-GraphParam -ParamArray $ParameterList -Name 'expand'
                            }
                        }
                        'Selectable' {
                            if($instance.bool -eq 'false') {
                                $ParameterList = Remove-GraphParam -ParamArray $ParameterList -Name 'select'
                            }
                        }
                        'Countable' {
                            if($instance.bool -eq 'false') {
                                $ParameterList = Remove-GraphParam -ParamArray $ParameterList -Name 'count'
                            }
                        }
                        'Filterable' {
                            if($instance.bool -eq 'false') {
                                $ParameterList = Remove-GraphParam -ParamArray $ParameterList -Name 'filter'
                            }
                        }
                    }
                }
            }
            $ParamText = ''
            foreach($tempParam in $ParameterList) {
                $ParamText = $ParamText + (New-GraphHelpParameterInfo -ParamInfo $tempParam)
            }
            return $ParamText
        }
    }
}

Function New-GraphHelpParameterInfo {
    Param($ParamInfo)
@"
    .PARAMETER $($ParamInfo.Name)
        $($ParamInfo.Description)


"@
}