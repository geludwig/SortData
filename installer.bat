@echo off
echo CREATE FOLDER
if exist %userprofile%\SortData\bin echo FOLDER ALREADY EXISTS SKIPPING
if not exist %userprofile%\SortData\bin mkdir %userprofile%\SortData\bin
echo COPY FILES
copy %cd%\installer.bat %userprofile%\SortData\
echo DOWNLOADING RUN SCRIPT
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/geludwig/SortData/main/run.ps1 -OutFile %userprofile%\SortData\bin\run.ps1"
pause
Powershell.exe -executionpolicy remotesigned -File  %userprofile%\SortData\bin\run.ps1