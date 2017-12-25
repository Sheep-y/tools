@echo off
:loop
ffmpeg -y -hide_banner -i %1 -map_metadata -1 -c:v copy -c:a copy -c:s copy "%~n1.nometa%~x1"
shift
if "%~1" neq "" goto loop