#Settings & sessionInfo

?version
sessionInfo()
getwd()
Sys.setenv(LANG = "en")
Sys.getenv()

#Different kinds of objects

a <- c(1, 4, 8)
b <- vector()
c <- a*b
x <- 1/Inf

#Swirl
install.packages("swirl")
packageVersion("swirl")
library(swirl)
ls()
rm(list=ls())

swirl()
install_from_swirl("R Programming")

#R is one-based indexing language NB!

#Operations on directories
?dir.exists()
?dir.create()
?dir()
?unlink()
?list.dirs()

#& versus &&, | versus ||
TRUE & c(TRUE, TRUE, TRUE)
TRUE & c(FALSE, FALSE, TRUE)
TRUE && c(FALSE, FALSE, TRUE)

#logical functions
isTRUE(FALSE)
identical(TRUE, FALSE)
xor(TRUE, 6 == 6)
xor(FALSE, TRUE)
which(c(TRUE, FALSE, TRUE))
any(TRUE, FALSE, FALSE)
all(TRUE, TRUE, FALSE)
all(TRUE, TRUE, TRUE)

#functions can be passed as arguments to another function

my_function <- function(my_vector){
  sum(my_vector)/length(my_vector)
}
args(my_function) #returns arguments that can be passed to the function
