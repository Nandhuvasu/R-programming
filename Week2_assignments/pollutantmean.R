specdata<-setwd("D:/coursera/R/specdata")
pollutantmean<-function(directory,pollutant='sulfate',id=1:332){
  if(grep("specdata", directory) == 1) {
    directory <- specdata
  }
  
  all_files<-as.character(list.files(directory))
  all_paths<-paste(directory,all_files,sep="/")
  mean_vector <- c()
  for(i in id){
    current_file<-read.csv(all_paths[i])
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, na_removed)
  }
  result <- mean(mean_vector)
  result
 
}
