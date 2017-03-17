Import-Module "$(((Get-Item $PSScriptRoot).Parent).Parent.FullName)\MSGraphAPI"

Describe 'Get-GraphSubscribedSkus' {
    It 'Calls Invoke-GraphMethod with correct params when no params supplied' {
        Mock Invoke-GraphMethod { "$args"  } -ModuleName 'MSGraphAPI'
        $Returned = Get-GraphSubscribedSkus
        $Returned | Should be '-query: subscribedskus -Version: v1.0'
    }
    It 'Calls Invoke-GraphMethod with correct params when Filter used' {
        Mock Invoke-GraphMethod { "$args"  } -ModuleName 'MSGraphAPI'
        $Returned = Get-GraphSubscribedSkus -Filter 'MyFilter'
        $Returned | Should be '-Version: v1.0 -filter: MyFilter -query: subscribedskus'
    }
    It 'Calls Invoke-GraphMethod with correct params when Version used' {
        Mock Invoke-GraphMethod { "$args"  } -ModuleName 'MSGraphAPI'
        $Returned = Get-GraphSubscribedSkus -GraphVersion 'beta'
        $Returned | Should be '-query: subscribedskus -Version: beta'
    }
    It 'Calls Invoke-GraphMethod with correct params when Id used' {
        Mock Invoke-GraphMethod { "$args"  } -ModuleName 'MSGraphAPI'
        $Returned = Get-GraphSubscribedSkus -Id 'myid'
        $Returned | Should be '-Version: v1.0 -filter:  -query: subscribedskus/myid'
    }
}