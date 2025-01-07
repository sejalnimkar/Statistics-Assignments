#' My first Rscript
#' 


a <- 3 # To assign a number to object "a", 
# we use "<-" a left arrow-like symbol

b = 5

#' ## Vectors
#' To create vectors we use the function "c()"
#' where c stands for concatenate


vec1 <- c(5, 6, 31, 24, 69, 56, 70)


c("house", "car", "pet")

#' ### Operations with vectors
#' 
#' 
sum(vec1)
mean(vec1)


vec1 + 3 #adds 3 component by component

vec1*3
vec1^2


#' Data frames (data sets)
#' R has already some data frames. To see them, use "data()"
data()

#' Let's work with data frame BOD
BOD

#' To select a variable use the dollar sigh "$"
#' 
#' 
x <- BOD$Time
sum(x)


