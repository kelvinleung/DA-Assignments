# Part 2
# Plot the 30-day mortality rates for heart attack

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# Coerce to numeric
outcome[, 11] <- as.numeric(outcome[, 11])
# Plot, set x-axis' label and title
hist(outcome[, 11], xlab="30-day Death Rate", main="Heart Attack 30-day Death Rate")