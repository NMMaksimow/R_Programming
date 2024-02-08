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


