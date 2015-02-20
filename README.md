---
title: "README"
author: "Mike Bogacz"
date: "Thursday, February 19, 2015"
output: html_document
---

Description of tidySet function from run_analysis.R

The goal of the function is to combine the various files associated with the smartphone data as appropriate, and then to tidy up the data set, and output the results to a txt file.  It is divided into five sections as such:

1. The first section retreives the names of the feature variables and then identifies the variable names that contain either "-mean()" or "-sd()", so as to identify the columns that contain the data we want.  Other columns containing the word mean didn't appear to be true means; rather, they were functions including a mean variable.  This section also loads the activity labels that will be used in a merge later.

2. This section reads three training data files: the subject ID, the activity ID, and all of the feature variables.  It limits the feature variables to just the variable names selected in step #1.  Finally, it combines all of the columns into one data frame.

3. This is the same as step #2, except it compiles data for the test set instead of the training set.

4. This step combines all of the rows from the test and training data.  It then merges the activity name into the master data set based on the activity ID.  It then removes the activity ID, as it is no longer needed.

5. This step tidies the data further, by averaging all feature variables across each activity/subject pairing.  It then writes the final tidy data set to a text file in the same directory as the source files.  To read this table in R after running the code, use the read.table() function.

