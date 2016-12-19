## Course Project Code Book

* Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## run_analysis.R:

The attached R script ("run_analysis.R") performs the following:

* Step 1:

Reads all the test and training files: X_test.txt, y_test.txt, subject_test.txt.
Combines the files to a data frame in the form of subjects, labels, the rest of the data.

* Step 2:

Reads the features from features.txt and filters it to only leave features that are either means ("mean()") or standard deviations ("std()").
A new data frame is then created that includes subjects, labels and the described features.

* Step 3:

Reads the activity labels from activity_labels.txt and replace the numbers with the text.

* Step 4:

Makes column names tidy by removing all non-alphanumeric characters and converting the result to lowercase.

* Step 5:

Creates a new data frame with the average for each combination of subject and label (this is done by the aggregate() function) and writes the tidy set into a text file called "tidy.txt".
