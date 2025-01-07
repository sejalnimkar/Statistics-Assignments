#' The Normal Distribution
#' Let X ~ Normal(mu, sigma^2)
#' When you want to obtain the CDF of X we use pnorm()
#' X ~ Normal(10, 16)
#' F(6) = P(X <= 6)
#' 

pnorm(q = 6, mean = 10, sd = sqrt(16))
#' P(2 < X <12)
#' F(12) - F(2)
pnorm(12, 10, 4) - pnorm(2, 10, 4)

#' The pdf of a normal is given by dnorm()
dnorm(x = 6, mean = 10, sd = 4)

#' To draw the pdf of a normal distribution
#' we can use the function curve() with dnorm()
#' 
curve(dnorm(x, mean = 10, sd = sqrt(16)))
curve(dnorm(x, mean = 10, sd = sqrt(16)), from = -6, to = 26)
curve(dnorm(x, mean = 12, sd = sqrt(16)), add = TRUE, col="red")
curve(dnorm(x, mean = 10, sd = sqrt(25)), add = TRUE, col="green")


#' Random generation obtained using rnorm()
rnorm(n = 100, mean = 10, sd = 4)

#' To replicate random generations, use a seed with
#' function set.seed()
#' 
set.seed(520) #any number will do
rnorm(n = 100, mean = 10, sd = 4)




#' The uniform distribution
punif(q = 2, min = 0, max = 4) #CDF
punif(2, 0, 4) - punif(1, 0, 4)

dunif(-1, 0 ,4)

punif(c(1,2), 0 ,4)

# [1] 0.25 0.50 these are the values of F(1) and F(2)