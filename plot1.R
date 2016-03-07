## assign variable for data file name
Data_File <- "household_power_consumption.txt"

## read data 
Data <- read.table(Data_File, header = TRUE, sep=";",stringsAsFactors=FALSE,dec=".")

## read subset data from 1/2/2007 - 2/2/2007 
Subset_Data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## convert global_active_power data into numeric and read into a vector
Global_Active_Power <- as.numeric(Subset_Data$Global_active_power)

## set plot file name 
png("plot1.png",width=500,height=500)

##output histogram into the plot file
hist(Global_Active_Power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()




