@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:v libvpx-vp9 -crf 24 -b:v 0 -threads 4 "%~n1.vp9-q24%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop