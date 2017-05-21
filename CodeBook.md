# Code Book
This code book gives you insights on how the raw input data for course "Getting and Cleaning Data" was cleaned and transformed. The variables of the two resulting data sets are explained column by column.

## Cleaning and Transfomation Process
To clean and transform the raw input data in order to create tidy data sets involved the following steps. The steps are implemented by **transform.R**.

1. load all necessary files
    + X_train.txt
    + y_train.txt
    + subject_train.ext
    + X_test.txt
    + y_test.txt
    + subject_test.ext
    + features.txt
    + activity_labels.txt
2. prepare activity columns (y_train, y_train)
    + set column name to **Activity**
    + replace activity ids with names form **activity_lables.txt**
    + make **Activity** column a factor
3. prepare subject columns
    + set column name to **SubjectID** (X_test.tct, X_train.txt)
    + make **SubjectID** column a factor
4. prepare feature column
    + set column names of **X_train.txt** and **X_test.txt** to second column of **features.txt**
    + select only columns with mean and std
    + tidy up column names
        + remove "()"
        + Camle Case names
5. build test and train sets by column bind
6. row bind test and train data set to result tidy data set 1
6. group tidy data set 1 by
    + SubjectID
    + Activity
7. Summarise fields by **mean** function to get tidy result data set 2

## Description tidyDataSet1.RData
Each row represents the mean or standard deviation of different measurements while a subject performed a known activity.

