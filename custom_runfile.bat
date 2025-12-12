@echo off
setlocal enabledelayedexpansion

:: Get the file from Zed
if "%ZED_FILE%"=="" (
    echo Error: ZED_FILE not set. Open a file and run again.
    exit /b 1
)

set FILE=%ZED_FILE%
set "BASENAME=%~nF"
set "EXT=%~xF"
set "WORKDIR=%~dpF"
set "BUILDDIR=%WORKDIR%build_out"

:: Create build output directory if it doesn't exist
if not exist "%BUILDDIR%" mkdir "%BUILDDIR%"

echo Running %FILE% ...
echo --------------------------

:: Remove leading dot from extension
set EXT=%EXT:~1%

if /I "%EXT%"=="c" (
    gcc "%FILE%" -o "%BUILDDIR%\%BASENAME%" && "%BUILDDIR%\%BASENAME%"
) else if /I "%EXT%"=="cpp" (
    g++ "%FILE%" -o "%BUILDDIR%\%BASENAME%" && "%BUILDDIR%\%BASENAME%"
) else if /I "%EXT%"=="py" (
    python "%FILE%"
) else if /I "%EXT%"=="js" (
    node "%FILE%"
) else if /I "%EXT%"=="ts" (
    deno run "%FILE%"
) else if /I "%EXT%"=="java" (
    javac "%FILE%" -d "%BUILDDIR%"
    java -cp "%BUILDDIR%" "%BASENAME%"
) else if /I "%EXT%"=="go" (
    go run "%FILE%"
) else if /I "%EXT%"=="rs" (
    rustc "%FILE%" -o "%BUILDDIR%\%BASENAME%" && "%BUILDDIR%\%BASENAME%"
) else if /I "%EXT%"=="sh" (
    echo Shell scripts are not supported on Windows
) else if /I "%EXT%"=="php" (
    php "%FILE%"
) else (
    echo Unsupported file type: .%EXT%
    exit /b 1
)
