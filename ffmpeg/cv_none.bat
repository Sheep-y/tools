@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -vn "%~n1.audio%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop