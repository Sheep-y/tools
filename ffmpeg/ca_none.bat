@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -an "%~n1.silent%~x1"
shift
if "%~1" neq "" goto loop