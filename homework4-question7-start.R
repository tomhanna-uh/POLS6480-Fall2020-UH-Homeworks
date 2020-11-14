rm(list=ls())
setwd("C:/R Studio Files/Teaching/homework4-pols")

library(RCurl)

myfile <- getURL("https://raw.githubusercontent.com/kosukeimai/qss/master/PREDICTION/intrade08.csv")

intrade08 <- read.csv(textConnection(myfile), header=T)

head(mydat)

mydat$prwin <- mydat$PriceD/100

myfile <- getURL("https://raw.githubusercontent.com/kosukeimai/qss/master/DISCOVERY/pres08.csv")

pres08 <-read.csv(textConnection(myfile), header=T)

head(pres08)

## Transform price to probability
intrade08$PriceD.pr <- intrade08$PriceD / 100
## Days to Election Variable
intrade08$DaysToElection <- as.Date("11/04/2008",format = "%m/%d/%Y") - as.Date(intrade08$day,format ="%m/%d/%Y")

#intrade08$DaysToElection <- as.Date(intrade08$day, origin = "2008-11-04") 

## Calculate winner EV variable
pres08$EV.ob.act <- ifelse(pres08$Obama > pres08$McCain,
                           pres08$EV, 0)
## Merge the data sets
intrade08 <- merge(intrade08, pres08, by = "state")

## Subset day before election
int08rec <- intrade08[intrade08$DaysToElection == 1, ]

## Calculate expected votes
int08rec$EV.ob.pred <- int08rec$PriceD.pr * int08rec$EV

## Calculate expected total electoral votes vs. actual
sum(int08rec$EV.ob.act) + 1 # Add one for NE vote
sum(int08rec$EV.ob.pred)

#The expected number of Obama’s electoral votes equals the sum of the
#total number of electoral votes in each state multiplied by the
#corresponding probability of Obama’s victory. (There’s
#                                               some disparities given rounding, but I’ll accept answer
#                                              ranging from 349 - 364. In sum,
#                                               the prediction markets appear accurate.
                                               Page