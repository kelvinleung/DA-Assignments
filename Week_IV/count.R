# Week IV
# Part I
# Author: Kelvin
# Version: 1_0
# Edit time: 2014/01/30
#
######################################################

# How many of each cause of homicide?

count <- function(cause = NULL) {
  ## Check that "cause" is non-NULL; else throw error
  ## Check that specific "cause" is allowed; else throw error
  cause.list <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  if(!cause %in% cause.list | is.null(cause)){
    stop("invalid cause")
  }
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")
  ## Extract causes of death
  cause.clean <- regexpr("<dd>[C|c]ause(.*?)</dd>", homicides)
  cause.clean <- regmatches(homicides, cause.clean)
  cause.clean <- tolower(gsub("<dd>[C|c]ause: |</dd>", "", cause.clean))
  cause.count <- as.data.frame(table(cause.clean))
  ## Return integer containing count of homicides for that cause
  return(cause.count[cause.count$cause.clean == cause, 2])
}