## get the data from the file into memory
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
## filter the data as required
filtereddata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
## format the date and time as required
filtereddata$Date <- as.Date(filtereddata$Date,"%d/%m/%Y")
filtereddata<-cbind(filtereddata, "DateTime" = as.POSIXct(paste(filtereddata$Date, filtereddata$Time)))
## plot the line diagram with Legend
with(filtereddata, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
##add additional lines
lines(filtereddata$Sub_metering_2 ~ filtereddata$DateTime, col = 'Red')
lines(filtereddata$Sub_metering_3 ~ filtereddata$DateTime, col = 'Blue')
## add legend
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
