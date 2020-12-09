
dev.off()
set.seed(100)
x = rnorm(4000, mean=4, sd=2)
x1 = rnorm(4000, mean=10, sd=1)

plot(x, x1, col="steelblue", pch=20)
plot(x1, x, col="steelblue", pch=20)

hist(x, col="steelblue")
hist(x1, col="steelblue")

xstats = gstats(x)
x1stats = gstats(x1)

cov(x, x1)
cor(x, x1)

model = lm(x ~ x1)
model
plot(model)

fplots(x)
fplots(x1)
