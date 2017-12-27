@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:v h264_nvenc -preset fast "%~n1.n264%~x1"
shift
if "%~1" neq "" goto loop