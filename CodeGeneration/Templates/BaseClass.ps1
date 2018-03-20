$Script:MSGraphAPIClassHash = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
$Script:MSGraphAPICreateArray = New-Object -TypeName System.Collections.ArrayList
$Script:MSGraphAPIDeleteArray = New-Object -TypeName System.Collections.ArrayList
$Script:MSGraphAPIUpdateArray = New-Object -TypeName System.Collections.ArrayList

Function Start-MSGraphAPIAction {
    Param (
        [string]$BaseURI,
        [string]$Action,
        [Hashtable]$ParamHash
    )
    $InvokeHash = @{
        'query' = "$($BaseURI)/$($Action)"
        'method' = 'Post'
    }
    if($null -ne $ParamHash) {
        $InvokeHash.Add('ContentType', 'application/json')
        $InvokeHash.Add('body', ($ParamHash | ConvertTo-JSON -Depth 10) )
    }
    Invoke-MSGraphMethod @InvokeHash
}

Function Start-MSGraphAPIFunction {
    Param (
        [string]$BaseURI,
        [string]$Function,
        [Hashtable]$ParamHash
    )
    $InvokeHash = @{
        'query' = "$($BaseURI)/$($Function)"
        'method' = 'Get'
    }
    if($null -ne $ParamHash) {
        $InvokeHash.Add('ContentType', 'application/json')
        $InvokeHash.Add('body', ($ParamHash | ConvertTo-JSON -Depth 10) )
    }
    Invoke-MSGraphMethod @InvokeHash
}

Class MSGraphAPI_Base {
    [hashtable] $AdditionalProperties
    hidden [string] $GraphPath
}
