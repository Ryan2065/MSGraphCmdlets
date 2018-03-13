Function Test-MSGraphAPIConnection {
    [OutputType([Bool])]
    Param(
        
    )
    if($null -ne $Script:MSGraphAPISettings){
        if($Script:MSGraphAPISettings.ExpiresOn -lt (Get-Date).AddMinutes(-5).ToUniversalTime()){
            $ConnectParams = $Script:MSGraphAPISettings.ConnectParameters
            Connect-MSGraphAPI @ConnectParams
        }
        return $true
    }
    else {
        throw "Connect-MSGraphAPI must be run first to get the token!"
        return $false
    }
}