#setwd("ExData_Plotting1")
filename <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")[Date == "1/2/2007" | Date == "2/2/2007",]
dim(data) 
## We only need data of 2 days.
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
newData <- data[subset, ]
rm(data)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData) # 2880   10
attach(newData)
