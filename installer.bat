@echo off

echo CHECK INTERNET
ping www.google.com -n 1 > NUL
IF errorlevel 1 (
	echo NO INTERNET CONNECTION, EXITING
	pause
	exit
)

echo CHECK INSTALL PATH
if not exist "%userprofile%\SortData\bin" mkdir "%userprofile%\SortData\bin"

echo UPDATE FILES
copy "%cd%\installer.bat" "%userprofile%\SortData\" > NUL
if exist "%userprofile%\SortData\bin\run.ps1" del "%userprofile%\SortData\bin\run.ps1"

echo DOWNLOAD PAYLOAD
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/geludwig/SortData/main/run.ps1 -OutFile "%userprofile%\SortData\bin\run.ps1""

echo INSTALLER FINISHED
pause
Powershell.exe -executionpolicy remotesigned -File  "%userprofile%\SortData\bin\run.ps1"
