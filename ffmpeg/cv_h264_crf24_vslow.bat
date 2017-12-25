@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:v libx264 -preset veryslow -crf 24 "%~n1.crf24%~x1"
shift
if "%~1" neq "" goto loop