# Getting-and-Cleaning-Data-Course-Project
### This is the Coursera project for "Getting and Cleaning Data". The major file in the project is the "run_analysis.R", which does the following thing: (Suppose the download and unzipping of the dataset has already done.)
###1.Read in both the test data and train data.
###2.Read in the features(measurements), subjects, and activities from the corresponding files.
###3.Merge the subjects, activities and data sets from test and train.
###4.Select features with 'mean()' and 'std()' in its name.
###5.Use feartures to name the data.
###6.Combine subjects and activities with the data.
###7.Reshape and get the averge values of the data using melt and dcast from 'reshape2' package.
###8.Write the processed data into a new file called 'tidyData.txt'.
