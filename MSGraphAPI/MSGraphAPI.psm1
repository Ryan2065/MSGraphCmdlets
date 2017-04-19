Function Get-GraphAuthenticationToken {
<#
    .SYNOPSIS
        Will get an authentication token for https://graph.microsoft.com

    .DESCRIPTION
        Will request the token from https://login.microsoftonline.com/Common/oauth2/token

    .EXAMPLE
        Get-GraphAuthenticationToken -TenantName 'MyTenant.onmicrosoft.com' -Credential (Get-Credential)
        This will get a token for the specified tenant using the credentials. Credentials can also be created using this code:
        $secpasswd = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ('USER@TENANT', $secpasswd)

    .PARAMETER TenantName
        Name of the tenant. Usually in the form of xxxxx.onmicrosoft.com

    .PARAMETER Credential
        Credential object. Can be generated with the code:
        $secpasswd = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
        $mycreds = New-Object System.Management.Automation.PSCredential ('USER@TENANT', $secpasswd)

    .PARAMETER Scopes
        Array of scopes. To be used when Office 365 support is rolled out. 

    .PARAMETER clientid
        Client Id of the application used to contact Graph. To be used when Office 365 support is rolled out.

    .PARAMETER redirecturi
        Redirect URI of the application used to contact Graph. To be used when Office 365 support is rolled out

    .PARAMETER clientsecret
        Client secret of application used to contact Graph. To be used when Office 365 support is rolled out.

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets

    .NOTES
        Author: Ryan Ephgrave
#>
    Param (
        [Parameter(Position=0, Mandatory=$true)][string]$TenantName,
        [Parameter(Position=1, Mandatory=$true)][pscredential]$Credential,
        [Parameter(Position=2, Mandatory=$false)][string[]]$Scopes,
        [Parameter(Position=3, Mandatory=$false)][string]$clientid,
        [Parameter(Position=4, Mandatory=$false)][string]$redirecturi,
        [Parameter(Position=5, Mandatory=$false)][string]$clientsecret,
        [Parameter(Position=6, Mandatory=$false)][switch]$SkipClass
    )
        $username = $Credential.UserName
        $password = $Credential.Password 
        $Marshal = [System.Runtime.InteropServices.Marshal] 
        $Bstr = $Marshal::SecureStringToBSTR($Password) 
        $Password = $Marshal::PtrToStringAuto($Bstr) 
        $Marshal::ZeroFreeBSTR($Bstr)
    if([string]::IsNullOrEmpty($Scopes)) {
        $PayLoad = "resource=https://graph.microsoft.com/&client_id=1950a258-227b-4e31-a9cf-717495945fc2&grant_type=password&username=$($UserName)&scope=user_impersonation&password=$($Password)" 
        $response = ''
        $Response = Invoke-WebRequest -Uri "https://login.microsoftonline.com/$($TenantName)/oauth2/token" -Method POST -Body $PayLoad
        $ResponseJSON = $Response | ConvertFrom-Json
        $GraphAPIAuthenticationHeader = $null
        $GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
        $GraphAPIAuthenticationHeader.Add("Authorization", "Bearer $($ResponseJSON.access_token)")
        $Global:GraphAuthenticationHash = @{
                'Parameters' = @{
                'TenantName' = $TenantName
                'Credential' = $Credential
                'SkipClass' = $SkipClass
            }
            'Token' = $ResponseJSON.access_token
            'Header' = $GraphAPIAuthenticationHeader
        }
    }
    else {
        if([string]::IsNullOrEmpty($clientid)) {
            $clientid = 'cb89a343-cd2e-463f-81cd-9527bdbda08d'
        }
        if([string]::IsNullOrEmpty($redirecturi)) {
            $redirecturi = 'urn:ietf:wg:oauth:2.0:oob'
        }
        $Authority = "https://login.microsoftonline.com/$($TenantName)/oauth2/token"
        $ResourceURI = 'https://graph.microsoft.com'
        $App = [Microsoft.Identity.Client.PublicClientApplication]::new($Authority, $clientid)
        $App.RedirectUri = $redirecturi
        $Result = ($app.AcquireTokenAsync($Scopes)).Result
        $GraphAPIAuthenticationHeader = $null
        $GraphAPIAuthenticationHeader = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
        $GraphAPIAuthenticationHeader.Add("Authorization", "Bearer $($Result.Token)")
        $Global:GraphAuthenticationHash = @{
                'Parameters' = @{
                'TenantName' = $TenantName
                'Credential' = $Credential
                'clientID' = $clientid
                'redirecturi' = $redirecturi
                'SkipClass' = $SkipClass
            }
            'Token' = $Result.Token
            'Header' = $GraphAPIAuthenticationHeader
        }
    }
}

