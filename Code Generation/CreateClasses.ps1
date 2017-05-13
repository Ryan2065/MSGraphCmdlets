Function New-GraphClassType {
<#
    .SYNOPSIS
        Creates classes for Graph objects

    .DESCRIPTION
        will create a new powershell class with the appropriate methods and properties

    .EXAMPLE
        New-GraphClass -ClassName 'User' -ClassPropertyHash @{'Id'='object'} -ClassNavigationArray @('devices') -GraphVersion 'v1.0' -BaseType 'User'

    .PARAMETER ClassName
        Name of the class

    .PARAMETER ClassPropertyHash
        A hash of the properties for the class. In 'PropName'='PropTYpe' format

    .PARAMETER ClassNavigationPropertyArray
        Navigation property array

    .PARAMETER ClassMethodArray
        Array of methods on the class

    .PARAMETER GraphVersion
        Which version of graph does this class belong to

    .PARAMETER Type
        what is the type of the class
    
    .PARAMETER BaseType
        What is the base type for the class

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param(
        $ClassName,
        $ClassPropertyHash,
        $ClassNavigationPropertyArray,
        $ClassMethodArray,
        $GraphVersion,
        $Type,
        $BaseType
    )
    $ClassName = "microsoft_graph_$($ClassName)"
    $strClass = "Class $($ClassName) "
    $strBaseClass = ''
    if($BaseType) {
        $strClass = $strClass + ": $($BaseType) {`n"
        $strBaseClass = ($Global:GraphAuthenticationHash['ClassCode'])[$BaseType]
    }
    else {
        $strClass = $strClass + "{`n"
    }

    foreach($ClassKey in $ClassPropertyHash.Keys) {
        $strClass = $strClass + "[$(($ClassPropertyHash[$ClassKey]).Replace('}',''))]`$$($ClassKey);`n"
    }
    
    foreach($ClassNavigationProperty in $ClassNavigationPropertyArray) {
        $strClass = $strClass + "`n[object]Get_$($ClassNavigationProperty)() { return (Invoke-GraphMethod -Version '$($GraphVersion)' -Query `"$($Type)s/`$(`$this.Id)/$($ClassNavigationProperty)`")  }`n"
    }

    $strClass = $strClass + "`n}`n"
    $strClass >> "$($env:APPDATA)\MSGraphAPIClasses.ps1"
    return "$strBaseClass `n $strClass"
}

Function Get-GraphEnumType {
<#
    .SYNOPSIS
        Will process all enum types for creating classes

    .DESCRIPTION
        Will create classes for the specified enum types

    .EXAMPLE
        Get-GraphEnumType -GraphEnumTypes $Metadata.EnumType -GraphVersion 'v1'

    .PARAMETER GraphEnumTypes
        Array of enum types from the graph metadata

    .PARAMETER GraphVersion
        Version of metadata

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    param (
        $GraphEnumTypes,
        $GraphVersion
    )
    foreach($EnumType in $GraphEnumTypes) {
        $NewClassHash = @{}
        $NewClassHash['ClassName'] = "$($GraphVersion)_$($EnumType.Name)"
        $MemberArray = @()
        Foreach($Member in $EnumType.Member) {
            $MemberArray += @($Member.Name)
        }
    }
}

