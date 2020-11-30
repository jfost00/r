

dev.off() # reset options

set.seed(100) 

gdata = function(){
  l = list()
  l$x = rnorm(4000, mean = 4, sd = 2)
  l$x1 = runif(4000, min = 0, max = 4)
  l$x2 = rpois(4000, lambda = 3)
  l$x3 = rbinom(4000, size=3, prob = .2)
  return(l)
}

d = gdata()

# general stats
gstats = function(x){
  l = list()
  l$s = lapply(x, summary)
  l$r = lapply(x, range)
  l$m = lapply(x, mean)
  l$med = lapply(x, median)
  l$stdev = lapply(x, sd)
  l$t = lapply(x, t.test)
  l$h = lapply(x, hist)
  return(l)
}

# create a list of stats for each dataset
dstats = gstats(d)

# plot each dataset
lapply(d, plot)

# mean prob for each sample 
ssize = 500
i = 0
q = sample(d$x, ssize)
mean_list = mean(d$x)

while (i < 100){
  q = cbind(q, sample(d$x,ssize))
  mean_list = c(mean_list, mean(sample(d$x,ssize,replace=TRUE)))
  i = i + 1
}

m = summary(as.factor(round(mean_list, 1)))
m = m / sum(m)
barplot(m, ylim = c(0, max(m)+.15), 
        main="title",
        xlab="mean")



# Resources 
# https://www.investopedia.com/terms/c/central_limit_theorem.asp
# https://en.wikipedia.org/wiki/Central_limit_theorem
# https://www.britannica.com/science/central-limit-theorem
# https://byjus.com/jee/central-limit-theorem/