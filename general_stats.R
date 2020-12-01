
source("functions.R")

# Data two means
set.seed(100)
d = c(rnorm(2000, mean = 1, sd = 2), rnorm(2000, mean = 10, sd = 2))
d = d[d>0]

# general stats
summary(d)

####### Plotting ####### 

mean_prob(d)

sample_size = 500
i = 0
means = mean(sample(d, sample_size, replace = TRUE))
while (i < 99){
  means = c(means, mean(sample(d, sample_size, replace = TRUE)))
  i = i + 1
}

barplot(means, 
        main="100 samples of 500",
        ylab = "Mean",
        col=ifelse(means < mean(d)-0.05 | means > mean(d)+0.05, "steelblue", "lightblue"),
        border = "lightblue")

barplot(sort(means), 
        main="100 samples of 500 sorted",
        ylab = "Mean",
        col=ifelse(sort(means) < mean(d)-0.05 | sort(means) > mean(d)+0.05, "steelblue", "lightblue"),
        border = "lightblue")
abline(h = mean(d), col="black", lty="dashed", lwd=1)

# save the data from the histogram *plot = FALSE*
h = hist(d, breaks = 100, plot = FALSE)

fill_colors = ifelse(h$breaks < mean(d)-1 | h$breaks > mean(d)+1, "steelblue", "lightblue")

hist(d,
     main = "",
     xlab = "",
     breaks = 100,
     col = fill_colors,
     border = "lightblue")
abline(v = mean(d), col="black", lty="dashed", lwd=1)

fill_colors = ifelse(h$breaks<mean(d), "seagreen", "steelblue")
border_colors = ifelse(h$breaks<mean(d), "lightgreen", "lightblue")

hist(d, 
     main = "",
     xlab = "",
     breaks = 100, 
     col=fill_colors,
     border=border_colors, 
     prob=TRUE)
lines(density(d))
abline(v = mean(d), col="black", lty="dashed", lwd=1)

plot(d,
     ylab = "Value",
     pch=21,
     bg=ifelse((d<mean(d)), "seagreen", "steelblue"),
     col=ifelse((d<mean(d)), "#2E8B5780", "#4682B480")
     )
abline(h=mean(d), col="black", lty="dashed", lwd=2)

