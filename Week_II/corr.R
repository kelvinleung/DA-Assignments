# Week II
# Part III
# Author: Kelvin
# Version: optimized_1_0
# Edit time: 2014/01/24

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # Brief goal:
  
  ## for each file in the directory 
  ## read the file 
  ## find the number of complete cases in that file 
  ## if the number of complete cases is greater than the threshold number then 
  ## use R's built in cor function to calculate the correlation between sulfate and nitrate for that file 
  ## stick the result of the cor function onto the end of a numeric vector
  ## end if 
  ## next file 
  ## return the numeric vector
  
  # Function for apply
  SubCorr <- function(id){
    filename <- sprintf("%s/%03d.csv", directory, as.numeric(id))
    data <- read.csv(filename)  
    if(nrow(na.omit(data)) > threshold){
      # cor(use="pairwise.complete.obs") arg "use" can omit NAs
      return(cor(data$sulfate, data$nitrate, use="pairwise.complete.obs"))
    }else{
      # NAs can be omitted later
      return(NA)
    }
  }
  # Return as a numeric vector
  return(as.numeric(na.omit(sapply(1:332, SubCorr))))
}