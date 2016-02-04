#!/usr/bin/env Rscript

nbTests <- 5
sizes <- c(100, 1000, 10000, 100000, 1000000)
options(scipen=999) #disable the scientific notation


# First, create a vector containing all array sizes
vectTests = c();
i <- 1
for(size in sizes){
    for(rep in 1:nbTests){
        vectTests[i] <- size
        i <- i + 1
    }
}

# Then, shuffle this array by making a sample
vectTests <- sample(vectTests)

# Finally, write each element of this vector on a line in stdout
cat(vectTests, sep='\n')