### Columns
1. **SubjectID** is an identifier unique for a given subject. It is a factor with levels form 1 to 30.
2. **Activity** is an identifier of the performed activity. It is a factor with levels LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS
3. **tBodyAccMeanX** mean of body acceleration signals in X direction    
4. **tBodyAccMeanY** mean of body acceleration signals in Y direction
5. **tBodyAccMeanZ**  mean of body acceleration signals in Z direction    
6. **tBodyAccStdX**  standard deviation of body acceleration signals in X direction    
7. **tBodyAccStdY** standard deviation of body acceleration signals in Y direction        
8. **tBodyAccStdZ** standard deviation of body acceleration signals in Z direction      
9. **tGravityAccMeanX** mean of gravity acceleration signals in X direction    
10. **tGravityAccMeanY**  mean of gravity acceleration signals in Y direction     
11. **tGravityAccMeanZ**  mean of gravity acceleration signals in Z direction          
12. **tGravityAccStdX**  standard deviation of gravity acceleration signals in X direction           
13. **tGravityAccStdY** standard deviation of gravity acceleration signals in Y direction            
14. **tGravityAccStdZ**  standard deviation of gravity acceleration signals in Z direction           
15. **tBodyAccJerkMeanX** mean of jerk signal of body acceleration signals in X direction       
16. **tBodyAccJerkMeanY** mean of jerk signal of body acceleration signals in Y direction       
17. **tBodyAccJerkMeanZ** mean of jerk signal of body acceleration signals in Z direction              
18. **tBodyAccJerkStdX** standard deviation of jerk signal of body acceleration signals in X direction           
19. **tBodyAccJerkStdY** standard deviation of jerk signal of body acceleration signals in Y direction           
20. **tBodyAccJerkStdZ** standard deviation of jerk signal of body acceleration signals in Z direction           
21. **tBodyGyroMeanX**  mean of gyroscope signals in X direction              
22. **tBodyGyroMeanY** mean of gyroscope signals in Y direction           
23. **tBodyGyroMeanZ** mean of gyroscope signals in Z direction                     
24. **tBodyGyroStdX** standard deviation of gyroscope signals in X direction                      
25. **tBodyGyroStdY** standard deviation of gyroscope signals in Y direction               
26. **tBodyGyroStdZ** standard deviation of gyroscope signals in Z direction               
27. **tBodyGyroJerkMeanX**  mean of jerk signal of gyroscope signals in X direction           
28. **tBodyGyroJerkMeanY**  mean of jerk signal of gyroscope signals in Y direction                 
29. **tBodyGyroJerkMeanZ**  mean of jerk signal of gyroscope signals in Z direction                 
30. **tBodyGyroJerkStdX**  standard deviation of jerk signal of gyroscope signals in X direction     
31. **tBodyGyroJerkStdY**  standard deviation of jerk signal of gyroscope signals in Y direction      
32. **tBodyGyroJerkStdZ**  standard deviation of jerk signal of gyroscope signals in Z direction         
33. **tBodyAccMagMean**  mean of magnitude of body acceleration signals       
34. **tBodyAccMagStd** standard deviation of magnitude of body acceleration signals               
35. **tGravityAccMagMean**  mean of magnitude of gravity acceleration signals  
36. **tGravityAccMagStd** standard deviation of magnitude of gravity acceleration signals      
37. **tBodyAccJerkMagMean** mean of jerk singal of magnitude of gravity acceleration signals      
38. **tBodyAccJerkMagStd** standard deviation of jerk singal of magnitude of gravity acceleration signals      
39. **tBodyGyroMagMean** mean of of magnitude of gyroscope signals        
40. **tBodyGyroMagStd** standard deviation of magnitude of gyroscope signals        
41. **tBodyGyroJerkMagMean** mean of jerk singal of magnitude of gyroscope signals      
42. **tBodyGyroJerkMagStd** standard deviation of jerk singal of magnitude of gyroscope signals   
43. **fBodyAccMeanX** mean of body acceleration signals in X direction (frequency domain signals)     
44. **fBodyAccMeanY** mean of body acceleration signals in Y direction (frequency domain signals) 
45. **fBodyAccMeanZ**  mean of body acceleration signals in Z direction (frequency domain signals)     
46  **fBodyAccStdX**  standard deviation of body acceleration signals in X direction (frequency domain signals)     
47. **fBodyAccStdY** standard deviation of body acceleration signals in Y direction (frequency domain signals)         
48. **fBodyAccStdZ** standard deviation of body acceleration signals in Z direction (frequency domain signals)    
49. **fBodyAccJerkMeanX** mean of jerk signal of body acceleration signals in X direction (frequency domain signals)        
50. **fBodyAccJerkMeanY** mean of jerk signal of body acceleration signals in Y direction (frequency domain signals)        
51. **fBodyAccJerkMeanZ** mean of jerk signal of body acceleration signals in Z direction (frequency domain signals)               
52. **fBodyAccJerkStdX** standard deviation of jerk signal of body acceleration signals in X direction (frequency domain signals)            
53. **fBodyAccJerkStdY** standard deviation of jerk signal of body acceleration signals in Y direction (frequency domain signals)            
54. **fBodyAccJerkStdZ** standard deviation of jerk signal of body acceleration signals in Z direction (frequency domain signals)       
55. **fBodyGyroMeanX**  mean of gyroscope signals in X direction (frequency domain signals)               
56. **fBodyGyroMeanY** mean of gyroscope signals in Y direction (frequency domain signals)            
57. **fBodyGyroMeanZ** mean of gyroscope signals in Z direction (frequency domain signals)                      
58. **fBodyGyroStdX** standard deviation of gyroscope signals in X direction (frequency domain signals)                       
59. **fBodyGyroStdY** standard deviation of gyroscope signals in Y direction (frequency domain signals)                
60. **fBodyGyroStdZ** standard deviation of gyroscope signals in Z direction (frequency domain signals)              
61. **fBodyAccMagMean**  mean of magnitude of body acceleration signals (frequency domain signals)        
62. **fBodyAccMagStd** standard deviation of magnitude of body acceleration signals (frequency domain signals)    
63. **fBodyBodyAccJerkMagMean** mean of jerk singal of magnitude of gravity acceleration signals      
64. **fBodyBodyAccJerkMagStd** standard deviation of jerk singal of magnitude of gravity acceleration signals (frequency domain signals)       
65. **fBodyBodyGyroMagMean** mean of of magnitude of gyroscope signals (frequency domain signals)         
66. **fBodyBodyGyroMagStd** standard deviation of magnitude of gyroscope signals (frequency domain signals)         
67. **fBodyBodyGyroJerkMagMean** mean of jerk singal of magnitude of gyroscope signals (frequency domain signals) 
68. **fBodyBodyGyroJerkMagStd** standard deviation of jerk singal of magnitude of gyroscope signals (frequency domain signals)


## Description tidyDataSet2.RData
Each row represents the mean of each varoable from **tidyDataSet1.RData** for each subject-activity-tuple.

### Columns
The columns represent the mean for the given measurement. Refere to the description of columns for **tidyDataSet2.RData**.