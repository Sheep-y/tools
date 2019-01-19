@echo off
:loop
ffmpeg -y -hide_banner -i %1 "%~n1.ass"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop