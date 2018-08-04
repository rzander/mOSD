Set-Location $PSScriptRoot

#Install Office
get-volume | Where-Object { $_.DriveType -ne 'Fixed' } | ForEach-Object { if (test-path ($_.DriveLetter + ':\Office\setup.exe')) {
    Set-Location ($_.DriveLetter + ':\Office')
    $proc = (Start-Process "setup.exe" -ArgumentList "/configure .\configuration.xml" -Wait -PassThru)
    $proc.WaitForExit()
    }
}

Import-StartLayout -LayoutPath .\startlayout.xml -MountPath C:\

exit(0)