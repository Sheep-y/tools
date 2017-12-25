@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -vn "%~n1.audio%~x1"
shift
if "%~1" neq "" goto loop