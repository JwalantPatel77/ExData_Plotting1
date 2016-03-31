## get the data from the file into memory
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
## filter the data as required
filtereddata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
## format the date and time as required
filtereddata$Date <- as.Date(filtereddata$Date,"%d/%m/%Y")
filtereddata<-cbind(filtereddata, "DateTime" = as.POSIXct(paste(filtereddata$Date, filtereddata$Time)))
## plot the line diagram
plot(filtereddata$Global_active_power ~ filtereddata$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")