Function Get-GraphEntityTypes {
<#
    .SYNOPSIS
        Loops through entity types in Graph metadata

    .DESCRIPTION
        Loops through entity types in Graph metadata

    .EXAMPLE
        Get-GraphENtityTypes -EntityTypes $Metadata.EntityType -GraphVersion 'v1.0'

    .PARAMETER EntityTypes
        List of entity type metadata

    .PARAMETER GraphVersion
        Version of graph

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param(
        $EntityTypes,
        $GraphVersion
    )
    $strClass = ''
    foreach($EntityType in $EntityTypes) {
        $CreateClassHash = @{}
        $ClassName = ($EntityType.Name + "_" + $GraphVersion).replace('.','_')
        $CreateClassHash['ClassName'] = $ClassName
        $PropertyHash = @{}
        foreach($Property in $EntityType.Property) {
            $Type = 'object'
            Switch ($Type) {
                'Edm.String' { $Type = 'string' }
                'Collection(Edm.String)' { $Type = 'string[]' }
                'Edm.DateTimeOffset' { $Type = 'datetime' }
                'Edm.Boolean' { $Type = 'bool' }
                'Edm.Int32' { $Type = 'int' }
            }
            $PropertyHash[$Property.Name] = $type
        }
        $CreateClassHash['ClassPropertyHash'] = $PropertyHash
        $CreateClassHash['ClassNavigationPropertyArray'] = $EntityType.NavigationProperty.Name
        $CreateClassHash['GraphVersion'] = $GraphVersion
        $CreateClassHash['Type'] = $EntityType.Name
        if(-not [string]::IsNullOrEmpty($EntityType.BaseType)) {
            $BaseType = $EntityType.BaseType + "_" + $GraphVersion
            $CreateClassHash['BaseType'] = $BaseType.replace('.','_')
        }
        $Global:GraphAuthenticationHash.ClassCode["microsoft_graph_$ClassName"] = New-GraphClassType @CreateClassHash
        $Global:GraphAuthenticationHash.NavProps["microsoft_graph_$ClassName"] = $EntityType.NavigationProperty.Name
    }
}

Function Get-GraphEntityContainers {
    Param(
        $Metadata,
        $Version
    )
    foreach($instance in $Metadata.EntityContainer.EntitySet) {
        $EntitySetType = ("$($instance.EntityType)_$($Version)").Replace('.','_')
        $Global:GraphAuthenticationHash.EntityContainers["$($instance.Name)_$($Version)"] = $EntitySetType
    }
}

Function New-GraphClass {
<#
    .SYNOPSIS
        Create graph class

    .DESCRIPTION
        Create graph class

    .EXAMPLE
        New-GraphClass

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    $Global:GraphAuthenticationHash['ClassCode'] = @{}
    $Global:GraphAuthenticationHash['EntityContainers'] = @{}
    $Global:GraphAuthenticationHash['NavProps'] = @{}
    Remove-Item "$($env:APPDATA)\MSGraphAPIClasses.ps1" -Force -ErrorAction SilentlyContinue
    $v1Metadata = Get-GraphMetadata
    Get-GraphEntityTypes -EntityTypes $v1Metadata.EntityType -GraphVersion 'v1.0'
    Get-GraphEntityContainers -Metadata $v1Metadata -Version 'v1.0'
    $BetaMetadata = Get-GraphMetadata -Version 'beta'
    Get-GraphEntityTypes -EntityTypes $BetaMetadata.EntityType -GraphVersion 'beta'
    Get-GraphEntityContainers -Metadata $BetaMetadata -Version 'beta'
}

Function New-GraphClassObject {
    Param(
        $Type,
        $Data
    )
    $tempobject = New-Object $Type
    $instPropertyNames = ($Data | Get-Member -MemberType NoteProperty).Name
    $objPropNames = ($tempobject | Get-Member -MemberType Property).Name
    foreach($Property in $instPropertyNames) {
        if($objPropNames -contains $Property) {
            $tempobject."$Property" = $Data."$Property"
        }
    }
    return $tempobject
}

Function ConvertTo-GraphClass {
    Param(
        $Context,
        $Data,
        $Version
    )
    $EntityContainer = ''
    
    if(-not [string]::IsNullOrEmpty($Context)) {
        $type = ($Context.Split('#'))[1]
        $EntityContainer = $Global:GraphAuthenticationHash['EntityContainers']."$($type)_$version"
    }
    foreach($instance in $Data) {

        if(-not [string]::IsNullOrEmpty($instance.'@odata.type')) {

            try {
                $Type = ("$($instance.'@odata.type')_$($Version)").Replace('.','_').Replace('#','')
                if(-not [string]::IsNullOrEmpty($Global:GraphAuthenticationHash['ClassCode']."$type")) {
                    New-GraphClassObject -Type $Type -data $instance
                }
                else {
                    $instance
                }
            }
            catch {
                $instance
            }
        }
        else {

            if(-not [string]::IsNullOrEmpty($EntityContainer)) {
                try{
                    New-GraphClassObject -Type $EntityContainer -Data $instance
                }
                catch {
                    $instance
                }
            }
            else {
                $instance
            }
        }
    }
}

Try {
    . "$($env:APPDATA)\MSGraphAPIClasses.ps1"
}
catch {  }