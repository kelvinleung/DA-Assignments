# Part 3
# Plot 30-day death rates by state

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
# Count the number of obs in each state
state.sub <- data.frame(n=as.vector(table(outcome$State)), state=names(table(outcome$State)))
# Suset, exclude those less than 20
# Tutorial: http://www.ats.ucla.edu/stat/r/modules/subsetting.htm
s <- state.sub[state.sub$n >= 20, 2]
outcome2 <- outcome[outcome$State %in% s, ]
# Pick them out
death <- outcome2[, 11]
state <- outcome2$State
# from forum: https://class.coursera.org/compdata-004/forum/thread?thread_id=926
# reorder state, return as ordered fator
state.median <- reorder(state, death, median, na.rm=T)
# store default par for later use
opar <- par(no.readonly=T)
# set the axis tick labels to be perpendicular to the axis
par(las=2)
# plot them all
boxplot(death ~ state.median, main = "Heart Attack 30-day Death Rate by State", ylab = "30-day Death Rate")
# reset par
par(opar)