Function Invoke-GraphMethod {
<#
    .SYNOPSIS
        Will run specified graph query with REST.

    .DESCRIPTION
        Handles the authentication piece assuming Get-GraphAuthenticationToken was already called once before in the PowerShell session.

    .EXAMPLE
        Invoke-GraphMethod -Method 'Post' -Version 'beta' -query 'deviceAppManagement/mobileApps' -body $AppJSON -ContentType 'application/json'
        This will create an application in Graph.

    .EXAMPLE
        Invoke-GraphMethod -Query 'me/messages' -Search 'from:help@contoso.com' -Select 'from,subject'
        Searches all messages in the current authenticated user mailbox for ones from e-mail help@contoso.com. Only will return the properties from and subject

    .PARAMETER Query
        The the query parameter of the URI - For example, in https://graph.microsoft.com/v1.0/messages "messages" is the query. To call this, simply call Invoke-GraphMethod like this:
        Invoke-GraphMethod -Query "messages"

    .PARAMETER Version
        Not required - Used to specify v1.0 or beta. Defaults to v1.0

    .PARAMETER Method
        REST method to use. 

    .PARAMETER Body
        Content body for REST method

    .PARAMETER ContentType
        Type of content for body

    .PARAMETER Filter
        Filters the response based on a set of criteria.

    .PARAMETER Search
        A property and value pair separated by a colon.

    .PARAMETER Select
        Comma-separated list of properties to include in the response.

    .PARAMETER Expand
        Comma-separated list of relationships to expand and include in the response.

    .PARAMETER OrderBy
        Comma-separated list of properties that are used to sort the order of items in the response collection.

    .PARAMETER Top
        The number of items to return in a result set.

    .PARAMETER Skip
        The number of items to skip in a result set.

    .PARAMETER SkipToken
        Paging token that is used to get the next set of results.

    .PARAMETER Count
        A collection and the number of items in the collection.

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $query,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $Version = 'v1.0',
        [Parameter(Mandatory=$false)]
        [ValidateSet(
            'Default',
            'Delete',
            'Get',
            'Head',
            'Merge',
            'Options',
            'Patch',
            'Post',
            'Put',
            'Trace'
        )]
        $method = 'Get',
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $body,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $ContentType,
        [Parameter(Mandatory=$false)]
        $filter,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $search,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $select,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $expand,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $orderby,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$top,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[int]]$skip,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        $skipToken,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Nullable[bool]]$count,
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [string[]]$scopes
    )
    
        if ($null -ne $Global:GraphAuthenticationHash) {
            $Parameters = $Global:GraphAuthenticationHash['Parameters']
            if(-not [string]::IsNullOrEmpty($Scopes)) { $Parameters['scopes'] = $Scopes }
            Get-GraphAuthenticationToken @Parameters
        }
        else {
            throw 'You must call Get-GraphAuthenticationToken first!'
        }

    $uri = "https://graph.microsoft.com/$($version)/$($query)?"

    if(-not [string]::IsNullOrEmpty($Filter)) {
        $uri = "$($uri)`$filter=$($Filter.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($search)) {
        $uri = "$($uri)`$search=`"$($search.replace(' ','%20').replace("'",'%27'))`"&"
    }

    if(-not [string]::IsNullOrEmpty($select)) {
        $uri = "$($uri)`$select=$($select.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($expand)) {
        $uri = "$($uri)`$expand=$($expand.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($orderby)) {
        $uri = "$($uri)`$orderby=$($orderby.replace(' ','%20').replace("'",'%27'))&"
    }

    if(-not [string]::IsNullOrEmpty($top)){
        $uri = "$($uri)`$top=$($top)&"
    }

    if(-not [string]::IsNullOrEmpty($skip)){
        $uri = "$($uri)`$skip=$($skip)&"
    }

    if(-not [string]::IsNullOrEmpty($skipToken)) {
        $uri = "$($uri)`$skipToken=$($skip)&"
    }

    if($count) {
        $uri = "$($uri)`$count=true&"
    }

    $uri = ($uri.TrimEnd('&')).TrimEnd('?')

    $RestParams = @{
        'Method' = $method
    }

    if(-not [string]::IsNullOrEmpty($body)) {
        $RestParams['Body'] = $body
    }
    if(-not [string]::IsNullOrEmpty($ContentType)) {
        $RestParams['ContentType'] = $ContentType
    }
        $returned = Invoke-RestMethod -Uri $uri -Headers $Global:GraphAuthenticationHash['Header'] @RestParams
        if(-not [string]::IsNullOrEmpty($returned.'@odata.nextLink')){
            Get-GraphNextLink -NextLink $returned.'@odata.nextLink'
        }
        if($returned.Value) {
            if($Global:GraphAuthenticationHash.Parameters.SkipClass) {
                $returned.Value
            }
            else {
                New-GraphClassMember -Context $returned.'@odata.context' -Data $returned.Value -Version $Version
            }
        }
        else {
            if($Global:GraphAuthenticationHash.Parameters.SkipClass) {
                $returned
            }
            else {
                New-GraphClassMember -Context $returned.'@odata.context' -Data $returned -Version $Version
            }
        
        }
}

