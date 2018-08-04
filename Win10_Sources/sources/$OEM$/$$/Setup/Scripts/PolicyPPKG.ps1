#Install ProvisioningPackage from USB/DVD
Get-PSDrive | Where-Object { ($_.used -eq 0) -and -not ($_.CurrentLocation) } | ForEach-Object { if (test-path ($_.Root + 'mOSD.ppkg')) { Install-ProvisioningPackage ($_.Root + 'mOSD.ppkg') -ForceInstall -QuietInstall } }
Start-Sleep 3