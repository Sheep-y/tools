@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:v libx264 -preset veryslow -crf 16 "%~n1.crf16%~x1"
shift
if "%~1" neq "" goto loop