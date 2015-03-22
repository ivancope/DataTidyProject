[1] Introduction. 

This script combines data sets from the HAR UCI Dataset, which represents mechanical motion captured by the accelerometer and gyro of a smartphone(Samsung Galaxy S II) into a coherent single data set that been structured to adhere to the the three principles of tidy data sets.

The HAR UCI Dataset has a simmilar structure to the sketch below.   These are read into data frames for processing, mostly in R.

The structure of these data frames is also similar and  they are  combined into one data set.  
One can think of these files as jigsaw pieces that all go together to form a single data set of 10299 rows and 563 columns.

Actually only the 86 columns(variables) with the text "mean" or "std" are utilised in the project.
The observations are also reduced (to 180) by using the mean values of the 180 subject-activity combinations -
30 subjects and 6 activities. 

The data frame observations are sorted by ascending subject number and within that activity alphabetically, so it is nicely structured.

Finally, the final tidy data set is written to the file TidyDataSet.txt in the working directory.


Notes:
 i) The diagnostic print statements utilised during coding have been retained in case they are required     future need, but have been inactivated as comments.

ii) The section numbers [1], [2], etc are repeated in the R script for easy reference

===================================================================================================

[2] Read Data into data frame tables in the working directory, "C:/Users/User/Desktop/DataScienceWorkDir"

Xtest.tbl is a numeric data frame formed from X_test.txt,
Xtrain.tbl is a numeric data frame formed from X_train.txt,
ytest.tbl is an integer data frame of activities formed from y_test.txt,
ytrain.tbl is an integer data frame of activities formed from y_train.txt")
subjtest.tbl is an integer data frame of subjects formed from subject_test.txt,and
subjtrain.tbl is an integer data frame of subjects formed from subject_train.txt.


                   Subjects             Activities               Measurements            Total Columns
                        __                   __               ______________               (variables)
            Test data  |  | subj.test.tbl   |  | ytest.tbl   |              |  Xtest.tbl
                       |  |   2947 rows     |  | 2947 rows   |              |  2947 rows
                       |  |      1 column   |  |    1 column |              |   561 columns   563 cols
                       |  |                 |  |             |              |
                       |  |                 |  |             |              |
                       |  |                 |  |             |              |
                       |  |                 |  |             |              |
                       |__|                 |__|             |______________|


                        __                   __                ______________               
            Training   |  | subj.train.tbl  |  | ytrain.tbl  |              |  Xtrain.tbl
               data    |  |   7532 rows     |  | 7532 rows   |              |  7532 rows
                       |  |      1 column   |  |    1 column |              |   561 columns   563 cols
                       |  |                 |  |             |              |
                       |  |                 |  |             |              |
                       |  |                 |  |             |              |
                       |  |                 |  |             |              |
                       |__|                 |__|             |______________|


  Total Rows(observations)  10299 rows          10299 rows                     10299 rows

================================================================================================

[3] Create activity names data frame called ActivNames_test, and ActivNames_train
        for the test set and the training set respectively.

    and change number codes to descriptive names: 
    1 -> "Walk", 
    2 -> "Walk_Upstairs",
    3 -> "Walk_Dwnstairs",
    4 -> "Sit",
    5 -> "Stand",
    6 -> "Lie".

    ActivNames_test is a character data frame for the test set, and
    ActivNames_train is a character data frame for the training set.
    
=====================================================================================================


[4] For the test data, set "Subject" as column name,
        and combine with activity data frame using cbind().
        to form a data frame called subj_act_test.
        The first column is an integer subject variable, and 
        the second column is a character activity variable.

    Simlarly, for the training data, set "Subject" as column name,
        and combine with activity data frame using cbind().
        to form a data frame called subj_act_train.
        The first column is an integer subject variable, and 
        the second column is a character activity variable.

# ===============================================================================

 [5] Temporary names are applied to columns in Xtest.tbl, to facilitate the selection of columns.

     Simlarly, for the training data,
        temporary names are applied to columns in Xtrain.tbl, to facilitate the selection of columns.

       [This section could have been more elegantly done using a for statement.
        However, since it was working it was retained in the naive form.]

============================================================================================

 [6] Measurements on means (column names containing 'mean') 
     and  standard deviation (columns names containing 'std') in the test set, Xtest.tbl are selected
     to form a reduced numeric data frame of 86 columns (variables) called te.

     Simlarly, for the training data,
     measurements on means (column names containing 'mean') 
     and  standard deviation (columns names containing 'std') in the traing set, Xtrain.tbl are selected
     to form a reduced numeric data frame of 86 columns (variables) called tr.

========================================================================================================

 [7] The test and training Subject-Activity data frames, subj_act_test and subj_act_train,
        are combined by rbind() to form a data frame of 10299 rows called sa

=========================================================================================================

 [8] The test and training measurements on mean & standard deviation data frames, te and tr, 
        are combined by rbind() to form a data frame of 10299 rows called tetr.

========================================================================================================

 [9] The measurement data frame, tetr, are labelled with descriptive variable names.  
        (The labels provided for the measurements have been streamlined somewhat, 
         but some of the names remain rather long and unwieldy.
         However, it was felt that further simplification would result in loss of information.)

=====================================================================================================

 [10] The subject-activity data frame, sa, is Combined with the measurement data frame, tetr by cbind().
         to form a combined data frame called combo with 88 columns.
      
         These are the subject and activity variables and 86 measurement variables.  
         There are 10299 rows (observations).

=========================================================================================================

 [11] The final tidy data set, TidyData is obtained using aggregate(),
         the variables being means of observations for the Subject-Activity combination 

         Subject and Activity vectors, Subj and Activty, are created for use in aggregate()
         to form tidydat, a data frame with 180 rows(observations), one for each 
         Subject-Activity combination. (There are 30 subjects and 6 activities.)

         The subject column is integer, the activity column is character 
         and the 86 measurement columns are all numeric.

         Names, "Subject" and "Activity, are given to the ordering variables, so that 
         tidydat can be ordered using order() to a data frame called TidyData.

         TidyData has the properties of tidy data:
              - each variable forms a column,
              - each observation forms a row,
              - each observational unit forms a table. (There is only one observational unit.)

         TidyData is a data frame of 180 rows(observations), 
         one for each  Subject-Activity combination.
         There are 88 columns ( Subject, Activity plus 86 measured variables) 
         ordered nicely, with activities within subjects.  
         This can be seen by printing out the first 3 columns of TidyData with the statement:
                          TidyData[,1:3]

=====================================================================================================

 [12] TidyData is written to the file TidyDataSet.txt in the work directory

===================================================================================================== 
[13] Conclusion.

      The objective of producing a tidy data set has been achieved.

===================================================================================================== 
[14] References.

 {1} Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity      Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.      International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

 {2} Hadley Wickham, Tidy Data, Journal of Statistical Software MMMMMM YYYY, Vol VV, Issue II
     http://www.jstatsoft.org/v59/i10/paper

===================================================================================================== 
[14] Acknowledgement.
      
      Use of the UCI HAR Dataset is acknowledged, (reference {1}).
======================================================================================================

