###############################
# Functions
###############################
loadData <-function() {
  # load train files
  df.trainx <<- read.table(file = "train/X_train.txt",
                           sep = "" ,
                           header = F ,
                           na.strings ="", 
                           stringsAsFactors= F)
  
  df.trainy <<- read.table(file = "train/y_train.txt",
                           sep = "" ,
                           header = F ,
                           na.strings ="", 
                           stringsAsFactors= F)
  
  
  df.trainsubject <<- read.table(file = "train/subject_train.txt",
                                 sep = "" ,
                                 header = F ,
                                 na.strings ="", 
                                 stringsAsFactors= F)
  
  # load test files
  df.testx <<- read.table(file = "test/X_test.txt",
                          sep = "" ,
                          header = F ,
                          na.strings ="", 
                          stringsAsFactors= F)
  
  df.testy <<- read.table(file = "test/y_test.txt",
                          sep = "" ,
                          header = F ,
                          na.strings ="", 
                          stringsAsFactors= F)
  
  df.testsubject <<- read.table(file = "test/subject_test.txt",
                                sep = "" ,
                                header = F ,
                                na.strings ="", 
                                stringsAsFactors= F)
  
  # load meta files
  df.featureDescription <<- read.table(file = "features.txt",
                                       sep = "" ,
                                       header = F ,
                                       na.strings ="", 
                                       stringsAsFactors= F)
  
  df.activityLables <<- read.table(file = "activity_labels.txt",
                                   sep = "" ,
                                   header = F ,
                                   na.strings ="", 
                                   stringsAsFactors= F)
}

prepareActivityColumn <- function(df.y, df.activityLables) {
  # rename column
  names(df.y) <- "Activity"
  
  # replace acitvity ids with names
  for( int.crrRow in seq_len(nrow(df.activityLables))) {
    df.y$Activity[df.y$Activity == df.activityLables[int.crrRow,]$V1] <- df.activityLables[int.crrRow,]$V2
  }
  
  # make column a factor
  df.y$Activity <- as.factor(df.y$Activity)
  
  return(df.y)
}

prepareFeatureColumns <- function(df.x, df.featureDescription) {
  # set names of features
  names(df.x) <- df.featureDescription$V2
  # select only mean and std
  df.x <- df.x[,grep(pattern = "(mean\\(\\)|std\\(\\))", names(df.x))]
  # rename columns
  names(df.x) <- gsub(pattern = "-", replacement = "", x = names(df.x))
  names(df.x) <- gsub(pattern = "mean\\(\\)", replacement = "Mean", x = names(df.x))
  names(df.x) <- gsub(pattern = "std\\(\\)", replacement = "Std", x = names(df.x))
  names(df.x) <- gsub(pattern = "meanFreq\\(\\)", replacement = "MeanFreq", x = names(df.x))
  return(df.x)
}

########################################
# Script starts here
########################################

# load data
loadData()

# prepate activity columns
df.trainyperp <- prepareActivityColumn(df.y = df.trainy,
                                       df.activityLables = df.activityLables)

df.testyperp <- prepareActivityColumn(df.y = df.testy,
                                      df.activityLables = df.activityLables)

# prepare subject columns
names(df.trainsubject) <- "SubjectID"
df.trainsubject$SubjectID  <- as.factor(df.trainsubject$SubjectID)
names(df.testsubject) <- "SubjectID"
df.testsubject$SubjectID  <- as.factor(df.testsubject$SubjectID)

# prepare feature columns
df.testxprep <- prepareFeatureColumns(df.x = df.testx,
                                      df.featureDescription = df.featureDescription)
df.trainxprep <- prepareFeatureColumns(df.x = df.trainx,
                                       df.featureDescription = df.featureDescription)

# build test and train sets
df.train <- cbind(df.trainsubject,
                  df.trainyperp,
                  df.trainxprep)


df.test <- cbind(df.testsubject,
                  df.testyperp,
                  df.testxprep)

# merge test and train sets
df.data1 <- rbind(df.train, df.test)

# group by variables to get data set for point 5
library(dplyr)
df.data2 <- group_by(.data = df.data,
                     SubjectID, Activity) %>%
  summarise_each(funs(mean))

# export final data set
write.table(df.data1,
            file = "tidyDataSet1.txt",
            row.names = FALSE) 
write.table(df.data2,
            file = "", 
            row.names = FALSE) 


