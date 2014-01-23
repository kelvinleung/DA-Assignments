# Part 2
# Plot the 30-day mortality rates for heart attack, heart failure, and pneumonia

# no idea why colClasses should equal to "character"
mydata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# store default par for later use
opar <- par(no.readonly=T)
# 3 rows of plots, 1 per row
par(mfrow=c(3, 1))
data.ha <- as.numeric(mydata[, 11])
data.hf <- as.numeric(mydata[, 17])
data.pn <- as.numeric(mydata[, 23])
# set x axis' range
plim <- range(data.ha, data.hf, data.pn, na.rm=T)
# plot them all
hist(data.ha, xlab="30-day Death Rate", xlim=plim, main="Heart Attact")
hist(data.hf, xlab="30-day Death Rate", xlim=plim, main="Heart Failure")
hist(data.pn, xlab="30-day Death Rate", xlim=plim, main="Pneumonia")

# to be continued...