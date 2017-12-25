@echo off
if not "%~1"=="" goto loop

cjpeg -version
echo High efficient JPEG compression - even smaller than photoshop export.
echo Usage: In File explorer, drag and drop jpg and png images onto this file.
echo.
pause
goto end

:loop
echo off
set input=%~nx1
if /i "%~x1"==".jpg" goto comp
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
set output=%input:.jpg=.q30.jpg%
"%~dp0cjpeg.exe" -quality 30 "%input%" > "%output%"
echo | set /p print=.
set output=%input:.jpg=.q40.jpg%
"%~dp0cjpeg.exe" -quality 40 "%input%" > "%output%"
echo | set /p print=.
set output=%input:.jpg=.q50.jpg%
"%~dp0cjpeg.exe" -quality 50 "%input%" > "%output%"
echo | set /p print=.
set output=%input:.jpg=.q60.jpg%
"%~dp0cjpeg.exe" -quality 60 "%input%" > "%output%"
echo | set /p print=.
set output=%input:.jpg=.q70.jpg%
"%~dp0cjpeg.exe" -quality 70 "%input%" > "%output%"
echo | set /p print=.
set output=%input:.jpg=.q80.jpg%
"%~dp0cjpeg.exe" -quality 80 "%input%" > "%output%"
echo | set /p print=.
set output=%input:.jpg=.q90.jpg%
"%~dp0cjpeg.exe" -quality 90 "%input%" > "%output%"
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