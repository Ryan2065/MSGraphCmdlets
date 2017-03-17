Import-Module "$(((Get-Item $PSScriptRoot).Parent).Parent.FullName)\MSGraphAPI"

Describe 'Get-GraphSubscribedSkus' {
    It 'Calls Invoke-GraphMethod with correct params' {
        Mock Invoke-GraphMethod { "$args"  } -ModuleName 'MSGraphAPI'
        $Returned = Get-GraphSubscribedSkus
        $Returned | Should be '-query: subscribedskus'
    }
}