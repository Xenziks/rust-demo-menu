@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo =================================
echo       RUST EXE BUILDER
echo =================================

where node >nul 2>nul
if errorlevel 1 (
 echo Node.js is not installed!
 echo Download it from https://nodejs.org/
 pause
 exit /b 1
)

echo Installing dependencies...
call npm.cmd install

if errorlevel 1 (
 echo INSTALL ERROR!
 pause
 exit /b 1
)

echo Building EXE...
call npm.cmd run build

if errorlevel 1 (
 echo BUILD ERROR!
 pause
 exit /b 1
)

echo SUCCESS!
echo Open the dist folder.
pause