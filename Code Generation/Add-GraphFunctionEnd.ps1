Function Add-GraphFunctionEnd {
    Param(
        $Data,
        $Customizations,
        $Annotations,
        $type
    )
    $End = ''
    Switch ($Type) {
        'EntitySet' {
            $end = "    Invoke-GraphMethod @ParamHash`n"
        }
    }
    return $end
}