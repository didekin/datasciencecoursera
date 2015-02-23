# Variables definition

rate <- 1/5
x_rmean <- 1/rate
x_rsd <- 1/rate
nosim <- 1000
size_samp <- 40

# One thousand samples of 40 random values each, are extracted from
# a exponential distribution. For each sample, its mean is
# calculated. With the resulting one thousand means, a histogram
# is plotted.

mfunc <- function(x, n) sqrt(n) * (mean(x) - x_rmean) / x_rsd
x = apply(
        matrix(
            rexp(nosim * size_samp,rate)
            ,nosim
        )
        , 1, mfunc, size_samp
    )

# We calculate the variance of the sample mean distribution:
x_mu <- mean(x)
x_mu
x_var <- sd(x)^2
x_var

# Histogram with frequencies.
hist(x,breaks=40,main="Histogram of simulated normalized sample
     means")
abline(v=x_mu,col="blue",lty=1,lwd=3)
# Histogram with densities.
hist(x,breaks=40,prob=T,main="Histogram of simulated normalized
     sample means and density estimate")
lines(density(rnorm(100000,0,1)),col="red",lwd=3)
abline(v=0,col="red",lty=2,lwd=3)

# QQplot of the simulated sample means.
qqnorm(x,main="QQPlot of the simulated sample means")
qqline(x,col="red",lwd=2)
