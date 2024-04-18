@echo off
echo Checking if Node.js is installed...
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js is not installed. Installing...
    powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v16.14.0/node-v16.14.0-x64.msi' -OutFile 'node-installer.msi'"
    msiexec /i node-installer.msi /qn
    del node-installer.msi
    echo Node.js has been installed.
) else (
    echo Node.js is already installed.
)
@echo on
npm install
cd kms_win
node ../main.js