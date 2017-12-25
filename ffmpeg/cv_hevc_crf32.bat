@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:v libx265 -crf 32 "%~n1.hevc32%~x1"
shift
if "%~1" neq "" goto loop