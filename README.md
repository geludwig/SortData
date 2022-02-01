# SortData

Algorithm to sort data from csv file and rearrange it from column to row. Then save it again to csv. Batch and Powershell scripts included to install Python and packages without user interaction.

IMPORT CSV STRUCTURE
- first column contains full name of persons
- second column contains test date
- third column contains pcr result

ALGORITHM
- first column is sorted for all unique names
- all dates and pcr results for one specific person will be rearranged to be in 1 row

EXPORT CSV STRUCTURE
- NAME DATE1 PCR1 DATE2 PCR2 DATE3 PCR3 ... DATEN PCRN

INSTALL SCRIPT
- install.bat creates dir in "%userprofile%\SortData", downloads and executes "run.ps1"
- run.ps1 installs Python, donwloads "SortData.py" and executes it
