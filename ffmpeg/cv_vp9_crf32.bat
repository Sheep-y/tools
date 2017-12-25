@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:v libvpx-vp9 -crf 32 -b:v 0 -threads 4 "%~n1.vp9-q32%~x1"
shift
if "%~1" neq "" goto loop