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

## convert global_active_power data into numeric and read into a vector
Global_Reactive_Power <- as.numeric(Subset_Data$Global_reactive_power)

## convert global_active_power data into numeric and read into a vector
Voltage <- as.numeric(Subset_Data$Voltage)

## convert sub_metering data into numeric and read into vector
Sub_Metering_1 <- as.numeric(Subset_Data$Sub_metering_1)
Sub_Metering_2 <- as.numeric(Subset_Data$Sub_metering_2)
Sub_Metering_3 <- as.numeric(Subset_Data$Sub_metering_3)

## set plot file name and divide it into 4 
png("plot4.png", width=500, height=500)
par(mfrow = c(2,2))

##output plot1 into the plot file
plot(DateTime,Global_Active_Power,type="l", xlab="", ylab="Global Active Power", cex=0.2)

##output plot2 into the plot file
plot(DateTime, Voltage, type="l", xlab="DateTime", ylab="Voltage")

##output plot3 into the plot file
plot(DateTime, Sub_Metering_1, type="l", ylab="Energy Sub_Metering", xlab=" ")
lines(DateTime,Sub_Metering_2, type="l", col="red")
lines(DateTime,Sub_Metering_3, type="l", col="blue")

## set legend for the plot3
legend("topright",c("Sub_Metering_1","Sub_Metering_2", "Sub_Metering_3"), lty=,lwd=2.5, col=c("black","red","blue"),bty="o")

##output plot4 into the plot file
plot(DateTime,Global_Reactive_Power, type="l", xlab="DateTime", ylab="Global_Reactive_Power")

dev.off()

