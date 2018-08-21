@echo off

::setting variables
::Size: 48, 100
set ip1=google.com
set ip2=reddit.com
set ip3=127.0.0.1
set c=0

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:first
echo       Pinging Google...
(ping -n 1 %ip1% | find "(0%" > NUL)
::ping first server and look for "(0%" indicating no loss of conection -> (0% Lost)

if  %errorlevel% == 0 goto output
if %errorlevel% == 1  goto second

:second
echo       Pinging Reddit...
ping -n 1 %ip2% | find "TTL" > NUL
::ping second server for authentication of non-connection (If first server is offline)

if  %errorlevel% == 0 echo. && echo Failed to connect to Google && goto output
if %errorlevel% == 1  set c=1 && goto third

:third

ping -n 1 %ip3% | find "TTL" > NUL
if %errorlevel% == 1 echo Network card improperly installed. && goto Output

:Output
echo.
echo Primitive networkcheck completed:
echo.

if %c% == 0 (
	call :color 0A "      You are Online"
)
if %c%==1 (
	call :color 0C "      You are Offline"
)

echo.
echo.
echo Press any key to continue.

pause>NUL
exit /b

:color
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
exit /b