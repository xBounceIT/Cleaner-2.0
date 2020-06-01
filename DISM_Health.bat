@echo off
echo Avvio la utility di riparazione...
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

DISM /Online /Cleanup-Image /RestoreHealth

pause