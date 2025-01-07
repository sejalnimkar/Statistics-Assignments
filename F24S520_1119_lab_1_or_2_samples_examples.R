####
# GW05 exercise

films <- fivethirtyeight::fandango

View(films)


# 1. Experimental unit? A film
# 2. 1 or 2-sample problem? 1 sample problem
#    Number of e.u. drawn from this population? 80 films in the sample
# 3. How many measurements per e.u.? 4 measurements per e.u.
# 4. Hypotheses

# Rc, Ru, Mc, Mu
# X = abs(10*Mu - Mc) - abs(Ru - Rc)

# H_0: mu <= 0
# H_1: mu > 0

# EX = mu


# Complete the process...

#######

# Welchs'

# Profit of films that pass the Bechdel test vs those that fail the test
# Let's find evidence that films that fails are more profitable than
# films that pass

films2 <- fivethirtyeight::bechdel
View(films2)


# 1. Experimental unit? A film
# 2. 1 or 2-sample problem? 2 sample problem. Pop 1: Pass the Bechdel test. Pop 2. Fail.
#    Number of e.u. drawn from this population? 80 films for pop1 and 70 for pop 2.
# 3. How many measurements per e.u.? 3 measurements per e.u., budget, domgross, and intgross


# X_i  = (D_i+I_i) - B_i for i = 1, ..., 80
# Y_j  = (D_j+I_j) - B_j for j = 1, ... ,70

# EX_i = mu_1, EY_j = mu_2
# Delta = mu_1 - mu_2



# 4. Hypotheses about delta
# H_0: Delta  >= 0
# H_1: Delta <  0

summary(films2)
films2 <- na.omit(films2)
films2$binary <- as.factor(films2$binary) # to make the binary into a factor



set.seed(520)
index1 <- sample(1:744, 80, T)
index2 <- sample(1:856, 70, T)

# two subsets

films_pass <- subset(films2, subset = binary == "PASS")
films_fail <- subset(films2, subset = binary == "FAIL")

samp1 <- films_pass[index1,]
samp2 <- films_fail[index2,]

x <- (samp1$domgross_2013 + samp1$intgross_2013) - samp1$budget_2013
  
y <- (samp2$domgross_2013 + samp2$intgross_2013) - samp2$budget_2013

x
y

xbar <- mean(x)
ybar <- mean(y)
Deltahat <- xbar - ybar

s1 <- sd(x)
s2 <- sd(y)
n1 <- length(x)
n2 <- length(y)
se <- sqrt(sd(x)^2/length(x) + sd(y)^2/length(y))
t_test <- (Deltahat - 0)/se
t_test
nuhat <- (s1^2/n1 + s2^2/n2)^2/((s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1))
nuhat


p_value <- pt(t_test, nuhat)
p_value

# 0.1022678

# We fail to reject the null hypothesis
# The test is not statistically significant
# We do not have evidence to conclude the alternative
