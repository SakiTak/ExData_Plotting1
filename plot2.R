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

#Open png device and write plot to it
png("plot2.png")

# Plot the graph
plot(DateTime, newdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", 
                        type = "l")

par(mar = c(2,2,2,2))
dev.off()
