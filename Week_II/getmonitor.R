# Week II
# Part I
# Author: Kelvin
# Version: optimized_1_0
# Edit time: 2014/01/24

getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  # Turn id into 3-digit num, combine it with directory
  filename <- sprintf("%s/%03d.csv", directory, as.numeric(id))
  data <- read.csv(filename)
  if(summarize){
    print(summary(data))
  }
  # Return!!!
  return(data)
}