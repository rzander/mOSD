Dism /Split-Image /ImageFile:%~dp0..\sources\install.wim /SWMFile:%~dp0..\sources\install.swm /FileSize:2000
del %~dp0\..\sources\install.wim
pause