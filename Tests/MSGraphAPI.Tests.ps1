Import-Module "$((Get-Item $PSScriptRoot).Parent.FullName)\MSGraphAPI"

Describe 'Get-GraphAuthenticationToken'{
    Context 'Get standard token'{
        Mock Write-GraphLog { } -ModuleName MSGraphAPI
        Mock Invoke-WebRequest {
            Param($Uri, $Method, $Body)
            #'{"access_token":"myaccesstoken"}'
            "{`"access_token`":`"$($Uri)$($Method)$($Body)`"}"
        } -ModuleName MSGraphAPI
        $PlainTextPassword = 'test'
        $UserName = 'user@test.com'
        $secpasswd = ConvertTo-SecureString $PlainTextPassword -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ($UserName, $secpasswd)
        $TenantName = 'MyTenant'
        $GraphParams = @{
            'TenantName' = $TenantName
            'Credential' = $mycreds
        }
        Get-GraphAuthenticationToken @GraphParams
        $TokenShouldBe = "https://login.microsoftonline.com/$($TenantName)/oauth2/tokenPOSTresource=https://graph.microsoft.com/&client_id=1950a258-227b-4e31-a9cf-717495945fc2&grant_type=password&username=$($UserName)&scope=user_impersonation&password=$($PlainTextPassword)"

        It 'Stores tenant name'{
            $Params = $Global:GraphAuthenticationHash['Parameters']
            $Params['TenantName'] | Should Be 'MyTenant'
        }

        It 'Stores credential'{
            $Params = $Global:GraphAuthenticationHash['Parameters']
            $Params['Credential'] | Should Be $mycreds
        }

        It 'Stores token' {
            $Global:GraphAuthenticationHash['Token'] | Should be $TokenShouldBe
        }

        It 'Stores header' {
            $Header = "Bearer $($TokenShouldBe)"
            $Global:GraphAuthenticationHash['Header'].Authorization | Should Be $Header
        }
        It 'Only called log once' {
            Assert-MockCalled Write-GraphLog 1 -ModuleName MSGraphAPI
        }
    }
}

Describe 'Invoke-GraphMethod' {
    It 'throws when Get-GraphAuthenticationToken is not called first' {
        $Global:GraphAuthenticationHash = $null
        $threw = ''
        try {
            Invoke-GraphMethod -query 'users'
         }
         catch { $threw = $_.Exception.Message }
         $threw | Should Be 'You must call Get-GraphAuthenticationToken first!'
    }
    It 'Has correct parameters on Invoke-RestMethod when -query "users"' {
        $Global:GraphAuthenticationHash = @{
            'Parameters' = @{
                'TenantName' = 'MyTenantName'
                'Credential' = 'MyCreds'
            }
            'Header' = 'Header'
        }
        Mock Get-GraphAuthenticationToken {} -ModuleName MSGraphAPI
        Mock Write-GraphLog {} -ModuleName MSGraphAPI
        Mock Invoke-RestMethod {
            Param($Uri, $Method, $Body, $Headers, $ContentType)
            return "$($Uri)$($Method)$($Body)$($Headers)$($ContentType)"
        } -ModuleName MSGraphAPI
        $version = 'v1.0'
        $query = 'users'
        $uri = "https://graph.microsoft.com/$($version)/$($query)?"
        $Method = 'Get'
        $shouldbe = "$($Uri)$($Method)Header"
        Invoke-GraphMethod -query 'users' | should be $shouldbe
    }
}