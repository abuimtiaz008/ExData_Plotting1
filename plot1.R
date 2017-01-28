epc<-read.table("household_power_consumption.txt",sep =";",na.strings ="?", nrows = 70000, skip = 1,
                col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric",
                               "numeric"))

epc1<-epc[epc$Date %in% c("1/2/2007","2/2/2007"),]
png(filename = "plot1.png")
hist(epc1$Global_active_power, col = "Red",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
#title()
dev.off()