rm(list=ls())
setwd("C:/R Studio Files/Teaching/POLS6480-Fall2020-UH-Homeworks/Homework 7")

load("gerber_green_larimer.Rdata")

View(gerber)
names(gerber)

summary(gerber$voted)
summary(gerber$treatment)
summary(gerber$sex)
summary(gerber$yob)
summary(gerber$p2004)

