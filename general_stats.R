
# Data

set.seed(100)
x = rnorm(2000, mean = 1, sd = 2)
x1 = rnorm(2000, mean = 10, sd = 2)

# combine and get rid of the negatives
x2 = c(x, x1)
x3 = x2[x2>0]

# general stats
s = summary(x3)
r = range(x3)
stem(sample(x3,500))
t.test(x3)

ssize = 500
i = 0
q = sample(x3, ssize)
mean_list = mean(x3)

while (i < 100){
  q = cbind(q, sample(x3,ssize))
  mean_list = c(mean_list, mean(sample(x3,ssize,replace=TRUE)))
  i = i + 1
}

m = summary(as.factor(round(mean_list, 1)))
m = m / sum(m)
barplot(m, ylim = c(0, .25), 
        main="title",
        xlab="mean")

#par(family="Times New Roman")
#plot(mean_list, type="b", col="red")
#plot(mean_list, type="l", ylim = c(0,10))
barplot(mean_list, 
        main="100 samples of 500",
        col=ifelse(mean_list < mean(x3)-0.1 | mean_list > mean(x3)+0.1, "steelblue", "lightblue"),
        border = "lightblue")

barplot(sort(mean_list), 
        col=ifelse(sort(mean_list) < mean(x3)-0.1 | sort(mean_list) > mean(x3)+0.1, "steelblue", "lightblue"),
        border = "lightblue")
abline(h = mean(x3)-0.1, col="black", lty="dashed", lwd=3)
abline(h = mean(x3)+0.1, col="black", lty="dashed", lwd=3)

# save the data from the histogram *plot = FALSE*
h = hist(x3, breaks = 100, plot = FALSE)



####### Plotting ####### 

colors = ifelse(h$breaks<mean(x3), "seagreen", "steelblue")
colors2 = ifelse(h$breaks<mean(x3), "lightgreen", "lightblue")


hist(x3, 
     breaks = 100, 
     col=colors,
     border=colors2, 
     prob=TRUE)

lines(density(x3))
abline(v = mean(x3))

plot(x3,
     main = "Title",
     pch=21,
     bg=ifelse((x3>5), "seagreen", "steelblue"),
     col=ifelse((x3>5), "#2E8B5780", "#4682B480")
     )
















