Class GraphScopes {
    [string[]]$ScopeNames
    [string]$ScopeType
}

Class GraphType {
    [string]$Name
    [bool]$Beta
    [bool]$v1
    [string[]]$Type
    [GraphScopes]$Scopes
}

$APIReference = "$(((Get-Item $PSScriptRoot).Parent).FullName)\microsoft-graph-docs\api-reference"
$Docs = Get-ChildItem $APIReference -Recurse -Filter "*.md"

Function ConvertFrom-GraphMarkdown {
    Param(
        $Document
    )
    $Text = [System.IO.File]::ReadAllText($Document.FullName)
    $FileName = $Document.Name
    if(-not [string]::IsNullOrEmpty($text)) {
        $text = $text.Trim()
        if(-not [string]::IsNullOrEmpty($text)) {
            $Splittext = $Text.Split('#')
        }
        $GraphObject = New-Object GraphType
        Foreach($instance in $Splittext) {
            $SplitInstance = $instance.Split("`n")
            if(-not [string]::IsNullOrEmpty($instance)) {
                if($instance.ToLower().Contains('http request')) {
                    $FoundHTTP = $false
                    foreach($line in $SplitInstance) {
                        if(-not [string]::IsNullOrEmpty($line)) {
                            if($line.contains('http')) {
                                $FoundHTTP = $true
                            }
                            if($line.contains('/') -and $FoundHTTP) {
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Process list 
foreach($doc in $docs) {
    ConvertFrom-GraphMarkdown -Document $Doc
}

