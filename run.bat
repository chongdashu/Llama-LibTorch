@echo off

:: Check if the script is being run from the correct directory
if "%~dp0" neq "%cd%\" (
    echo Please run this script from the directory where it is located.
    pause
    exit /b 1
)

:: Set the input pytorch model path
set INPUT_PATH="C:\Users\chong-u\Downloads\TinyStories\pytorch_model.bin"

:: Set the output libtorch model path 
set OUTPUT_PATH="E:\Projects\UE5\LLMTestProj\Plugins\Libtorch-UE5\Content\tiny_stories.pt"

:: Set the executable directory
set EXECUTABLE_DIR=build/Release
cd %EXECUTABLE_DIR%

echo Running cppTorch.exe with the following parameters:
echo Input path: %INPUT_PATH%
echo Output path: %OUTPUT_PATH%
cppTorch.exe %INPUT_PATH% %OUTPUT_PATH%

if %errorlevel% equ 0 (
    echo cppTorch.exe executed successfully.
) else (
    echo cppTorch.exe encountered an error.
    pause
    exit /b 1
)

:: Back to root
cd "%~dp0"

pause