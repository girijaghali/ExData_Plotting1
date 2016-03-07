## assign variable for data file name
Data_File <- "household_power_consumption.txt"

## read data 
Data <- read.table(Data_File, header = TRUE, sep=";",stringsAsFactors=FALSE,dec=".")

## read subset data from 1/2/2007 - 2/2/2007 
Subset_Data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Strptime - Date & time and assign
DateTime <-  strptime(paste(Subset_Data$Date, Subset_Data$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

## convert global_active_power data into numeric and read into a vector
Global_Active_Power <- as.numeric(Subset_Data$Global_active_power)

## convert sub_metering data into numeric and read into vector
Sub_Metering_1 <- as.numeric(Subset_Data$Sub_metering_1)
Sub_Metering_2 <- as.numeric(Subset_Data$Sub_metering_2)
Sub_Metering_3 <- as.numeric(Subset_Data$Sub_metering_3)

## set plot file name 
png("plot3.png", width=500, height=500)

##output plot into the plot file
plot(DateTime, Sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, Sub_Metering_2, type="l", col="red")
lines(DateTime, Sub_Metering_3, type="l", col="blue")

## set legend for the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()