#We import files with . so execution policy needs to be set to less restictive during the import
$tempContext = Get-ExecutionPolicy -Scope Process
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

#Adding dll helper to use the ADAL library Microsoft provides
$null = Add-Type -Path "$PSScriptRoot\bin\MSGraphAPI.dll"

#Importing PowerShell classes - Not done automatically so they can be imported in the right order
. "$PSScriptRoot\Classes\MSGraphAPISettings.class.ps1"
. "$PSScriptRoot\Classes\MSGraphAPI_v1.class.ps1"

#importing all normal commands
$Commands = Get-ChildItem "$PSScriptRoot\Commands" -Filter '*.ps1'
Foreach($file in $Commands){
    . $file.FullName
}

#importing all private commands
$PrivateCommands = Get-ChildItem "$PSScriptRoot\PrivateCommands" -Filter '*.ps1'
Foreach($file in $PrivateCommands){
    . $file.FullName
}

#Resetting execution policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy $tempContext

Export-ModuleMember -Function $Commands.BaseName