import pandas as pd
import csv
import os.path

skip = 2
i = 0
data = []

# START
print('Import file requirements:')
print('- 3 columns with header (name, testdate, pcr)')
print('- csv must use semicolon as delimiter')
print('- filename: values.csv')
print('- CSV and Python Script must share same directory')
print(' ')

# CHECK FOR FILE
if os.path.isfile('values.csv''):
	pass
else:
	print('VALUES:CSV NOT FOUND, EXITING')
	input("Press Enter to continue...")
	sys.exit()

while skip == 2:
	input1 = input('Skip zeros in column "pcr"? Type "yes" or leave empty: ')
	if input1 == 'yes':
		skip = 1
	elif input1 == '':
		skip = 0
	else:
		pass

print(' ')
print('START SORTING')
print(' ')

df = pd.read_csv('values.csv', sep=';', decimal='.', skiprows= 1, names=['name','testdate','pcr'])
dfRowCount = df.index
arrName = df['name'].unique()

for x in arrName:
	if i > 0: # skip first iteration
		file_object = open('results.csv', 'a', newline='')
		writer = csv.writer(file_object, delimiter = ";")
		writer.writerow(data)
		file_object.close()

	lookupName = arrName[i]
	i = i + 1
	row = 0
	data.clear()
	data.append(lookupName)
	print(lookupName)
	
	for y in dfRowCount:
		checkName = df.loc[row]['name']
		if lookupName == checkName:
			if skip == 1:
				if (df.loc[row]['pcr']) == (str(0)): # df is saved as string, zero has to be converted to string to compare
					pass
				else:
					testdate = df.loc[row]['testdate']
					pcr = df.loc[row]['pcr']
					data.append(testdate)
					data.append(pcr)	
			else:
				testdate = df.loc[row]['testdate']
				pcr = df.loc[row]['pcr']
				data.append(testdate)
				data.append(pcr)
		row = row + 1

# SAVE LAST DATA ARRAY
file_object = open('results.csv', 'a', newline='')
writer = csv.writer(file_object, delimiter = ";")
writer.writerow(data)
file_object.close()

# SUMMARY
print(' ')
print(i, ' DATA POINTS SORTED!')
