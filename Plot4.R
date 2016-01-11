Plot4 <- {
  x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
  y<-x[complete.cases(x),]
  y$Date <- as.Date(y$Date,format="%d/%m/%Y")
  y$Time <- strptime(paste(y$Date,y$Time,sep=","),format="%Y-%m-%d,%H:%M:%S")
  z<-subset(y,y$Date=="2007-02-01"|y$Date=="2007-02-02")
  
  par(mfrow=c(2,2))
  plot(z$Time,z$Global_active_power,xlab="",ylab="Global Active Power",pch=20)
  lines(z$Time,z$Global_active_power)
  plot(z$Time,z$Voltage,ylab="Voltage",xlab = "datetime")
  lines(z$Time,z$Voltage)
  with(z, plot(z$Time, z$Sub_metering_1, ylab="Energy Sub Metering",xlab=""))
  lines(z$Time,z$Sub_metering_1)
  lines(z$Time,z$Sub_metering_2,color="red")
  lines(z$Time,z$Sub_metering_3,color="blue")
  legend("topright", lty=c(1,1), col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(z$Time,z$Global_reactive_power,ylab="Global_reactive_power",xlab = "datetime")
  
  dev.copy(png, file = "Plot1.png") 
  dev.off()
  
  dev.copy(png, file = "Plot4.png") 
  dev.off()
}