Function Get-GraphNextLink {
<#
    .SYNOPSIS
        Will get the next page of results if there are additional pages

    .DESCRIPTION
        Will get the next page of results if there are additional pages

    .EXAMPLE
        Get-GraphNextLink -NextLink $returned.'@odata.nextLink'

    .PARAMETER NextLink
        Returned through a query when the results are > 100.

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    Param(
        $NextLink
    )
    $returned = Invoke-RestMethod -Uri $NextLink -Headers $Global:GraphAuthenticationHash['Header']
    if(-not [string]::IsNullOrEmpty($returned.'@odata.nextLink')){
        Get-GraphNextLink -NextLink $returned.'@odata.nextLink'
    }
    if($returned.Value) {
        if($Global:GraphAuthenticationHash.Parameters.SkipClass) {
            $returned.Value
        }
        else {
            New-GraphClassMember -Context $returned.'@odata.context' -Data $returned.Value -Version $Version
        }
    }
    else {
        if($Global:GraphAuthenticationHash.Parameters.SkipClass) {
            $returned
        }
        else {
            New-GraphClassMember -Context $returned.'@odata.context' -Data $returned -Version $Version
        }
    }
}

Function Get-GraphMetadata {
<#
    .SYNOPSIS
        Gets the graph metadata

    .DESCRIPTION
        Used to see what entities and properties are available in the graph tenant

    .EXAMPLE
        Get-GraphMetadata -Version 'beta'
        Will get all the graph metadata for beta

    .PARAMETER Version
        Graph version to query. Acceptible values are v1.0 or beta

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets
    
    .Notes
        Author: Ryan Ephgrave
#>
    param(
        $Version = 'v1.0'
    )
    (Invoke-RestMethod -Method Get -Uri "https://graph.microsoft.com/$($Version)/`$metadata" -Headers $Global:GraphAuthenticationHash['Header'] ).Edmx.DataServices.Schema
}

Function Show-GraphMetadataExplorer {
<#
    .SYNOPSIS
        Shows a UI to easily browse Graph Metadata

    .DESCRIPTION
        Shows a WPF UI that will allow a user to see exactly what is in their environment.

    .EXAMPLE
        Show-GraphMetadata

    .LINK
        https://github.com/Ryan2065/MSGraphCmdlets/wiki/Show-GraphMetadataExplorer
    
    .Notes
        Author: Ryan Ephgrave
#>
    ."$PSScriptRoot\MetadataExplorer\MetadataExplorer.ps1"
}

Function New-GraphClassMember {
    Param(
        $Context,
        $Data,
        $Version
    )
    $EntityContainer = ''
    if(-not [string]::IsNullOrEmpty($Context)) {
        $type = ($Context.Split('#'))[1]
        $EntityContainer = ("microsoft_graph_$($type)_$($version)").Replace('.','_').Replace('#','')
        try {
            $test = New-Object $EntityContainer
        }
        catch {
            $type = $type.TrimEnd('s')
            $EntityContainer = ("microsoft_graph_$($type)_$($version)").Replace('.','_').Replace('#','')
        }
    }
    foreach($instance in $Data) {
        try {
            $NoteProperties = (Get-Member -InputObject $instance -MemberType NoteProperty).Name
            if(-not [string]::IsNullOrEmpty($instance.'@odata.type')) {
                $Type = ("$($instance.'@odata.type')_$($Version)").Replace('.','_').Replace('#','')
                $tempobj = New-Object -TypeName $Type
                $tempObjProperties = (Get-Member -InputObject $tempobj -MemberType Property).Name
                foreach($NoteProperty in $NoteProperties) {
                    try{
                        $tempobj."$($NoteProperty)" = $instance."$($NoteProperty)"
                    }
                    catch {
                        $tempobj.GraphAdditionalProperties[$NoteProperty] = $instance."$($NoteProperty)"
                    }
                }
                $tempobj
            }
            else {
                if(-not [string]::IsNullOrEmpty($EntityContainer)) {
                    $tempobj = New-Object -TypeName $EntityContainer
                    foreach($NoteProperty in $NoteProperties) {
                        try{
                            $tempobj."$($NoteProperty)" = $instance."$($NoteProperty)"
                        }
                        catch {
                            $tempobj.GraphAdditionalProperties[$NoteProperty] = $instance."$($NoteProperty)"
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
            $instance
        }
    }
}

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

$PowerShellFiles = Get-ChildItem $PSScriptRoot -Recurse -Filter "*.ps1"
Foreach($File in $PowerShellFiles) {
    If(-not $File.DirectoryName.EndsWith('MetadataExplorer')){
        . $File.FullName
    }
}

$null = [System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Microsoft.Identity.Client\Microsoft.Identity.Client.Platform.dll")
$null = [System.Reflection.Assembly]::LoadFrom("$PSScriptRoot\Microsoft.Identity.Client\Microsoft.Identity.Client.dll")

