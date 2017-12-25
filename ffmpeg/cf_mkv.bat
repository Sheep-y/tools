@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:s ass "%~n1.mkv"
shift
if "%~1" neq "" goto loop