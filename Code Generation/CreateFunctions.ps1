Import-Module "$($PSScriptRoot)\New-GraphParameter.ps1"
Import-Module "$($PSScriptRoot)\Add-GraphOData.ps1"
Import-Module "$($PSScriptRoot)\Add-GraphParameters.ps1"
Import-Module "$($PSScriptRoot)\Add-GraphFunctionBody.ps1"
Import-Module "$($PSScriptRoot)\Add-GraphFunctionEnd.ps1"
Import-Module "$($PSScriptRoot)\Add-GraphHelp.ps1"

Function New-GraphEntityGetFunction {
    Param(
        $Metadata,
        $EntityName,
        $Data,
        $Customization,
        $Version = 'v1.0'
    )
    $Annotations = Get-GraphAnnotations -Annotations $Metadata.Annotations -Type 'EntitySet' -Name $Data.Name
    $FunctionName = Get-GraphFunctionName -Name $EntityName -type 'EntitySet' -FunctionVerb 'Get'
    $FunctionHelp = Add-GraphHelp -Customizations $Customization -Data $Data -Annotation $Annotations -FunctionName $FunctionName -Type 'EntitySet'
    $FunctionParameters = Add-GraphParameters -Customizations $Customization -Data $Data -Annotation $Annotations -Type 'EntitySet' -Version $Version
    $FunctionBody = Add-GraphFunctionBody -Customizations $Customization -Data $Data -Annotation $Annotations -Type 'EntitySet'
    $FunctionEnd = Add-GraphFunctionEnd -Customizations $Customization -Data $Data -Annotation $Annotations -Type 'EntitySet'
    $FunctionData = @"
$FunctionName {
$FunctionHelp
$FunctionParameters
$($Customization.BodyStart)
$FunctionBody
$($Customization.BodyEnd)
$FunctionEnd
$($Customization.FunctionEnd)
}

"@

    $FileName = "$($PSScriptRoot)\GeneratedFiles\$($EntityName).ps1"
    $FunctionData >> $FileName
}

Function Get-GraphCustomizations {
    Param(
        $Customizations,
        $Type,
        $Name
    )
    Foreach($FunctionCusomization in $Customizations.Functions.Function) {
        if(($FunctionCusomization.Name -eq $Name) -and ($FunctionCusomization.Type -eq $type)) {
            return $FunctionCusomization
        }
    }
    return $null
}

Function Get-GraphFunctionName {
    Param(
        $Name,
        $type,
        $FunctionVerb
    )
    switch($type) {
        'EntitySet'{
            if($FunctionVerb -eq 'Get') {
                return "Function Get-Graph$($Name)"
            }
        }
    }
}

Function Get-GraphAnnotations {
    Param(
        $Annotations,
        $Type,
        $Name
    )
    foreach($Annotation in $Annotations) {
        if($Annotation.Target -eq "microsoft.graph.$($Name)") {
            return $Annotation
        }
    }
    return $null
}



$Metadata = Get-GraphMetadata
$BetaMetadata = Get-GraphMetadata -Version 'beta'

$GeneratedFiles = Get-ChildItem "$($PSScriptRoot)\GeneratedFiles"
foreach($File in $GeneratedFiles) { Remove-Item $File.FullName -Force }

$EntityContainerArray = @()

[xml]$FunctionCustomizations = Get-Content "$($PSScriptRoot)\FunctionCustomizations.xml"

Foreach($instance in $Metadata.EntityContainer.EntitySet) {
    $EntityName = ($instance.Name).Substring(0,1).ToUpper() + ($instance.Name).Substring(1)
    $Customization = Get-GraphCustomizations -Customizations $FunctionCustomizations -Type 'EntitySet' -Name $instance.Name
    if($Customization.Skip -ne 'True') {
        New-GraphEntityGetFunction -Metadata $Metadata -EntityName $EntityName -Data $instance -Customization $Customization
        $EntityContainerArray += @($EntityName)
    }
}

Foreach($instance in $BetaMetadata.EntityContainer.EntitySet) {
    $EntityName = ($instance.Name).Substring(0,1).ToUpper() + ($instance.Name).Substring(1)
    if($EntityContainerArray -notcontains $EntityName) {
        $Customization = Get-GraphCustomizations -Customizations $FunctionCustomizations -Type 'EntitySet' -Name $instance.Name
        if($Customization.Skip -ne 'True') {
            New-GraphEntityGetFunction -Metadata $BetaMetadata -EntityName $EntityName -Data $instance -Customization $Customization -Version 'beta'
        }
    }
}

