REM --> Check for permissions

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"

exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

@echo off
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree.bat /s /q /f c:\windows\temp
deltree.bat /s /q /f c:\windows\tempor~1
deltree.bat /s /q /f c:\windows\ff*.tmp
deltree.bat /s /q /f c:\windows\tmp
deltree.bat /s /q /f c:\windows\cookies
deltree.bat /s /q /f c:\windows\history
deltree.bat /s /q /f c:\windows\spool\printers
deltree.bat /s /q /f c:\windows\recent
del c:\WIN386.SWP
pause
cls