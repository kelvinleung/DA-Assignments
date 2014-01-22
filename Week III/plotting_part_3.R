# Part 3
# Plot 30-day death rates by state

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
# count the number of obs in each state
state.sub <- data.frame(n=as.vector(table(outcome$State)), state=names(table(outcome$State)))
# suset, exclude those less than 20
# tutorial: http://www.ats.ucla.edu/stat/r/modules/subsetting.htm
s <- state.sub[state.sub$n >= 20, 2]
outcome2 <- outcome[outcome$State %in% s, ]
# basic boxplot
death <- outcome2[, 11]

# problem here:
# sort the states by their median 30-day death rate and plot the boxplots in order of them
state.median <- names(sort(tapply(outcome2[, 11], outcome2$State, median, na.rm=T)))
state <- sort(factor(outcome2$State, levels=as.factor(state.median), order=T))
# store default par for later use
opar <- par(no.readonly=T)
# set the axis tick labels to be perpendicular to the axis
par(las=2)
boxplot(death ~ state, ylab = "30-day Death Rate", main="Heart Attack 30-day Death by State")
