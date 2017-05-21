# Getting And Cleaning Data

To reproduce the cleaning and transformation the following steps must be performed:

1. set working directory to root folder of **UCI HAR Dataset**
2. functions in **transform.R** are sourced
3. the rest of the script is sourced

The script will read the data from disk, prepare the data and clean it up and finally export the cleaned data. Look at the code book for deatails on the transformation process.

The cleaned and transformed data set is exported as **tidyDataSet2.txt** to the working directory.