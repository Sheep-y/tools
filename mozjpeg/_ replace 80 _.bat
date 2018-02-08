@echo off
set exe="%~dp0cjpeg.exe"
if not "%~1"=="" goto confirm

cjpeg -version
echo High efficient JPEG compression - smaller and/or better quality than photoshop export.
echo Usage: In File explorer, drag and drop images onto this file.
echo (Non-jpeg files will be converted by ffmpeg, if ffmpeg is on Windows PATH.)
echo Warning: This script may replace dropped images and is non-reversible.
echo.
pause
goto end

:confirm
set argC=0
for %%x in (%*) do Set /A argC+=1
Set /A argC-=1
set INPUT=
set /P INPUT=Replace %~nx1 and %argC% other image(s) at quality 80? (Y/N) %=%
If "%INPUT%"=="y" goto loop
If "%INPUT%"=="Y" goto loop
goto end

:loop
set input=%~nx1
if /i "%~x1"==".jpg" goto comp
if /i "%~x1"==".jpeg" goto comp
echo Converting %~nx1 to jpg.
set output=%~n1.jpg
ffmpeg -y -loglevel error -i "%input%" -c:v mjpeg -frames:v 1 -q:v 2 -b:v 999999999k -an "%output%"
if ERRORLEVEL 1 echo ERROR - Cannot convert %~nx1 to jpg.
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
del "%input%"
ren "%~n1.q80.jpg" "%input%"
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