#' ---
#' title: "Functions, WLLN, and CLT"
#' author: "Arturo Valdivia"
#' date: \today
#' ---
#' ------
#' 
#' The Law of Averages


#' box: Let's use -1 for Tails and 1 for Heads

box <- c(-1, 1)

# Simulation of 10000 coin tosses

vec <- sample(box, 10000, replace = TRUE)

# We can now create a vector with the cumulative sum of "heads"
# chance error =  half total # tosses - # heads
# for the cumulative # head we can use the function `cumsum()`
# for the # of tosses we can create a vector 1,2, ..., # tosses

]
n.heads <- cumsum(vec == 1)
n.heads[1:10]
vec[1:10]

n.tosses <- 1:10000

chance.error <- n.tosses/2 - n.heads

# we can then plot the difference using function `plot()`
# with `type = 'l'` to create a line

plot(chance.error, type = "l")


#' The Law of Averages talks about percentages or proportions
#' chance error in percentage = 50% - # heads/total # tosses

chance.error.perc = 0.5 - n.heads/n.tosses
plot(chance.error.perc, type = "l")
#' 
#' 
#' ## 2. Functions
#' 
#' Let's construct a function to add two numbers
#' 
#' 
my.sum = function(a,b) a+b

my.sum(3,5)

#' Let's construct a function to generate a random sample of n numbers 
#' from a normal distribution with mean=mu and variance=sigma2 and find the ratio $iqr/\sigma$
#' 
#' 
my.ratio = function(n = 100, mu = 0, sigma2 = 1){
  sigma = sqrt(sigma2)
  x = rnorm(n, mu, sigma)
  IQR(x)/sigma
}
my.ratio()
my.ratio(n = 50, mu = 10, sigma2 = 25)


#' ## Large vectors for the CLT and WLLN
#' Let's first create some vectors x1, x2, and x3
#' Well assume these vectors are the random variables we'll use later on
N = 10^4
set.seed(101)
x1 = rbinom(N, 40, .1)
x2 = c(rnorm(N/2, 10, 3), rnorm(N/2, 2, 1))
red = as.numeric(moderndive::bowl$color == "red")
x3 = sample(red, N, replace = T)
x4 = c(rep(0,1000),1)

plot(density(x1, bw = 0.5))
plot(density(x2))
plot(density(x3))
plot(density(x4))

#' -----------------------------------------------------------------------------
#' ## 2. A function to simulate the WLLN
#' Now, let's create a function to illustrate the WLLN (check slides)
#' The key component is getting many replications of the sample mean


#' we then obtain the probability of the sample mean to be in the interval
#' mu - epsilon, mu + epsilon
wlln = function (x, n, N = 10^4, epsilon = 0.1){
  xbar.vec = replicate(N, mean(sample(x, n, replace = T)))
  lb = mean(x) - epsilon # lower bound
  ub = mean(x) + epsilon
  prob = mean(xbar.vec >= lb & xbar.vec <= ub)
  print(data.frame(n = n, probability = round(prob,2)))
} 


#' Now we can use our function to check the law of large numbers
#' You can change the 4 arguments as needed; observe that the key argument
#' is 'n' as the large n is the higher the probability that the sample mean
#' is in the small interval


wlln(x = x1, n = 10)
wlln(x = x1, n = 10^2) 
wlln(x = x1, n = 10^3) 
wlln(x = x1, n = 10^4) 

#' -----------------------------------------------------------------------------
#' ## 3. The Central Limit Theorem (CLT)
#' 
#' ### Motivation
#' 
#' The sum and mean of 20 rolls of a six-sided fair die.

die <- 1:6
n <- 20

sum(sample(die, n, replace = TRUE))

# 10^4 replications of this experiment inside a vector
vec.sum <- replicate(10^4, sum(sample(die, n, replace = TRUE)))
hist(vec.sum, breaks = 50)

vec.mean <- replicate(10^4, mean(sample(die, n, replace = TRUE)))
hist(vec.mean, breaks = 50)
plot(density(vec.mean))


#' ### A function to simulate the CLT
#' 
#' Similar to our previous function, the key component is the object xbar.vec
#' In addition, the function finds mu, mu_Xbar, sigma, sigma_Xbar, and a histogram
#' 
clt = function(x, n, N = 10^4){
  xbar.vec = replicate(N, mean(sample(x, n, replace = T)))
  op = par(mfrow = c(1,3))
  hist(xbar.vec, breaks = 100, 
       xlim = c(min(x), max(x)),
       xlab = paste("Sample mean (Xbar_n)"))
  plot(density(xbar.vec))
  qqnorm(xbar.vec);qqline(xbar.vec)
  par(op)
}


#' Again, change the argument values, in particular change n to see how the 
clt(x = x2, n = 1)
clt(x = x2, n = 10)
clt(x = x2, n = 30)
clt(x = x2, n = 100)
