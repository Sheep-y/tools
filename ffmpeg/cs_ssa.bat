@echo off
:loop
ffmpeg -y -hide_banner -i %1 "%~n1.ssa"
shift
if "%~1" neq "" goto loop