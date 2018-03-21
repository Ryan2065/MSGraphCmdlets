# Microsoft Graph API Cmdlets
## Features
These cmdlets are meant to give administrators an easy way to interact with
 the Microsoft Graph API. The hope is to have the most popular features of
  MS Graph here as cmdlets.

Install the module from the PowerShell gallery with the command:
`Install-Module MSGraphAPI`

### Current Functions
1. Authenticate to Microsot Graph with Connect-MSGraphAPI
2. Use Invoke-MSGraphAPIMethod to call Graph
3. Returns custom classes that are based on the Graph metadata

## To Do
Just switched this project over to using the [MSGraph SDK](https://github.com/microsoftgraph/msgraph-sdk-dotnet) made by Microsoft. Because of this, there 
will be a new way to authenticate and the functions will need to be re-created. Will publish to 
the PowerShell Gallery once we can reliably authenticate and browse Graph