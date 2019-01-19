@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:s ass "%~n1.mkv"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop