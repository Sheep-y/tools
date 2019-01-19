@echo off
:loop
ffmpeg -y -hide_banner -i %1 -vf minterpolate=fps=60:mi_mode=mci:mc_mode=aobmc:me_mode=bidir:vsbmc=1 -c copy -c:v libx264 -preset veryfast -crf 2 "%~n1.inter60fps%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop