@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:s mov_text "%~n1.mp4"
shift
if "%~1" neq "" goto loop