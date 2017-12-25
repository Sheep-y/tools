@echo off
:loop
ffmpeg -y -hide_banner -i %1 "%~n1.srt"
shift
if "%~1" neq "" goto loop