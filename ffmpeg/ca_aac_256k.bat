@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:a aac -b:a 256k "%~n1.aac256%~x1"
shift
if "%~1" neq "" goto loop