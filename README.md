# GettingDataCourseProject

The run_analysis.R file contains 3 functions:

	1. calculateRelevantColumns
	As explained in the codebook, this project only considered mean and standard deviation data from the 
	original data set.  This function reads from the list of data items provided ("features.txt") and 
	calculates the location of each data point within the data files.  Because the data files are of fixed 
	with format, we need to also calculate the amount of space to skip between the desired columns. The list 
	of desired columns, and the column numbers for loading/skipping, are returned to the calling environment. 
	
	2. loadData
	This function, for each test and training data:
		1. Opens the data file using the paramters prepared above, and loads it into a data.table.
		2. Appends activity and subject information to it
		3. Combines the test and training data
	
	3. main 
		Calls the above 2 functions
		Writes the result to an output file.
