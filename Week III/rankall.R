# Part 7
# Ranking hospitals in all states
# Based on Part 6

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop("invalid outcome")
  }
  ## Return a data frame with the hospital name and the (abbreviated) state name
  ## Choose the right outcome
  ## Use suppressWarnings() to avoid warnings during coercing
  if(outcome=="heart attack"){
    rate <- suppressWarnings(as.numeric(data[, 11]))
  }else if(outcome=="heart failure"){
    rate <- suppressWarnings(as.numeric(data[, 17]))
  }else{
    rate <- suppressWarnings(as.numeric(data[, 23]))
  }
  ## Rank the best rate
  ## Combine
  rank <- data.frame(hospital=data$Hospital.Name, state=data$State, rate=rate, stringsAsFactors=F)
  ## Remove NAs
  rank <- rank[complete.cases(rank), ]
  ## Rank them all
  rank <- rank[order(rank$state, rank$rate, rank$hospital), ]
  ## Generate a func for aggregate()
  RankData <- function(data, num){
    if(num=="best"){
      return(data[1])
      }else if(num=="worst"){
        return(data[length(data)])
        }else{
          return(data[num])
          }
  }
  ## Here's the magic! aggregate(x ~ y, data, FUN), split x by y for FUN, return a df
  rank.output <- aggregate(hospital ~ state, data=rank, FUN=function(data){RankData(data, num)})
  ## Return!!!
  return(data.frame(hospital=rank.output[, 2], state=rank.output[, 1]))
}