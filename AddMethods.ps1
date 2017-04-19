Function Add-GraphMethods {
    param(
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
        $tempobj = $instance
        if(-not [string]::IsNullOrEmpty($instance.'@odata.type')) {
            try {
                
                $Type = ("$($instance.'@odata.type')_$($Version)").Replace('.','_').Replace('#','')
                $NavProps = $Global:GraphAuthenticationHash['NavProps']."$type"
                if(-not [string]::IsNullOrEmpty($NavProps)) {
                    foreach($NavProp in $NavProps) {
                        $Expression = "Add-Member -MemberType ScriptMethod -InputObject `$tempobj -Name 'Get_$NavProp' -Value { Invoke-GraphMethod -query `"users/`$(`$this.id)/$NavProp`" } -force"
                        Invoke-Expression $Expression
                    }
                    $tempobj
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
                $NavProps = $Global:GraphAuthenticationHash['NavProps']."$EntityContainer"
                if(-not [string]::IsNullOrEmpty($NavProps)) {
                    foreach($NavProp in $NavProps) {
                        $Expression = "Add-Member -MemberType ScriptMethod -InputObject `$tempobj -Name 'Get_$NavProp' -Value { Invoke-GraphMethod -query `"users/`$(`$this.id)/$NavProp`" } -force"
                        Invoke-Expression $Expression
                    }
                    $tempobj
                }
                else {
                    $instance
                }
            }
            else {
                $instance
            }
        }
    }
}