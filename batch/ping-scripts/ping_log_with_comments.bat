@echo off

:input
:: Prompt the user to enter the host address and store it in the 'host' variable
set /p host=Host Address: 

:: Check if the input is empty
if "%host%"=="" (
    :: Print an error message if the input is empty
    echo Invalid input. Please enter a valid IP address or domain name.
    :: Return to the input section to prompt the user again
    goto input
)

:: Create a log file name using the host address
set logfile=Log_%host%.log

:: Write the target host information to the log file
echo Target Host = %host% >%logfile%

:: Ping the host once to initialize the log and jump to the 'Ping' label
for /f "tokens=*" %%A in ('ping %host% -n 1 ') do (echo %%A>>%logfile% && GOTO Ping)

:Ping
:: Ping the host in a loop, writing the date, time, and ping result to the log file
for /f "tokens=* skip=2" %%A in ('ping %host% -n 1 ') do (
    :: Log the current date and time along with the ping result
    echo %date% %time:~0,2%:%time:~3,2%:%time:~6,2% %%A>>%logfile%
    :: Print the current date and time along with the ping result to the console
    echo %date% %time:~0,2%:%time:~3,2%:%time:~6,2% %%A
    :: Wait for 1 second before the next ping
    timeout 1 >NUL 
    :: Repeat the loop
    GOTO Ping
)
