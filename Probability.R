dev.off()

# how many combinations of n items taken k at a time
choose(1,3)
choose(10, 3)
choose(100, 3)

# show the combinations
(x = combn(10,3))
x[,120]

s = sample.int(120, 10)
x[,s]


x1 = rnorm(100)
sample(x1, 10)

# sampling coin toss (even probability)
f = 5000 # number of flips
x2 = sample(c("Heads", "Tails"), f, replace = TRUE)
x2 = as.factor(x2)
x2t = summary(x2)
x2s = sum(x2t)
x3 = x2t / x2s
title = paste("Sample Head/Tails Coin Toss (", 
              as.character(f), " samples)", 
              sep = "")

barplot(x3, 
        main = title,
        xlab = "Category",
        ylab = "Probability",
        col="steelblue")


# distribution of three price points (prob = 25%, 50%, 25%)
f = 5000
x4 = sample(c("$30", "$40", "$50"), f, replace = TRUE, prob = c(0.25,0.5,0.2))
x4 = as.factor(x4)
x4t = summary(x4)
x4s = sum(x4t)
x5 = x4t / x4s

title = paste("Sample Price Points (", 
              as.character(f), " samples)", 
              sep = "")

barplot(x5, 
        main = title,
        xlab = "Prices",
        ylab = "Probability",
        col="steelblue")


# distribution of price points with variable probabilities 
f = 50000

prices = seq(from=30, to=50, by=2)

probs = seq(from=.3, to=.5, by=.02)

probs2 = runif(11, min = 0.01, max = 1)

probs3 = c(0.01, 0.1, 0.2, 
           0.2, 0.3, 0.4,
           0.5, 0.4, 0.3,
           0.2, 0.1)

probs4 = rnorm(11, mean = .5, sd = .2)


sample_prices = function(prices, f, probs, title) {
  x = sample(prices, f, replace = TRUE, prob = probs)
  x = as.factor(x)
  xt = summary(x)
  xs = sum(xt)
  x1 = xt / xs
  
  # title = paste("Sample Price Points (", 
  #               as.character(f), " samples)", 
  #               sep = "")
  
  barplot(x1, 
        main = title,
        xlab = "Prices",
        ylab = "Probability",
        col="steelblue")
  
}

par(mfcol=c(2,2))
hist(prices, col = "steelblue", main = "Histogram of Prices")
sample_prices(prices, f, probs, "Progressive Step")
sample_prices(prices, f, probs2, "Uniform Distribution")
sample_prices(prices, f, probs3, "Normal Distribution")


