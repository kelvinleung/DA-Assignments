# Part 4
# Plot 30-day death rates and numbers of patients

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
hospital <- read.csv("hospital-data.csv", colClasses = "character")
# merge them to match the Hospital.Ownership variable to the death rate data
outcome.hospital <- merge(outcome, hospital, by = "Provider.Number")
# transform data
death <- as.numeric(outcome.hospital[, 11])
npatient <- as.numeric(outcome.hospital[, 15])
owner <- factor(outcome.hospital$Hospital.Ownership)
# load lattice package
library(lattice)
# plot them all
xyplot(death ~ npatient | owner,
       xlab="Number of Patients Seen", ylab="30-day Death Rate",
       main="Heart Attack 30-day Death Rate by Ownership",
       panel=function(x, y, ...){
                panel.xyplot(x, y, ...)
                panel.lmline(x, y)
                }
       )