# Part 6
# Ranking hospitals by outcome in a state
# Based on Part 5

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data.sub <- subset(data, data$State==state)
  ## Check that state and outcome are valid
  if(length(data.sub[, 1])==0){
    stop("invalid state")
  }
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop("invalid outcome")
  }
  ## Return hospital name in that state with the given rank 30-day death rate
  ## Choose the right outcome
  ## Use suppressWarnings() to avoid warnings during coercing
  if(outcome=="heart attack"){
    rate <- suppressWarnings(as.numeric(data.sub[, 11]))
  }else if(outcome=="heart failure"){
    rate <- suppressWarnings(as.numeric(data.sub[, 17]))
  }else{
    rate <- suppressWarnings(as.numeric(data.sub[, 23]))
  }
  ## Rank the best rate
  ## Combine
  rank <- data.frame(Hospital=data.sub$Hospital.Name, Rate=rate, stringsAsFactors=F)
  ## Remove NAs
  rank <- rank[complete.cases(rank), ]
  ## Rank them all
  rank <- rank[order(rank$Rate, rank$Hospital), ]
  ## Return by num
  if(num=="best"){
    return(rank[1, ]$Hospital)
  }else if(num=="worst"){
    return(rank[nrow(rank), ]$Hospital)
  }else{
    return(rank[num, ]$Hospital)
  }
}