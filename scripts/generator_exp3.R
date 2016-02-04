#!/usr/bin/env Rscript

nbTests <- 20
sizes <- c(100, 1000, 10000, 100000, 1000000)
threadsLevels <- c(2,4,6,8,10)
seeds <- c()
options(scipen=999) #disable the scientific notation

# First, generate seeds (one for every size for every repetition)
testsSeeds <- round(runif(nbTests * length(sizes), 1, 100000000))

# Then, create a vector containing the array sizes
testsSizes = c();
i <- 1
for(size in sizes){
    for(rep in 1:nbTests){
        testsSizes[i] <- size
        i <- i + 1
    }
}

# Now, we will replicate the testsSizes and testsSeeds to run them for every threadLevel
# We also create the testsLevels vector
testsSizes <- rep(testsSizes, length(threadsLevels))
testsSeeds <- rep(testsSeeds, length(threadsLevels))
testsLevels <- rep(threadsLevels, each=nbTests * length(sizes))

# Finally, creation of the dataframe
testsDF <- data.frame(testsSizes, testsSeeds, testsLevels)
# and shuffle
testsDF <- testsDF[sample(nrow(testsDF)),]


# print the dataframe without the row and column names
write.table(testsDF, row.names = FALSE, col.names=FALSE)
