dev.off()
source("functions.R")
set.seed(100)


# one dimension
x = rnorm(1000)
gstats(x)
#fplots(x)

f = sd(x) * 3 + mean(x)
c = ifelse(x >= f, "red", "steelblue")

plot(x, pch = 20, col = c)


# two dimensions
x = rnorm(4000)
gstats(x)
#fplots(x)

y = rnorm(4000)
gstats(y)
#fplots(y)


f = mean(c(sd(x) * 3 + mean(x), sd(y) * 3 + mean(y)))
c = ifelse(sqrt(x**2 + y**2) > f, "red", "steelblue")

plot(x, y, pch=20, col=c)



# Varying levels of assurance 
# More assurance = less observations
# Use math to find assurance 
x = rnorm(100)
y = rnorm(100)
a = seq(from = 1, to = 3, by = 0.1)

risk = function(x, y, a){
  m = lapply(a, function(a){sqrt(x**2 + y**2) > a})
  lapply(m, function(m){
    c = ifelse(m, "red", "steelblue")
    plot(x, y, pch=20, col = c)
  })
}

par(mfcol=c(2,2))
risk(x,y,a)


