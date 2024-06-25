@echo off

:: Prompt the user for the host address
set /p host=host Address: 

:: Set the name of the log file
set logfile=Log_%host%.log

:: Log the target host information
echo Target Host = %host% >%logfile%

:: Perform an initial ping to get header information and log it
for /f "tokens=*" %%A in ('ping %host% -n 1 ') do (
    echo %%A>>%logfile% 
    GOTO Ping
)

:Ping
:: Loop to continuously ping the host and log the results with a timestamp
for /f "tokens=* skip=2" %%A in ('ping %host% -n 1 ') do (
    echo %date% %time:~0,2%:%time:~3,2%:%time:~6,2% %%A>>%logfile%
    echo %date% %time:~0,2%:%time:~3,2%:%time:~6,2% %%A
    timeout 1 >NUL 
    GOTO Ping
)
