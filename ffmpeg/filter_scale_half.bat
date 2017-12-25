@echo off
:loop
ffmpeg -y -hide_banner -i %1 -vf scale=iw/2:ih/2 -c copy -c:v libx264 -preset veryfast -crf 2 "%~n1.scale_half%~x1"
shift
if "%~1" neq "" goto loop