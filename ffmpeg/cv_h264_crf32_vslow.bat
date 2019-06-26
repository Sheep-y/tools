@echo off
:loop
ffmpeg -y -hide_banner -i %1 -movflags +faststart -c copy -c:v libx264 -preset veryslow -crf 32 "%~n1.crf32%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop