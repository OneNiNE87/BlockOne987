@echo off
set VENV_DIR=venv

if not exist %VENV_DIR% (
    echo Virtual environment not found. Creating one...
    python -m venv %VENV_DIR%
    if errorlevel 1 (
        echo Failed to create virtual environment. Exiting...
        exit /b 1
    )
    echo Virtual environment created.
)

call %VENV_DIR%\\Scripts\\activate
echo Installing dependencies...
pip install safetensors numpy
if errorlevel 1 (
    echo Failed to install dependencies. Exiting...
    exit /b 1
)

echo Running the Safe Tensor Inspector...
python inspect_safe_tensor.py
if errorlevel 1 (
    echo Script execution failed. Exiting...
    exit /b 1
)

deactivate
echo Done.
pause
