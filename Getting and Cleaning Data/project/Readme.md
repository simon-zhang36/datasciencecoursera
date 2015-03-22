---
title: 'CourseProject'
author: 'Xiaoyu Zhang'
Date: "03/20/2015"
---


Repository for the Course Project for Getting and Cleaning Data on Coursera


### DESCRIPTION

This repository contains information, data and code for a project related to the R related course "Getting and Cleaning Data" on Coursera.
The purpose of this project is to demonstrate the ability to collect, work 
with, and clean a data set using R.

The R script named "run_analysis.R", can be sourced from inside an R session. For example, launching a new R session
It would be better to set the working directory to point to the repository where data and R script are stored by using the function "setwd()"


The final structure and content of the tidy data set is detailed in the file "CodeBook.md".


### DATA SOURCES

The original data set to be processed for the course project is available as a "zip" file at:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

After downloading, it should be "unzipped". Details for the data set are 
provided in its README.md file.

A full description of the data is available at:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

  
### TASKS

#### Overview

The R script merges the original "training" and "test" data sets, extracts measurements on the mean and standard deviation for each measurement, uses descriptive activity names and labels the variables, generates a tidy data set with the average of each variable for each activity and each subject.

#### Details 

1. imports the train and the test data sets (as data.frames)

2. imports the variable names (as a vector) from the original file 
"features.txt" (keeps only the strings)

3. cleans-up the variable names from leftover parenthesis characters and
expands them so as to make it easier to read and understand them

3. assign the "clean" variable names to the train and the test data sets

4. attaches the activity class numbers and labels to the train and the test 
data sets 

5. binds (=merges) the train and the test data in one data.frame

6. attaches class numbers and descriptive labels for the activities

7. reorders the columns of the merged data.frame so as to place the Subject, activity labels and activity names in the first 3 columns

8. extracts all columns which contain the strings "mean" and "std" in their 
variable names

9. load the "reshape2" library to "melt" the data set and derive mean 
values for the measured variables groupped by Subject & Activity

10. adjusts the variable names for the tidy data set

Finally, the tidy data set provided in this repository (object named "data.tidy", was exported as "tidydata.csv" as well as tidydata.txt by "write.table()" function



### LEGAL NOTICES

For this repository, no LICENSE or COPYRIGHT applies. However, the LICENSE for
the original data set, as retrieved from its source README.md file, is:


### License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



### CREDITS & ACKNOLEDGEMENTS

- Coursera <http://www.coursera.org/>
- Instructor(s) of the Course <https://class.coursera.org/getdata-004/wiki/About_the_Instructor>
- Participants in the Courser's Discussion Forums <https://class.coursera.org/getdata-004/forum>
- Secial thanks to the "Community TA"s
  -- David Hood <https://class.coursera.org/getdata-004/forum/profile?user_id=134866>
  -- Scott von Kleeck <https://class.coursera.org/getdata-004/forum/profile?user_id=2161770>
