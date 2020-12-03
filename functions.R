# generate data
gdata = function(){
  l = list()
  l$x = rnorm(4000, mean = 4, sd = 2)
  l$x1 = runif(4000, min = 0, max = 4)
  l$x2 = rpois(4000, lambda = 3)
  l$x3 = rbinom(4000, size=3, prob = .2)
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
  l$h = lapply(x, hist, col = "steelblue", xlab = "", main = "")
  return(l)
}

# mean probability for each sample
mean_prob = function(x){
  s = 500
  i = 0
  means = mean(sample(x, s, replace = TRUE))
  while (i < 99){
    means = c(means, mean(sample(x, s, replace = TRUE)))
    i = i + 1
  }
  m = summary(as.factor(round(means, 1)))
  m = m / sum(m)
  barplot(m, ylim = c(0, max(m) + 0.15),
          main = "",
          xlab = "Mean",
          ylab = "Probability",
          col = "steelblue")
}

# variance
var_prob = function(x){
  s = 500
  i = 0
  vars = var(sample(x, s, replace = TRUE))
  while (i < 99){
    vars = c(vars, var(sample(x, s, replace = TRUE)))
    i = i + 1
  }
  v = summary(as.factor(round(vars, 1)))
  v = v / sum(v)
  barplot(v, ylim = c(0, max(v) + 0.15),
          main = "",
          xlab = "Variance",
          ylab = "Probability",
          col = "steelblue")
}
