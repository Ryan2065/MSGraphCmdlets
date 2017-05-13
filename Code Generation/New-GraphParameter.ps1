Function New-GraphParameter {
    Param(
        $Name,
        [switch]$ValidateNullOrEmpty,
        [switch]$Mandatory,
        $Type,
        $ParameterSets
    )
    $return = ''
    if($ValidateNullOrEmpty) {
        $return = $return + "        [ValidateNotNullOrEmpty()]`n"
    }
    if($Mandatory) {
        $return = $return + "        [Parameter(Mandatory=`$true)]`n"
    }
    else {
        foreach($ParameterSet in $ParameterSets) {
            $return = $return + "        [Parameter(ParameterSetName='$($ParameterSet.ParameterSetName)', Mandatory=`$$($ParameterSet.Mandatory))]`n"
        }
    }
    if([string]::IsNullOrEmpty($Type)) {
        $return = $return + "        `$$($Name)"
    }
    else {
        $return = $return + "        [$($Type)]`$$($Name)"
    }
    $return
}
