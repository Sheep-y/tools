@echo off
:loop
ffmpeg -y -hide_banner -i %1 -filter_complex "[0:v]setpts=2*PTS[v];[0:a]atempo=0.5[a]" -map "[v]" -map "[a]" -c copy -c:v libx264 -preset veryfast -crf 2 -c:a libvorbis -q:a 10 "%~n1.speed_half%~x1"
if %ERRORLEVEL% GEQ 1 pause
shift
if "%~1" neq "" goto loop