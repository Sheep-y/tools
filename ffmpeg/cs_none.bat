@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -sn "%~n1.nosub%~x1"
shift
if "%~1" neq "" goto loop