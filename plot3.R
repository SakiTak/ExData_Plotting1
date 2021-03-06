# Coursera Course Project 1 for Exploratory Data Analysis March 2015
# R Code for Plot 3

# The dataset for the assignment can be downloaded from 
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#The assumption is that the dataset is available in the working directory 

# Read dataset 
data <- read.table("household_power_consumption.txt", header = TRUE,
                        sep = ";", stringsAsFactors=FALSE, na.strings = "?")

# Subset data for dates 2007-02-01 and 2007-02-02
newdata <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ),]

# Create a new date/time variable by combining date and time fields
newdata$DateTime <- paste(newdata$Date, newdata$Time)
DateTime <- strptime(newdata$DateTime, format="%d/%m/%Y %H:%M:%S")  

png("plot3.png")

#Open png device and write plot to it
plot(DateTime, newdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     type = "l", col = "gray", lwd = 3)

# Use lines() to add data to plot
lines(DateTime, newdata$Sub_metering_2, col = "red")
lines(DateTime, newdata$Sub_metering_3, col = "blue")

# Add legends to the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                col = c("gray", "red", "blue"), lwd = 2,
                pch = c("_","_","_"))  

par(mar = c(2,2,2,2))
dev.off()
