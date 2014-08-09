#Plot1
data<-read.table("household_power_consumption.txt", sep=";",na.strings='?',header=TRUE,colClasses = "character")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

a<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
a$Global_active_power<-as.numeric(as.character(a$Global_active_power))
hist(a$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
