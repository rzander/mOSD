RD "%~dp0\Office" /S /Q
PUSHD "%~dp0"
"%~dp0setup.exe" /download "%~dp0download.xml"
pause