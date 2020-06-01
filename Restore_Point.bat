@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%DATE%", 100, 1

pause