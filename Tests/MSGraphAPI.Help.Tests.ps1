<#
    Test help code mostly from Francois-Xavier Cat (Lazy WinAdmin)
    http://www.lazywinadmin.com/2016/05/using-pester-to-test-your-comment-based.html
#>

Import-Module "$((Get-Item $PSScriptRoot).Parent.FullName)\MSGraphAPI"

Describe 'MSGraphAPI Help' {
    $FunctionList = Get-Command -Module MSGraphAPI -CommandType Function
    Foreach($FunctionName in $FunctionList.Name) {
        $Help = Get-Help -Name $FunctionName -Full
        $Notes = $Help.AlertSet.Alert.Text -split '\n'
        $AST = [System.Management.Automation.Language.Parser]::ParseInput((Get-Content function:$FunctionName), [ref]$null, [ref]$null)
        Context "$FunctionName - Help" {
            It "Synopsis" { $help.Synopsis | Should not BeNullOrEmpty }
            It "Description"{ $help.Description | Should not BeNullOrEmpty }
            It "Notes - Author" { $Notes[0].trim() | Should Be "Author: Ryan Ephgrave" }

            $RiskMitigationParameters = 'Whatif', 'Confirm'
            $HelpParameters = $help.parameters.parameter | Where-Object name -NotIn $RiskMitigationParameters
            $ASTParameters = $AST.ParamBlock.Parameters.Name.variablepath.userpath
            It "Parameter - Compare Count Help/AST" {
                $HelpParameters.Name.Count -eq $ASTParameters.count | Should Be $true
            }
            
            # Parameter Description
            If (-not [String]::IsNullOrEmpty($ASTParameters)) # IF ASTParameters are found
            {
                $HelpParameters | ForEach-Object {
                    It "Parameter $($_.Name) - Should contains description"{
                        $_.description | Should not BeNullOrEmpty
                    }
                }
                
            }
            
            # Examples
            it "Example - Count should be greater than 0"{
                $Help.examples.example.code.count | Should BeGreaterthan 0
            }
            
            # Examples - Remarks (small description that comes with the example)
            foreach ($Example in $Help.examples.example)
            {
                it "Example - Remarks on $($Example.Title)"{
                    $Example.remarks | Should not BeNullOrEmpty
                }
            }
        }
    }
}