@echo off
setlocal EnableDelayedExpansion

rem Function to format bytes to human-readable format
:formatSize
set size=%1
set suffix=B
if %size% GEQ 1024 set size=!size:~0,-3!.K& set suffix=KB
if %size% GEQ 1024 set size=!size:~0,-3!.M& set suffix=MB
if %size% GEQ 1024 set size=!size:~0,-3!.G& set suffix=GB
echo %size% %suffix%
exit /b

rem Loop through each directory in the current folder
for /d %%i in (*) do (
    set size=0
    for /f "tokens=3" %%j in ('dir /s /a /-c "%%i" ^| find "File(s)"') do (
        set /a size+=%%j
    )
    echo %%i
    call :formatSize !size!
)

pause
