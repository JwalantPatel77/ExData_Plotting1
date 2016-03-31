## get the data from the file into memory
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
## filter the data as required
filtereddata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
## format the date and time as required
filtereddata$Date <- as.Date(filtereddata$Date,"%d/%m/%Y")
filtereddata<-cbind(filtereddata, "DateTime" = as.POSIXct(paste(filtereddata$Date, filtereddata$Time)))
## plot the line diagram with with 2 rows and columns
par(mfrow=c(2,2))
##set the graph 1
plot(filtereddata$Global_active_power ~ filtereddata$DateTime, type="l")
##set the graph 2
plot(filtereddata$Voltage ~ filtereddata$DateTime, type="l")
##set the graph 3
with(filtereddata, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(filtereddata$Sub_metering_2 ~ filtereddata$DateTime, col = 'Red')
lines(filtereddata$Sub_metering_3 ~ filtereddata$DateTime, col = 'Blue')
##set the graph 4
plot(filtereddata$Global_reactive_power ~ filtereddata$DateTime, type="l")
