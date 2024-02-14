#Week 1. Quiz
getwd()
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

#Week 2. Assignment for quiz

#part 1.vers1 pollutant mean
pollutantmean1 <- function(directory, pollutant, id=1:332) { 
  
  # Create a list of files in the directory argument
  files_list <- list.files(directory, full.names = TRUE) 
  df <- data.frame() #creates an empty data frame
  
  # Loop through the files, rbinding them together
  for (i in id) {
    df <- rbind(df, read.csv(files_list[i]))
  }
  
  # Subset the column that matches the 'pollutant'  argument
  df_subset <- df[,pollutant] 
  
  # Calculate the mean value
  mean(df_subset, na.rm = TRUE) 
}
#part 1.vers2. pollutant mean

pollutantmean2 <- function(directory, pollutant, id = 1:332){
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  values <- numeric()
  
  for (i in id) {
    data <- read.csv(filelist[i])
    values <- c(values, data[[pollutant]])
  }
  mean(values, na.rm = TRUE)
}

#function check
pollutantmean2("specdata", "sulfate")

#part 2. calculating complete cases

complete <- function(directory, id = 1:332){
  files_list <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  nobs <- numeric()
  
  for(i in id) {
    data <- read.csv(files_list[i])
    nobs <- c(nobs, sum(complete.cases(data)))
  }
  
  data.frame(id, nobs)
}

#function check:
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

#part 3. correlation between sulfate and nitrate
corr <- function(directory, threshold = 0) {
  id = 1:332
  filename <- list.files(directory, full.names = TRUE)
  
  result <-vector(mode="numeric", length=0)
  
  for(i in seq(filename)) {
    airquality <- read.csv(filename[i])
    good <- complete.cases(airquality)
    airquality <- airquality[good, ]
    if (nrow(airquality) > threshold) {
      # We need [[]] around pollutant instead of [] since airquality["sulfate"]
      # is a data.frame but we need a vector here. Hence, [[]]. Please note thatusing either
      #[[]] or [] gives the same results as the test cases
      correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
      result <- append(result, correlation)
      #print(correlation)
    }
  }
  result
}

#function check
cr <- corr("specdata", threshold = 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)

#Quiz week 3
pollutantmean2("specdata", "sulfate", 1:10)
pollutantmean2("specdata", "nitrate", 70:72)
pollutantmean2("specdata", "sulfate", 34)
pollutantmean2("specdata", "nitrate")

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
