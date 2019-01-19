@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:a aac -b:a 64k "%~n1.aac64%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop