@echo off
setlocal
cd /d "%~dp0"

call npm install
if errorlevel 1 exit /b 1

call npm run build
if errorlevel 1 exit /b 1

call npm run test
if errorlevel 1 exit /b 1

exit /b 0
