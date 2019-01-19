@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -sn "%~n1.nosub%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop