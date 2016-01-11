Plot1 <- {
  x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
  y<-x[complete.cases(x),]
  y$Date <- as.Date(y$Date,format="%d/%m/%Y")
  y$Time <- strptime(paste(y$Date,y$Time,sep=","),format="%Y-%m-%d,%H:%M:%S")
  z<-subset(y,y$Date=="2007-02-01"|y$Date=="2007-02-02")
  
  par(mfrow=c(1,1))
  hist(z$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  
  dev.copy(png, file = "Plot1.png") 
  dev.off()
}