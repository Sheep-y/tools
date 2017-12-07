@echo off
if not "%~1"=="" goto confirm

cjpeg -version
echo High efficient JPEG compression - even smaller than photoshop export.
echo Usage: In File explorer, drag and drop jpg and png images onto this file.
echo Warning: This script will replace dropped images and is non-reversible.
echo.
pause
goto end

:confirm
set argC=0
for %%x in (%*) do Set /A argC+=1
Set /A argC-=1
set INPUT=
set /P INPUT=Replace %~nx1 and %argC% other jpeg file(s) at quality 80? (Y/N) %=%
If %INPUT%=="y" goto loop
If %INPUT%=="Y" goto loop
goto end

:loop
if /i not "%~x1"==".jpg" goto skip
set "input=%~nx1"
echo | set /p print=Compressing %~nx1 .
set output=%input:.jpg=.q80.jpg%
"%~dp0cjpeg.exe" -quality 80 "%input%" > "%output%"
echo | set /p print= done.
del "%input%" > nul
ren "%output%" "%input%" > nul
goto next

:skip
echo %1 is not jpg.

:next
echo.
shift
if not "%~1"=="" goto loop

:end