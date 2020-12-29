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

par(mfcol=c(2,2), ann = FALSE)
#title(main = )

high = 3
c = ifelse(sqrt(x**2 + y**2) > high, "red", "steelblue")
plot(x, y, pch=20, col=c)

med_high = 2.5
c = ifelse(sqrt(x**2 + y**2) > med_high, "red", "steelblue")
plot(x, y, pch=20, col=c)

med = 2
c = ifelse(sqrt(x**2 + y**2) > med, "red", "steelblue")
plot(x, y, pch=20, col=c)

low = 1.5
c = ifelse(sqrt(x**2 + y**2) > low, "red", "steelblue")
plot(x, y, pch=20, col=c)
