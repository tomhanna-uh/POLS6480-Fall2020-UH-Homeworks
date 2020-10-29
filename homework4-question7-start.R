rm(list=ls())
setwd("C:/R Studio Files/Teaching/homework4-pols")

library(RCurl)

myfile <- getURL("https://raw.githubusercontent.com/kosukeimai/qss/master/PREDICTION/intrade08.csv")

mydat <- read.csv(textConnection(myfile), header=T)

head(mydat)

mydat$prwin <- mydat$PriceD/100

myfile <- getURL("https://raw.githubusercontent.com/kosukeimai/qss/master/DISCOVERY/pres08.csv")

pres08 <-read.csv(textConnection(myfile), header=T)

head(pres08)

total<-merge(mydat, pres08, by=("state"))

#Git commit commit commit