@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:a libvorbis -q:a 7 "%~n1.ogg-q7.mkv"
shift
if "%~1" neq "" goto loop