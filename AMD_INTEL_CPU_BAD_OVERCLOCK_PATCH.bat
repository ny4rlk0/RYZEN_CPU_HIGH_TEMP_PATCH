echo "Run this as admin!"
pause
regedit /s C:\power_unlock.reg
powercfg /import C:\NYARLKO.POW
for /f "tokens=4" %%f in ('powercfg -list ^| findstr /C:"NO_OVERCLOCK"') do set GUID=%%f 
powercfg /S %GUID%
sc stop “SysMain”
sc config “SysMain” start=disabled
netsh interface tcp set global autotuninglevel=highlyrestricted
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "AssumeUDPEncapsulationContextOnSendRule" REG_DWORD /d 2 /f
ipconfig /flushdns
pause
