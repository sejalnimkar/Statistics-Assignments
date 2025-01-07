# The binomial distribution in R

# The binomial distribution has four functions in R

dbinom() # PMF
pbinom() # CDF
rbinom() # random generation
qbinom() # The quantile (see CH 6)

# Y ~ binomial(n = 50, p = 0.8)

# P(Y = 30) = f(30)
dbinom(x = 30, size = 50, prob = 0.8)

dbinom(x = 40, size = 50, prob = 0.8)
# F(30) = P(X <= 30)
pbinom(q = 30, size = 50, prob = 0.8)

pbinom(q = 45, size = 50, prob = 0.8)
