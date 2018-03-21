Function New-MSGraphClassMember {
    Param(
        [object]$InputObject,
        [string]$Context,
        [string]$Version,
        [string]$BaseURI
    )
    $EntityContainer = ''
    if(-not [string]::IsNullOrEmpty($Context)) {
        try {
            $type = ($Context.Split('#'))[1]
            $SplitType = $Type.Split('/')
            foreach($instance in $SplitType){
                if($instance -ne '$entity' ) {
                    $type = $instance
                }
            }
            $EntityContainer = $Script:MSGraphAPIClassHash[$type]
            if([string]::IsNullOrEmpty($EntityContainer)){
                $type = $type.TrimEnd('s')
                $EntityContainer = $Script:MSGraphAPIClassHash[$type]
            }
        }
        catch {
            #keeping empty
            $null
        }
    }
    foreach($instance in $InputObject) {
        try {
            $NoteProperties = (Get-Member -InputObject $instance -MemberType NoteProperty).Name
            if(-not [string]::IsNullOrEmpty($instance.'@odata.type')) {
                $Type = ''
                $Type = $Script:MSGraphAPIClassHash[ ($instance.'@odata.type').TrimStart('#') ]
                if(-not [string]::IsNullOrEmpty($Type)){
                    $tempobj = New-Object -TypeName $Type
                    $tempobj.AdditionalProperties = @{}
                    foreach($NoteProperty in $NoteProperties) {
                        try{
                            $tempobj."$($NoteProperty)" = $instance."$($NoteProperty)"
                            if($NoteProperty -eq 'Id'){
                                $tempObj.GraphPath = "$BaseURI/$($instance."$($NoteProperty)")"
                            }
                        }
                        catch {
                            if( ($NoteProperty -ne '@odata.context') -and ($NoteProperty -ne '@odata.type') ){
                                $tempobj.AdditionalProperties.Add($NoteProperty, $instance."$($NoteProperty)")
                            }
                        }
                    }
                    $tempobj
                }
                else {
                    return $instance
                }
            }
            else {
                if(-not [string]::IsNullOrEmpty($EntityContainer)) {
                    $tempobj = New-Object -TypeName $EntityContainer
                    $tempobj.AdditionalProperties = @{}
                    foreach($NoteProperty in $NoteProperties) {
                        try{
                            $tempobj."$($NoteProperty)" = $instance."$($NoteProperty)"
                            if($NoteProperty -eq 'Id'){
                                $tempObj.GraphPath = "$BaseURI/$($instance."$($NoteProperty)")"
                            }
                        }
                        catch {
                            if($NoteProperty -ne '@odata.context'){
                                $tempobj.AdditionalProperties.Add($NoteProperty, $instance."$($NoteProperty)")
                            }
                        }
                    }
                    $tempobj
                }
                else {
                    $instance
                }
            }
        }
        catch {
            throw
            $instance
        }
    }
}