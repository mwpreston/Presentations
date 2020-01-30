Currently the Rubrik As Built Report Module is under development and not yet available on the PowerShell Gallery.  The module is also currently dependent on the ```devel``` branch of the Rubrik PowerShell SDK.

The steps below provide a high-level overview of how to get the beta/devel versions of everything up and running

1. Install Devel branch of Rubrik PowerShell SDK

```git clone https://github.com/rubrikinc/rubrik-sdk-for-powershell.git```

Run Install-Rubrik.ps1

2. Install AsBuiltReport

```Install-Module AsBuiltReport```

3. Clone devel branch of Rubrik AsBuiltReport

```git clone https://github.com/mwpreston/AsBuiltReport.Rubrik.CDM.git```

4. Copy AsBuiltReport.Rubrik.CDM to a supported modules directory

```cp C:\ABR\ C:\Users\mike.preston.RUBRIK\Documents\WindowsPowerShell\Modules\```

5. Generate a new default config for the report

```New-AsBuiltReportConfig -Report Rubrik.CDM -path c:\abr\ -name 'abr'```

6. Generate AsBuiltReport default config file

```New-AsBuiltConfig```

7. Generate Credentials for your Rubrik Cluster you want to run the report against

```
$credential = Get-credential
$credential | Export-CLIXML -Path c:\abr\clustercreds.xml
```

8. Generate the report :)

```
New-AsBuiltReport -Report Rubrik.CDM -Target 192.168.150.121 -Credential (Import-CliXML -Path C:\abr\clustercreds.xml) -Format HTML -Orientation Portrait -OutputPath C:\abr -ReportConfigPath C:\abr\abr.json -AsBuiltConfigPath C:\abr\config.json
```
Any feedback, issues, pull requests are gladly accepted on the projects current development repository [https://github.com/mwpreston/AsBuiltReport.Rubrik.CDMhttps://github.com/mwpreston/AsBuiltReport.Rubrik.CDM](https://github.com/mwpreston/AsBuiltReport.Rubrik.CDM)