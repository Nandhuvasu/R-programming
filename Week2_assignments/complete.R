specdata<-setwd("D:/coursera/R/specdata")
complete<-function(directory, id){
  if(grep("specdata", directory) == 1) {
    directory <- specdata
  }
  
  all_files<-as.character(list.files(directory))
  all_paths<-paste(directory,all_files,sep="/")
  complete_vector <- c()
  for(i in id){
    current_file<-read.csv(all_paths[i])
    complete_vector<-c(complete_vector,sum(complete.cases(current_file)))
  }
  final_dataframe<-data.frame(id=id, nobs = complete_vector)
  final_dataframe
}