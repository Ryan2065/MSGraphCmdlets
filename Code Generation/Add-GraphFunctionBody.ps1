Function Add-GraphFunctionBody {
    Param(
        $Data,
        $Customizations,
        $Annotations,
        $Type
    )
    $body = ''
    Switch ($Type) {
        'EntitySet' {
            $Body = @"
    `$ParamHash = @{
        'Version'=`$Version
    }
    if(`$Id) {
        `$ParamHash['query'] = "$($Data.Name)/`$(`$Id)"
    }
    else {
        `$ParamHash['query'] = '$($Data.Name)'
    }

"@
            $ParamArray = 'Filter','Search','Select','Expand','OrderBy','Top','Skip','Count'
            foreach($Param in $ParamArray) {
                $Body = $Body + "    if(-not [string]::IsNullOrEmpty(`$$Param)){`n" + `
                                "        `$ParamHash['$Param'] = `$$Param`n" + `
                                "   }`n"
            }
        }
    }
    if(-not [string]::IsNullOrEmpty($Customizations.Scope)){
        $body = $body + "`$ParamHash['scopes'] = '$($Customizations.Scope)'`n"
    }
    return $body
}