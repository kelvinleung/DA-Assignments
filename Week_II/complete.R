# Week II
# Part II
# Author: Kelvin
# Version: optimized_1_0
# Edit time: 2014/01/24

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
  
  # Build a funtion for apply, return the number of complete cases
  CountComplete <- function(id){
    filename <- sprintf("%s/%03d.csv", directory, as.numeric(id))
    data <- read.csv(filename)
    return(nrow(na.omit(data)))
  }
  # Return the data frame
  return(data.frame(id=id, nobs=sapply(id, CountComplete)))
}
