#SecretsManagement

Import-Module Microsoft.PowerShell.SecretsManagement
Import-Module Rubrik

Get-SecretsVault

Get-SecretInfo

Get-Secret

Get-Secret -AsPlainText

$creds = Get-Credential
Add-Secret -Name "secretlaunchcreds" -Secret $creds

Get-SecretInfo

Remove-Secret -Name "secretlaunchcreds" -Vault "BuiltInLocalVault"


Connect-Rubrik 192.168.150.121 -Token (Get-Secret -Name "rubriktoken" -AsPlainText)
Get-RubrikVM -PrimaryClusterID local