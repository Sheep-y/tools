@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy "%~n1.webm"
shift
if "%~1" neq "" goto loop