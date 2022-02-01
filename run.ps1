"DOWNLOADING SCRIPT"
wget https://raw.githubusercontent.com/geludwig/SorttData/main/SortAlgorithm.py -OutFile "$env:USERPROFILE\SortData\SortAlgorithm.py"

"CHECK PYTHON INSTALLATION"
$fileToCheck = "C:\Program Files\Python310\python.exe"
if (Test-Path $fileToCheck -PathType leaf){
	"PYTHON ALREADY INSTALLED"
}else{
	"INSTALLING PYTHON"
	New-Item -ItemType directory -Path "$env:USERPROFILE\SortPatientData\temp"
	wget https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe -OutFile "$env:USERPROFILE\SortPatientData\temp\python-installer.exe"
	Start-Process "$env:USERPROFILE\SortPatientData\temp\python-installer.exe" -argumentlist "/quiet InstallAllUsers=1 PrependPath=1" -wait
	Remove-Item -Recurse -Force "$env:USERPROFILE\SortPatientData\temp" 
}

"INSTALL PYTHON PACKAGES"
& "C:\Program Files\Python310\Scripts\pip.exe" install pandas

"START SORT ALGORITHM"
ii "$env:USERPROFILE\SortPatientData\"
ii "$env:USERPROFILE\SortPatientData\SortAlgorithm.py"