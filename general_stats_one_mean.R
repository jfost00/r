
dev.off() # reset options
par(mfrow=c(2,2))

set.seed(100) 

source("functions.R")

# create four populations with different distributions
d = gdata()

# create a list of stats for each dataset
dstats = gstats(d)

# plot each dataset
lapply(d, plot, pch=20, col="steelblue", ylab="Value")

# plot the probability mean for each 
lapply(d, mean_prob)

# plot the probability variance for each 
lapply(d, var_prob)
