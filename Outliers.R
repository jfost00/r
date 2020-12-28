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
x = rnorm(1000)
gstats(x)
#fplots(x)

y = rnorm(1000)
gstats(y)
#fplots(y)

f = mean(c(sd(x) * 3 + mean(x), sd(y) * 3 + mean(y)))
c = ifelse(sqrt(x**2 + y**2) > f, "red", "steelblue")

plot(x, y, pch=20, col=c)



