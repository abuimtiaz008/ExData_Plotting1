epc<-read.table("household_power_consumption.txt",sep =";",na.strings ="?", nrows = 70000, skip = 1,
                col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric",
                               "numeric"))

epc1<-epc[epc$Date %in% c("1/2/2007","2/2/2007"),]

epc1$v<-paste(epc1$Date,epc1$Time)
epc1$v2<-strptime(epc1$v ,"%d/%m/%Y %T")


png(filename = "plot4.png")
par(mfrow = c(2,2))


plot(epc1$v2,epc1$Global_active_power, col = "Black",ylab="Global Active Power",type ="l" ,xlab ="")
plot(epc1$v2,epc1$Voltage, col = "Black",ylab="Voltage",type ="l" ,xlab ="datetime")
plot(epc1$v2,epc1$Sub_metering_1, col = "Black",ylab="Energy sub metering",type ="l" ,xlab ="")
lines(epc1$v2,epc1$Sub_metering_2, col ="red")
lines(epc1$v2,epc1$Sub_metering_3, col ="blue")
legend("topright", lwd = 1, col=c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2",
                                                                   "Sub_metering_3"))
plot(epc1$v2,epc1$Global_reactive_power, col = "Black",ylab="Global_reactive_Power",type ="l" ,xlab ="datetime")
dev.off()