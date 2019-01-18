@echo off
:loop
ffmpeg -y -hide_banner -i %1 -vf vidstabdetect=shakiness=10:accuracy=15:result="%~n1.trf" -an -f null NUL
ffmpeg -y -hide_banner -i %1 -vf vidstabtransform=smoothing=30:interpol=bicubic:input="%~n1.trf",unsharp=5:5:1:5:5:0.5 -c copy -c:v libx264 -preset veryfast -crf 2 "%~n1.vidstab%~x1"
shift
if "%~1" neq "" goto loop