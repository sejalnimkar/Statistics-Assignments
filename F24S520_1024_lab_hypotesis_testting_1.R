sigma <-  2.5
n <- 150
test.st <- (15.3 - 15)/(sigma/sqrt(n))
test.st

# from city traffic office perspective
# P(Xbar_n > 15.3)
1- pnorm(test.st)


# When sigma is unknown

s <- 2.5
test.st <- (15.3 - 15)/(s/sqrt(n))
test.st

1 - pt(test.st, df = 150 - 1)
