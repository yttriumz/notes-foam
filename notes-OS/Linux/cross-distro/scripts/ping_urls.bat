@echo off

setlocal

set url_list=urls.txt
set can_ping=false

for /f "tokens=*" %%a in (%url_list%) do (
    ping -n 1 %%a >nul
    if errorlevel 1 (
        echo %%a cannot be pinged.
    ) else (
        echo %%a can be pinged.
        echo %%a>>urls_can_ping.txt
        set can_ping=true
    )
)

if %can_ping%==false (
    echo None of the URLs can be pinged.
)

endlocal
