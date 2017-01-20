Function New-GraphApplication {
    Param(
        [string]$DisplayName = "MS Graph PowerShell Cmdlets",
        [switch]$MSGraphApplication
    )
    if($MSGraphApplication) {
        $AppJson = @"
{

  "odata.type": "Microsoft.DirectoryServices.Application",
  "objectType": "Application",
  "deletionTimestamp": null,
  "allowActAsForAllClients": null,
  "appBranding": null,
  "appCategory": null,
  "appData": null,
  "appMetadata": {
    "version": 0,
    "data": []
  },
  "appRoles": [],
  "availableToOtherTenants": false,
  "displayName": "nativeClient",
  "encryptedMsiApplicationSecret": null,
  "errorUrl": null,
  "groupMembershipClaims": null,
  "homepage": null,
  "identifierUris": [],
  "keyCredentials": [],
  "knownClientApplications": [],
  "logoUrl": null,
  "logoutUrl": null,
  "oauth2AllowImplicitFlow": false,
  "oauth2AllowUrlPathMatching": false,
  "oauth2Permissions": [],
  "oauth2RequirePostResponse": false,
  "passwordCredentials": [],
  "publicClient": true,
  "recordConsentConditions": null,
  "replyUrls": [
    "http://www.microsoft.com"
  ],
  "requiredResourceAccess": [
    {
      "resourceAppId": "00000002-0000-0000-c000-000000000000",
      "resourceAccess": [
        {
          "id": "311a71cc-e848-46a1-bdf8-97ff7156d8e6",
          "type": "Scope"
        }
      ]
    }
  ],
  "samlMetadataUrl": null,
  "supportsConvergence": false
}

"@
        Invoke-GraphMethod -Method 'Post' -query 'applications' -Scope 'Directory.AccessAsUser.All' -body $AppJSON -ContentType 'application/json' -Version 'beta'
<#
@'
{
  "appId": "a260df9b-7adb-4160-b178-3cf636a272a1",
  "appRoles": [],
  "availableToOtherTenants": true,
  "displayName": "MSGraph",
  "errorUrl": null,
  "groupMembershipClaims": null,
  "homepage": "https://github.com/Ryan2065/MSGraphCmdlets",
  "identifierUris": [],
  "keyCredentials": [],
  "knownClientApplications": [],
  "logoutUrl": null,
  "oauth2AllowImplicitFlow": false,
  "oauth2AllowUrlPathMatching": false,
  "oauth2Permissions": [],
  "oauth2RequiredPostResponse": false,
  "objectId": "5c5eaa2b-0d96-48cf-98b3-0ca4f71e2def",
  "passwordCredentials": [],
  "publicClient": true,
  "supportsConvergence": false,
  "replyUrls": [
    "https://github.com/Ryan2065/MSGraphCmdlets"
  ],
  "requiredResourceAccess": [
    {
      "resourceAppId": "00000002-0000-0000-c000-000000000000",
      "resourceAccess": [
        {
          "id": "311a71cc-e848-46a1-bdf8-97ff7156d8e6",
          "type": "Scope"
        }
      ]
    }
  ],
  "samlMetadataUrl": null,
  "defaultIdentifierUri": null,
  "appCategory": null,
  "appMetadata": null
}
'@
#>

    }
}
