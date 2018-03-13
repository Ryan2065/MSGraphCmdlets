Function Get-MSGraphObject {
    Param(
        [string]$GraphPath
    )
    if(Test-MSGraphAPIConnection){
        try{
            $tempObject = $Script:MSGraphClient
            $SplitPath = $GraphPath.Split('/')

            foreach($instance in $SplitPath){
                $tempObject = $tempObject."$instance"
            }
            if($tempObject -eq $Script:MSGraphClient){
                Get-MSGraphObjectByURL -GraphPath $GraphPath
            }
            else {
                $tempObject.Request().GetAsync().GetAwaiter().GetResult()
            }
        }
        catch {
            Get-MSGraphObjectByURL -GraphPath $GraphPath
        }
    }
}

Function Get-MSGraphObjectByURL{
    Param(
        [string]$GraphPath
    )
    $URL = "$($Script:MSGraphClient.BaseURL)/$($GraphPath)"
    $httpRequestMessage = New-Object System.Net.Http.HttpRequestMessage -ArgumentList 'Get',$URL
    $null = $Script:MSGraphClient.AuthenticationProvider.AuthenticateRequestAsync($httpRequestMessage).GetAwaiter().GetResult()
    $response = $Script:MSGraphClient.HttpProvider.SendAsync($httpRequestMessage).GetAwaiter().GetResult()
    $responseContent = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()
    if($response.IsSuccessStatusCode){
        if(-not [string]::IsNullOrEmpty($responseContent)){
            $ResponseObject = ConvertFrom-Json -InputObject $responseContent
            $ResponseObject.Value
        }
    }
    else {
        throw $responseContent
    }
}