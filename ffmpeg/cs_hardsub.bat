@echo off
:loop
if exist %~n1.ass goto ass
if exist %~n1.srt goto srt
ffmpeg -y -hide_banner -i %1 -vf "subtitles=%~n1%~x1" -c:v libx264 -preset veryfast -crf 2 -c:a copy -sn "%~n1.hardsub%~x1"
goto next

:ass
ffmpeg -y -hide_banner -i %1 -vf "subtitles=%~n1.ass" -c:v libx264 -preset veryfast -crf 2 -c:a copy -sn "%~n1.hardsub%~x1"
goto next

:srt
ffmpeg -y -hide_banner -i %1 -vf "subtitles=%~n1.srt" -c:v libx264 -preset veryfast -crf 2 -c:a copy -sn "%~n1.hardsub%~x1"
goto next

:next
shift
if "%~1" neq "" goto loop