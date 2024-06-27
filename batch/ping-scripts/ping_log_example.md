# Examples for Ping Log Script

## [ping_log_without_comments.bat](batch/ping-scripts/ping_log_without_comments.bat)

### Description
This script pings a specified host continuously and logs the results without any comments in the script for simplicity.

### Full Code

@echo off

:input

set /p host=Host Address: 

if "%host%"=="" (
    echo Invalid input. Please enter a valid IP address or domain name.
    goto input
)

set logfile=Log_%host%.log

echo Target Host = %host% >%logfile%

for /f "tokens=*" %%A in ('ping %host% -n 1 ') do (echo %%A>>%logfile% && GOTO Ping)

:Ping

for /f "tokens=* skip=2" %%A in ('ping %host% -n 1 ') do (
    echo %date% %time:~0,2%:%time:~3,2%:%time:~6,2% %%A>>%logfile%
    echo %date% %time:~0,2%:%time:~3,2%:%time:~6,2% %%A
    timeout 1 >NUL 
    GOTO Ping
)


Example Output

When you run the ping_log_without_comments.bat script and enter google.com as the host address, it will create a log file named Log_google.com.log and continuously log the ping results.

The log file will look something like this:

Target Host = google.com

25-Jun-2024 10:15:30 Reply from 142.250.64.78: bytes=32 time=14ms TTL=117

25-Jun-2024 10:15:31 Reply from 142.250.64.78: bytes=32 time=14ms TTL=117

25-Jun-2024 10:15:32 Reply from 142.250.64.78: bytes=32 time=14ms TTL=117

...
