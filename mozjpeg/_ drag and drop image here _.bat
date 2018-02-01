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
echo | set /p print=Compressing %~nx1 .
%exe% -quality 30 "%input%" > "%~n1.q30.jpg"
echo | set /p print=.
%exe% -quality 40 "%input%" > "%~n1.q40.jpg"
echo | set /p print=.
%exe% -quality 50 "%input%" > "%~n1.q50.jpg"
echo | set /p print=.
%exe% -quality 60 "%input%" > "%~n1.q60.jpg"
echo | set /p print=.
%exe% -quality 70 "%input%" > "%~n1.q70.jpg"
echo | set /p print=.
%exe% -quality 80 "%input%" > "%~n1.q80.jpg"
echo | set /p print=.
%exe% -quality 90 "%input%" > "%~n1.q90.jpg"
echo | set /p print= done.
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