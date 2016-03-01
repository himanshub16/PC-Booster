rem creating log file
copy nul log.dat > nul

REM --> Check for Admin permissions
echo "Check for Admin permissions" >> log.dat

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo "Requesting admin privilege" >> log.dat
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"

exit /B
:gotAdmin
echo "Admin permission granted" >> log.dat
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

echo "Clearing Windows temporary files"
echo "Clearing Windows temporary files " >> log.dat
echo . >> log.dat
del /s /f /q c:\windows\temp\*.* >> log.dat 2>&1 
del /s /f /q C:\WINDOWS\Prefetch >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\temp >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\tempor~1 >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\ff*.tmp >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\tmp >> log.dat 2>&1

echo "Deleting User Temporary Files" 
echo "Deleting User Temporary Files" >> log.dat 2>&1
del /s /f /q %temp%\*.*

deltree.bat /s /q /f c:\windows\cookies >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\history >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\spool\printers >> log.dat 2>&1
deltree.bat /s /q /f c:\windows\recent >> log.dat 2>&1
del c:\WIN386.SWP >> log.dat 2>&1
pause
cls
