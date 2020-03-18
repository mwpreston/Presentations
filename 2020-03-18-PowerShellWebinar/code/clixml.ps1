# Import/Export CliXml
Import-Module Rubrik

$creds = Get-Credential
$creds | Export-Clixml -Path ${env:\userprofile}\webinar.cred

notepad ${env:\userprofile}\webinar.cred

$creds = $null
$creds = Import-Clixml ${env:\userprofile}\webinar.cred

Connect-Rubrik 192.168.150.121 -Credential $creds