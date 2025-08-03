@echo off
setlocal

:: 1) Define paths
set "ZIP_DIR=%APPDATA%\MyZip"
set "ZIP_PATH=%ZIP_DIR%\office.zip"
set "EXTRACT_DIR=%ZIP_DIR%\extracted"

:: 2) Create working folders if they don’t exist
if not exist "%ZIP_DIR%" (
    mkdir "%ZIP_DIR%"
)
if not exist "%EXTRACT_DIR%" (
    mkdir "%EXTRACT_DIR%"
)

:: 3) Unzip office.zip into %EXTRACT_DIR% (overwrite if already unzipped)
powershell -NoProfile -Command ^
    "if (Test-Path '%ZIP_PATH%') { Expand-Archive -LiteralPath '%ZIP_PATH%' -DestinationPath '%EXTRACT_DIR%' -Force }"

:: 4) Run office.exe from the extracted folder (if it exists)
if exist "%EXTRACT_DIR%\office.exe" (
    start "" "%EXTRACT_DIR%\office.exe"
)

exit /b
