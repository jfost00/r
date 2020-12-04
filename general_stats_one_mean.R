
dev.off() # reset options
source("functions.R")

# create populations with different distributions
set.seed(100) 
d = gdata()

# create a list of stats for each dataset
dstats = gstats(d)

# plot each dataset
lapply(d, fplots)
