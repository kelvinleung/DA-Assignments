# Week IV
# Part II
# Author: Kelvin
# Version: 1_0
# Edit time: 2014/01/30
#
######################################################

# Ages of homicide victims

agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  if(is.null(age)){
    stop("invalid age")
  }
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")
  ## Extract ages of victims; ignore records where no age is given
  age.clean <- regexpr("[0-9]* years old", homicides)
  age.clean <- regmatches(homicides, age.clean)
  age.clean <- tolower(gsub(" years old", "", age.clean))
  age.count <- as.data.frame(table(age.clean))
  ## Return integer containing count of homicides for that age
  ## If no age matches, return 0
  if(!age %in% age.count[, 1]){
    return(0)
  }else{
    return(as.numeric(age.count[age.count$age.clean == as.character(age), 2]))
  }
}