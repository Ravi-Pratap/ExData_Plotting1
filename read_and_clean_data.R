
# 
# This Course: Exploratory Data Analysis: Plotting
# Read_and_clean_data.R
# Ravinendra Pratap
# Submission date 18.11.2018



read_and_clean_data <- function() {

#Loading chron package to use for time below.
library(chron)

#Readding data into data frame object named data from file named household_power_consumption.txt
data<-read.table(file="household_power_consumption.txt",head=TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
head(data)


# Date Period is 2007-02-01 and 2007-02-02.
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Removing: cases/records with ?
data <- data[!apply(data, 1, function(x) {any(x == "?")}),]

#Convert character data imported as character to the correct data types
#Because ? symbol stopped setting data types on read of numeric data type
#Therefore imported as character
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time <- chron(times=data$Time)
data$Global_active_power<-as.numeric(data$Global_active_power) 
data$Global_reactive_power<-as.numeric(data$Global_reactive_power) 
data$Voltage<-as.numeric(data$Voltage) 
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)


#Printing file to test to confirm correct data captured.
#Comparing Input file Feb 1 & 2 2007 records when I opened with Notepad++.
#Write.table(data,"household_power_consumption_data_for_Feb_1and2_2007.txt")

assign("data",data,envir = .GlobalEnv)


}

