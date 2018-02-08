@echo off
set exe="%~dp0cjpeg.exe"
if not "%~1"=="" goto loop

cjpeg -version
echo High efficient JPEG compression - smaller and/or better quality than photoshop export.
echo Usage: In File explorer, drag and drop images onto this file.
echo (Non-jpeg files will be converted by ffmpeg, if ffmpeg is on Windows PATH.)
echo.
pause
goto end

:loop
set input=%~nx1
if /i "%~x1"==".jpg" goto comp
if /i "%~x1"==".jpeg" goto comp
echo Converting %~nx1 to jpeg.
set output=%~n1.jpg
ffmpeg -y -loglevel error -i "%input%" -c:v mjpeg -frames:v 1 -q:v 2 -b:v 999999999k -an "%output%"
if ERRORLEVEL 1 echo ERROR - Cannot convert %~nx1 to jpeg.
if ERRORLEVEL 255 goto noffmpeg
set input=%output%
if exist "%output%" goto comp
echo ERROR - Please check that the file is an image and source folder is writeable.
echo.
pause
goto end

:comp
echo Compressing %~nx1
%exe% -quality 80 "%input%" > "%~n1.q80.jpg"
goto next

:noffmpeg
echo ERROR - ffmpeg not found.  Please make sure ffmpeg is on the PATH environment variable.
pause
goto end

:next
echo.
shift
if not "%~1"=="" goto loop

:end