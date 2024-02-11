x <- c(3, 5, 1, 10, 12, 6)
print(x[x > 0] <-  6)
print(x[x %in% 1:5] <- 0)
print(x[x < 6] <- 0)

print(x[x < 6])
print(x[x %in% 1:5])
print(x[x <= 5])
print(x[x!=6])

#how to read table
?read.csv()
?read.table()
DAT <- read.csv("quiz1_data/hw1_data.csv")
DAT1 <- read.table("quiz1_data/hw1_data.csv", header = TRUE, sep = ",")
DAT1


colnames(DAT)

DAT[152:153,]
class(DAT)
DAT.woNA <- complete.cases(DAT)

Ozone <- DAT[,1]
Ozone
DAT$Ozone
DAT$O
class(Ozone)
class(DAT$Ozone)
class(DAT$O)

#removing of NA, calculation of mean, and round
Ozone.NA <- is.na(Ozone)
print(round(mean(Ozone[!Ozone.NA]), digits = 1 ))

#subsetting data frames according to two condition and mean calculation
High.Ozone.Temp <- subset(DAT, Ozone > 31 & Temp > 90)
High.Ozone.Temp

DAT[which (DAT$Ozone > 31 & DAT$Temp > 90), ]

#subsetting according to one criterium and mean calculation
mean (High.Ozone.Temp$Solar.R, na.rm = TRUE)
mean (High.Ozone.Temp$Solar.R)
mean(DAT[which (DAT$Ozone > 31 & DAT$Temp > 90), ]$Solar.R)

mean(DAT[which (DAT$Month == 6), ]$Temp, na.rm = TRUE)

#stripped NA values before mean calculation
mean(DAT[which (DAT$Month == 6), ]$Ozone, na.rm = TRUE)
mean(DAT[which (DAT$Month == 6), ]$Ozone, na.rm = FALSE)

max(DAT[which (DAT$Month == 5), ]$Ozone, na.rm = TRUE)
