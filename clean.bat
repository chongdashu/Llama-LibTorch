@echo off

:: Check if the script is being run from the correct directory
if "%~dp0" neq "%cd%\" (
    echo Please run this script from the directory where it is located.
    pause
    exit /b 1
)

:: Set the build directory
set BUILD_DIR=build

echo Cleaning up the build directory...
rmdir /s /q %BUILD_DIR%

echo Clean-up completed successfully.
pause