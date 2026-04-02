@echo off
setlocal enabledelayedexpansion

:: Map arguments from tasks.json 
:: %1 = $ZED_FILE (Full path)
:: %2 = $ZED_DIRNAME (Directory)
:: %3 = $ZED_FILENAME (Name + Ext)
:: %4 = $ZED_STEM (Name only)
set "ZED_FILE=%~1"
set "WORKDIR=%~2"
set "BASENAME=%~4"

:: Get Extension directly from the filename 
for %%F in ("%ZED_FILE%") do set "EXT=%%~xF"

if "%ZED_FILE%"=="" (
    echo Error: No file provided. 
    exit /b 1
)

set "BUILDDIR=%WORKDIR%\build_out"
if not exist "%BUILDDIR%" mkdir "%BUILDDIR%" 

echo [RUNNING %ZED_FILE%]
echo --------------------------

:: Execution Logic 
if /I "%EXT%"==".c" (
    gcc "%ZED_FILE%" -o "%BUILDDIR%\%BASENAME%.exe" && "%BUILDDIR%\%BASENAME%.exe"
) else if /I "%EXT%"==".cpp" (
    g++ "%ZED_FILE%" -o "%BUILDDIR%\%BASENAME%.exe" && "%BUILDDIR%\%BASENAME%.exe"
) else if /I "%EXT%"==".py" (
    python "%ZED_FILE%"
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
