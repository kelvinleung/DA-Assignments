complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  n <- length(id)
  ca <- 1:n
  cb <- 1:n
  j <- 1
  for(i in id){
    idMod <- sprintf("%03d" , as.numeric(i))
    fileName <- sprintf("%s/%s.csv" , directory , idMod)  
    myData <- read.csv(fileName)
    nCom <- nrow(na.omit(myData))
    ca[j] <- i
    cb[j] <- nCom
    j <- j+1
  }
  myOP <- as.data.frame(cbind("id"=ca,"nobs"=cb))
  return(myOP)
}