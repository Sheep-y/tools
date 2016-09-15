@echo off
cd /d %~dp0
if not "%~1"=="" goto loop

cjpeg -version
echo High efficient JPEG compression - even smaller than photoshop.
echo Usage: In File explorer, drag and drop jpg and png images onto this file.
echo.
pause
goto end

:loop
set "input=%1"
echo | set /p print=Compressing %~nx1 .
set output==%input:.jpg=.q30.jpg%
cjpeg.exe -quality 30 %input% > %output%
echo | set /p print=.
set output==%input:.jpg=.q40.jpg%
cjpeg.exe -quality 40 %input% > %output%
echo | set /p print=.
set output==%input:.jpg=.q50.jpg%
cjpeg.exe -quality 50 %input% > %output%
echo | set /p print=.
set output==%input:.jpg=.q60.jpg%
cjpeg.exe -quality 60 %input% > %output%
echo | set /p print=.
set output==%input:.jpg=.q70.jpg%
cjpeg.exe -quality 70 %input% > %output%
echo | set /p print=.
set output==%input:.jpg=.q80.jpg%
cjpeg.exe -quality 80 %input% > %output%
echo | set /p print=.
set output==%input:.jpg=.q90.jpg%
cjpeg.exe -quality 90 %input% > %output%
echo | set /p print= done.
echo.
shift
if not "%~1"=="" goto loop

:end