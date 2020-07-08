@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

:: Cancella i file temporanei
echo Controllo la cartella dei file temporanei...
cd C:\Users\%USERNAME%\AppData\Local\Temp
if exist *.* (
  del /Q /S *.*
  echo File temporanei cancellati
) else (echo File non trovati)
echo Cancello le cartelle vuote...
for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
echo Controllo la cartella dei file temporanei di Windows...
cd C:\Windows\Temp
if exist *.* (
    del /Q /S *.*
    echo File temporanei cancellati
) else (echo File non trovati)
echo Cancello le cartelle vuote...
for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
echo Controllo la cartella Prefetch...
cd C:\Windows\Prefetch
if exist *.* (
    del /Q /S *.*
    echo File prefetch cancellati
) else (echo File non trovati)
echo Cancello le cartelle vuote...
for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"