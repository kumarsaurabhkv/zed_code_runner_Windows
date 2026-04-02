@echo off
setlocal enabledelayedexpansion 

:: Check if Zed provided the file path 
if "%ZED_FILE%"=="" (
    echo Error: ZED_FILE not set. Open a file and run again. 
    exit /b 1 
)

:: Extract path, name, and extension
for %%F in ("%ZED_FILE%") do (
    set "BASENAME=%%~nF" 
    set "EXT=%%~xF" 
    set "WORKDIR=%%~dpF" 
)

set "BUILDDIR=%WORKDIR%build_out" 

:: Ensure build directory exists 
if not exist "%BUILDDIR%" mkdir "%BUILDDIR%" 

echo [RUNNING %ZED_FILE%]
echo --------------------------

:: Logical fix: We use the %EXT% directly to avoid delayed expansion issues in the IF chain
if /I "%EXT%"==".c" (
    gcc "%ZED_FILE%" -o "%BUILDDIR%\%BASENAME%.exe" && "%BUILDDIR%\%BASENAME%.exe" [cite: 1, 2]
) else if /I "%EXT%"==".cpp" (
    g++ "%ZED_FILE%" -o "%BUILDDIR%\%BASENAME%.exe" && "%BUILDDIR%\%BASENAME%.exe" [cite: 2]
) else if /I "%EXT%"==".py" (
    python "%ZED_FILE%" [cite: 2]
) else if /I "%EXT%"==".js" (
    node "%ZED_FILE%"
) else if /I "%EXT%"==".ts" (
    deno run "%ZED_FILE%"
) else if /I "%EXT%"==".java" (
    javac "%ZED_FILE%" -d "%BUILDDIR%"
    java -cp "%BUILDDIR%" "%BASENAME%"
) else if /I "%EXT%"==".go" (
    go run "%ZED_FILE%"
) else if /I "%EXT%"==".rs" (
    rustc "%ZED_FILE%" -o "%BUILDDIR%\%BASENAME%.exe" && "%BUILDDIR%\%BASENAME%.exe" 
) else (
    echo Unsupported file type: %EXT%
    exit /b 1
)

endlocal
