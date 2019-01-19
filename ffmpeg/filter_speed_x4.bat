@echo off
:loop
ffmpeg -y -hide_banner -i %1 -filter_complex "[0:v]setpts=0.25*PTS[v];[0:a]atempo=2.0,atempo=2.0[a]" -map "[v]" -map "[a]" -c copy -c:v libx264 -preset veryfast -crf 2 -c:a libvorbis -q:a 10 "%~n1.speed_x4%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop