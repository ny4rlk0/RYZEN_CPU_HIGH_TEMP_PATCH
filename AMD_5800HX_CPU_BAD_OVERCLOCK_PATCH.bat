echo "Run this as admin!"
pause
regedit /s C:\power_unlock.reg
powercfg /import C:\NYARLKO.POW
for /f "tokens=4" %%f in ('powercfg -list ^| findstr /C:"NO_OVERCLOCK"') do set GUID=%%f 
powercfg /S %GUID%
pause
