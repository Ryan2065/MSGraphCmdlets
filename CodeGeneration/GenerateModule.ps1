#region Get Templates
$Script:EnumTemplate = Get-Content "$PSScriptRoot\Templates\EnumTemplate.ps1" -Raw
$Script:ComplexTypeTemplate = Get-Content "$PSScriptRoot\Templates\ComplexTypeTemplate.ps1" -Raw
$Script:EntityTypeTemplate = Get-Content "$PSScriptRoot\Templates\EntityTypeTemplate.ps1" -Raw
$Script:BaseClass = Get-Content "$PSScriptRoot\Templates\BaseClass.ps1" -raw
$Script:FinalFile = New-Object System.Collections.ArrayList
#endregion

#region Import Functions
. "$PSScriptRoot\Commands\Common.ps1"
. "$PSScriptRoot\Commands\EnumType.ps1"
. "$PSScriptRoot\Commands\ComplexType.ps1"
. "$PSScriptRoot\Commands\EntityType.ps1"
#endregion

$NamePrefix = "MSGraphAPI"
$GraphVersion = "v1"
[xml]$Script:Metadata = Get-Content "$PSScriptRoot\`$metadata.xml" -Raw
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