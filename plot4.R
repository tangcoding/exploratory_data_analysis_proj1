data<-read.table("household_power_consumption.txt", sep=";",na.strings='?',header=TRUE,colClasses = "character")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

a<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
a$Global_active_power<-as.numeric(as.character(a$Global_active_power))
a$Time <- strptime(paste(a$Date,a$Time), "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))
with(a, { 
	plot(Time,Global_active_power,xlab="",ylab="Global Active Power",type="n")
	lines(Time,Global_active_power)
	plot(Time,Voltage,xlab="datetime",ylab="Voltage",type="n")	
	lines(Time,Voltage)
    with(a,{
         	plot(Time, Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
         	lines(Time, Sub_metering_1,col="black")
         	lines(Time, Sub_metering_2,col="red")
         	lines(Time, Sub_metering_3,col="blue")
         	legend("topright", lwd = 2, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
         })
	plot(Time, Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")	         
	lines(Time, Global_reactive_power)
})

dev.copy(png,"plot4.png")
dev.off()
