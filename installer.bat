@echo off
echo INSTALLING SORT ALGORITHM

echo CREATE FOLDER
if exist "%userprofile%\SortData\bin" echo FOLDER ALREADY EXISTS SKIP
if not exist "%userprofile%\SortData\bin" mkdir "%userprofile%\SortData\bin"

echo COPY FILES
copy "%cd%\installer.bat" "%userprofile%\SortData\"

echo DELETE OLD FILES
if exist "%userprofile%\SortData\bin\run.ps1" echo del "%userprofile%\SortData\bin\run.ps1"
if not exist "%userprofile%\SortData\bin\run.ps1" echo NOTHING TO DELETE SKIP

echo DOWNLOADING PAYLOAD
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/geludwig/SortData/main/run.ps1 -OutFile "%userprofile%\SortData\bin\run.ps1""

echo INSTALLER FINISHED
pause
Powershell.exe -executionpolicy remotesigned -File  "%userprofile%\SortData\bin\run.ps1"
