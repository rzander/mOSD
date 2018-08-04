Set-Location $PSScriptRoot
get-process sysprep -ea SilentlyContinue | stop-process -Force -ErrorAction SilentlyContinue

#Cleanup
Remove-Item C:\Windows\Panther\unattend.xml -Force -ea SilentlyContinue
Remove-Item C:\Windows\Setup\Scripts\init.ps1 -Recurse -Force -ea SilentlyContinue #Prevent loop after OOBE
Rename-Item C:\Windows\Setup\Scripts\init2.ps1 init.ps1 -ea SilentlyContinue #Run Cleanup after OOBE

get-process sysprep -ea SilentlyContinue | stop-process -Force -ErrorAction SilentlyContinue
Start-Sleep 2
&C:\Windows\System32\Sysprep\sysprep.exe /oobe /shutdown /unattend:c:\windows\system32\sysprep\unattend.xml
exit(0)