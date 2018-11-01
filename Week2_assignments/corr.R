specdata<-setwd("D:/coursera/R/specdata")
corr<-function(directory,threshold=0){
  if(grep("specdata", directory) == 1) {
    directory <- specdata
  }
  all_files<-as.character(list.files(directory))
  all_paths<-paste(directory,all_files,sep="/")
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  ids<-complete_table$id[nobs>threshold]
  len<-length(ids)
  corr_vector<-rep(0,len)
  j<-1
  for(i in ids){
    current_file<-read.csv(all_paths[i])
    co<-cor(current_file$sulfate,current_file$nitrate,use="complete.obs")
    corr_vector[j]<-co
    j<-j+1
    
  }
  corr_vector
}