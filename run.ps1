"CHECK PYTHON INSTALLATION"
$fileToCheck = "C:\Program Files\Python310\python.exe"
if (Test-Path $fileToCheck -PathType leaf){
	"PYTHON ALREADY INSTALLED"
}else{
	"INSTALLING PYTHON"
	New-Item -ItemType directory -Path "$env:USERPROFILE\SortData\temp"
	wget https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe -OutFile "$env:USERPROFILE\SortData\temp\python-installer.exe"
	Start-Process "$env:USERPROFILE\SortData\temp\python-installer.exe" -argumentlist "/quiet InstallAllUsers=1 PrependPath=1" -wait
	Remove-Item -Recurse -Force "$env:USERPROFILE\SortData\temp" 
	$fileToCheck = "C:\Program Files\Python310\python.exe"
	if (Test-Path $fileToCheck -PathType leaf){
		"PYTHON SUCCESSFULLY INSTALLED"
	}else{
		"INSTALLATION ERROR, EXITING"
		pause
		exit
	}
	
}

"INSTALL PYTHON PACKAGES"
& "C:\Program Files\Python310\Scripts\pip.exe" install pandas --no-warn-script-location hg st 2>&1 | Out-Null

if (Test-Path -Path "$env:USERPROFILE\AppData\Roaming\Python\Python310\site-packages\pandas") {
    "PACKAGES INSTALLED"
} else {
    "PACKAGES MISSING, EXITING"
    pause
    exit
}

"UPDATING PYTHON SCRIPT"
wget https://raw.githubusercontent.com/geludwig/SortData/main/SortAlgorithm.py -OutFile "$env:USERPROFILE\SortData\SortAlgorithm.py"

"DONE"
pause

ii "$env:USERPROFILE\SortData\"
Start-Process -FilePath "$env:USERPROFILE\SortData\SortAlgorithm.py"
