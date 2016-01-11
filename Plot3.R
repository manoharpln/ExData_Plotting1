Plot3 <- {
  x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
  y<-x[complete.cases(x),]
  y$Date <- as.Date(y$Date,format="%d/%m/%Y")
  y$Time <- strptime(paste(y$Date,y$Time,sep=","),format="%Y-%m-%d,%H:%M:%S")
  z<-subset(y,y$Date=="2007-02-01"|y$Date=="2007-02-02")
  
  par(mfrow=c(1,1))
  with(z, plot(z$Time, z$Sub_metering_1, ylab="Energy Sub Metering",xlab="",type="n"))
  lines(z$Time,z$Sub_metering_1)
  lines(z$Time,z$Sub_metering_2,col="red")
  lines(z$Time,z$Sub_metering_3,col="blue")
  legend("topright", lty=c(1,1), col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  dev.copy(png, file = "Plot3.png") 
  dev.off()
}