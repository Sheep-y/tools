@echo off
:loop
if exist "%~n1.ass" goto ass
if exist "%~n1.srt" goto srt
echo %~n1.aas^|srt not found.
goto next

:ass
ffmpeg -y -hide_banner -i %1 -i "%~n1.ass" -map 0:v -map 0:a -map 1:s -c copy "%~n1.sub.mkv"
goto next

:srt
ffmpeg -y -hide_banner -i %1 -i "%~n1.srt" -map 0:v -map 0:a -map 1:s -c copy "%~n1.sub.mkv"
goto next

:next
shift
if "%~1" neq "" goto loop
pause