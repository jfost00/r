# generate data
gdata = function(){
  l = list()
  l$x = rnorm(4000, mean = 4, sd = 2)
  l$x1 = runif(4000, min = 0, max = 4)
  l$x2 = rpois(4000, lambda = 3)
  l$x3 = rbinom(4000, size=3, prob = .2)
  d = c(rnorm(2000, mean = 1, sd = 2), rnorm(2000, mean = 10, sd = 2))
  d = d[d>0]
  l$x4 = d
  return(l)
}

# general stats
gstats = function(x){
  l = list()
  l$s = lapply(x, summary)
  l$r = lapply(x, range)
  l$m = lapply(x, mean)
  l$med = lapply(x, median)
  l$stdev = lapply(x, sd)
  l$t = lapply(x, t.test)
  l$h = lapply(x, hist, plot=FALSE)
  return(l)
}

# mean and variance 
mv_prob = function(x){
  s = 500
  i = 0
  means = mean(sample(x, s, replace = TRUE))
  vars = var(sample(x, s, replace = TRUE))
  while (i < 99){
    means = c(means, mean(sample(x, s, replace = TRUE)))
    vars = c(vars, var(sample(x, s, replace = TRUE)))
    i = i + 1
  }
  m = summary(as.factor(round(means, 1)))
  v = summary(as.factor(round(vars, 1)))
  m = m / sum(m)
  v = v / sum(v)
  
  barplot(m, ylim = c(0, max(m) + 0.15),
          main = "",
          xlab = "Mean",
          ylab = "Probability",
          col = "steelblue")
  
  barplot(v, ylim = c(0, max(v) + 0.15),
          main = "",
          xlab = "Variance",
          ylab = "Probability",
          col = "steelblue")
  
  # return means and vars
}

# foundation plots 
fplots = function(x){
  par(mfrow=c(2,2))
  plot(x, pch=20, col="steelblue", ylab="Value")
  hist(x, col = "steelblue", xlab = "Value", main = "")
  mv_prob(x)
}
