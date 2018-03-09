$null = Add-Type -Path "$PSScriptRoot\bin\MSGraphAPI.dll"

$Commands = Get-ChildItem "$PSScriptRoot\Commands" -Filter '*.ps1'
Foreach($file in $Commands){
    . $Commands.FullName
}

Export-ModuleMember -Function $Commands.BaseName