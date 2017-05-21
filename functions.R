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