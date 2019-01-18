@echo off
:loop
ffmpeg -y -hide_banner -i %1 -c copy -c:a libopus -b:a 128k -vbr on -compression_level 10 "%~n1.opus128%~x1"
shift
if "%~1" neq "" goto loop