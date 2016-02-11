#!/usr/bin/env Rscript

nbTests <- 1000
sizeMin <- 1
sizeMax <- 1000000
options(scipen=999) #disable the scientific notation


# Create a vector containing all array sizes
testSizes <- round(runif(nbTests, min=sizeMin, max=sizeMax))

#  Write each element of this vector on a line in stdout
cat(testSizes, sep='\n')
