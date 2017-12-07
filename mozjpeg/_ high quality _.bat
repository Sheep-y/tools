@echo off
if not "%~1"=="" goto loop

cjpeg -version
echo High efficient JPEG compression - even smaller than photoshop export.
echo Usage: In File explorer, drag and drop jpg and png images onto this file.
echo.
pause
goto end

:loop
if /i not "%~x1"==".jpg" goto skip
set "input=%~nx1"
echo | set /p print=Compressing %~nx1 .
set output==%input:.jpg=.q90.jpg%
"%~dp0cjpeg.exe" -quality 90 "%input%" > "%output%"
echo | set /p print=.
set output==%input:.jpg=.q92.jpg%
"%~dp0cjpeg.exe" -quality 92 "%input%" > "%output%"
echo | set /p print=.
set output==%input:.jpg=.q94.jpg%
"%~dp0cjpeg.exe" -quality 94 "%input%" > "%output%"
echo | set /p print=.
set output==%input:.jpg=.q96.jpg%
"%~dp0cjpeg.exe" -quality 96 "%input%" > "%output%"
echo | set /p print=.
set output==%input:.jpg=.q98.jpg%
"%~dp0cjpeg.exe" -quality 98 "%input%" > "%output%"
echo | set /p print=.
set output==%input:.jpg=.q100.jpg%
"%~dp0cjpeg.exe" -quality 100 "%input%" > "%output%"
echo | set /p print= done.
goto next

:skip
echo %1 is not jpg.

:next
echo.
shift
if not "%~1"=="" goto loop

:end