@echo off
:loop
ffprobe -hide_banner %1
echo.
echo.
shift
if "%~1" neq "" goto loop
pause