<#Function Get-GraphUsers {
<#
    .SYNOPSIS
        Used to get a list of users in Azure AD

    .DESCRIPTION
        Queries Graph /users to get information on users in Azure AD

    .EXAMPLE
        Get-GraphUsers -Filter "startswith(displayName,'Sec')"

    .PARAMETER Filter
        Use OData filter query. Additional documentation found here: https://developer.microsoft.com/en-us/graph/docs/overview/query_parameters

    .PARAMETER UserId
        Query a specific user by Id

    .PARAMETER GraphVersion
        Graph version to query. Acceptible values are v1.0 or beta

    .PARAMETER SelectProperties
        List of properties to retrieve. Not all properties come by default, like assignedLicenses

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/resources/user
    
    .Notes
        Author: Ryan Ephgrave
#>
<#    Param(
        [string]$Filter,
        [string]$UserId,
        [string]$GraphVersion = 'v1.0',
        [string[]]$SelectProperties
    )

    try {
        $ParamHash = @{
            'Version'=$GraphVersion
        }
        if(-not [string]::IsNullOrEmpty($UserId)) {
            $UserId = $UserId.Replace('@','%40')
            $ParamHash['query'] = "users/$($UserId)"
        }
        else {
            $ParamHash['query'] = 'users'
        }
        if(-not [string]::IsNullOrEmpty($Filter)){
            $ParamHash['filter'] = $Filter
        }
        if(-not [string]::IsNullOrEmpty($SelectProperties)){
            $SelectString = ''
            foreach($instance in $SelectProperties) {
                $SelectString = $SelectString + ",$($instance)"
            }
            $SelectString = $SelectString.TrimStart(',')
            $ParamHash['Select'] = $SelectString
        }
        Invoke-GraphMethod @ParamHash
    }
    catch {
        throw $_
    }
}
#>
Function New-GraphUser {
<#
    .SYNOPSIS
        Will create a new user through Graph in Azure AD

    .DESCRIPTION
        Can create a user with properties

    .EXAMPLE
        New-GraphUser -userPrincipalName 'Ryan@Tenant.onmicrosoft.com' -displayName 'Ryan Ephgrave' -Pass 'MyTestPass' -MailNickName 'Ryan.Mailbox'

    .PARAMETER accountEnabled
        Create the account as enabled.

    .PARAMETER userPrincipalName
        The user principal name (someuser@contoso.com).

    .PARAMETER displayName
        The name to display in the address book for the user.

    .PARAMETER Pass
        The password for the user. This property is required when a user is created. It can be updated, but the user will be required to change the password on the next login. The password must satisfy minimum requirements as specified by the user’s passwordPolicies property. By default, a strong password is required.

    .PARAMETER forceChangePasswordNextLogin
        true if the user must change her password on the next login; otherwise false.

    .PARAMETER MailNickName
        The mail alias for the user.

    .LINK
        https://developer.microsoft.com/en-us/graph/docs/api-reference/v1.0/api/user_post_users
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param (
        [Parameter(Mandatory=$false)]
        [bool]$accountEnabled = $true,
        [Parameter(Mandatory=$true)]
        [string]$userPrincipalName,
        [Parameter(Mandatory=$true)]
        [string]$displayName,
        [Parameter(Mandatory=$true)]
        [string]$Pass,
        [Parameter(Mandatory=$false)]
        [bool]$forceChangePasswordNextLogin = $true,
        [Parameter(Mandatory=$true)]
        $MailNickName
    )
        [hashtable]$UserHashTable = @{
            'accountEnabled'=$accountEnabled
            'displayName'=$displayName
            'mailNickname'=$MailNickName
            'userPrincipalName'=$userPrincipalName
            'passwordProfile'=@{
                                'password'=$Pass
                                'forceChangePasswordNextSignIn'=$forceChangePasswordNextLogin
                             }
            
        }
        $UserJSON = $UserHashTable | ConvertTo-Json -Depth 10
        Invoke-GraphMethod -Method 'Post' -query 'users' -body $UserJSON -ContentType 'application/json'
}

