# Requires -Modules 'MSOnline'

# If installing the module for the first time, you will be asked to allow the install. Select the option 'Yes to All'

# Once installed sign into your O365 Tenant

# Be sure to run PowerShell or PowerShell ISE as Admin before running this script

Install-Module MSOnline
Connect-MsolService
Get-MsolUser -All | Select-Object @{N='UserPrincipalName';E={$_.UserPrincipalName}},@{N='MFA Status';E={if ($_.StrongAuthenticationRequirements.State){$_.StrongAuthenticationRequirements.State} else {"Disabled"}}},@{N='MFA Methods';E={$_.StrongAuthenticationMethods.methodtype}} | Export-Csv -Path c:\MFA_Report.csv -NoTypeInformation
