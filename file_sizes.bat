@echo off
for /d %%i in (*) do (
    echo %%i
    for /f "usebackq tokens=3" %%j in (`dir /s /-c "%%i" ^| find "File(s)"`) do echo %%j
)
for %%i in (*) do (
    if not "%%~xi"=="" (
        echo %%i
        for /f "usebackq tokens=3" %%j in (`dir /s /-c "%%i" ^| find "File(s)"`) do echo %%j
    )
)
