@echo off

:: Set libtorch path
set LIBTORCH_DIR="E:\Projects\libtorch\libtorch-win-shared-with-deps-2.1.0+cpu\libtorch"

:: Check if the script is being run from the correct directory
if "%~dp0" neq "%cd%\" (
    echo Please run this script from the directory where it is located.
    pause
    exit /b 1
)

:: Set the build directory
set BUILD_DIR=build

:: Check if the build directory already exists
if exist "%BUILD_DIR%" (
    echo The build directory already exists. Please delete or rename it before running this script.
    pause
    exit /b 1
)

:: Create the build directory
mkdir %BUILD_DIR%
cd %BUILD_DIR%

cmake -DCMAKE_PREFIX_PATH=%LIBTORCH_DIR% ..
cmake --build . --config Release

:: Back to root
cd "%~dp0"

pause