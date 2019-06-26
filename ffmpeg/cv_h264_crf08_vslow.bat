@echo off
:loop
ffmpeg -y -hide_banner -i %1 -movflags +faststart -c copy -c:v libx264 -preset veryslow -crf 8 "%~n1.crf08%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop