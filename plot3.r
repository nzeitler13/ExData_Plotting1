url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## check for presence of file or zip file
if (!file.exists("exdata_data_household_power_consumption.zip")and !file.exists("exdata_data_household_power_consumption")){
	setInternet2(use = TRUE)
	download.file(url, "exdata_data_household_power_consumption", method = "internal")
	unzip ("exdata_data_household_power_consumption")
	}
## extracts file is zip is present but file is not
	if (file.exists("exdata_data_household_power_consumption.zip")&!file.exists("exdata_data_household_power_consumption")) unzip ("exdata_data_household_power_consumption.zip")
## read desired data into data frame
setwd("exdata_data_household_power_consumption")
dat <- read.table("household_power_consumption.txt",sep = ";",nrows = 2880, skip = 66637)
head <-read.table("household_power_consumption.txt",sep = ";",nrows = 1, stringsAsFactors=FALSE)
names(dat) <- head
dat$Times <-as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")


png("plot3.png",width=480, height=480)

plot(dat$Times,dat$Sub_metering_1, type="l", ylab="Energy Sub Metering",xlab='', axes=F, col = "black")
par(new=T)
plot(dat$Times,dat$Sub_metering_2, type="l", xlab='',ylab='', axes=F, col = "red", ylim=range(c(0,max(dat$Sub_metering_1))))
par(new=T)
plot(dat$Times,dat$Sub_metering_3, type="l",xlab='', ylab='', axes=F, col = "blue", ylim=range(c(0,max(dat$Sub_metering_1))))
par(new=T)

axis(1,at=c(as.integer(dat$Times[1]),as.integer(dat$Times[2880/2]),as.integer(dat$Times[2880])),labels=c("Thu","Fri","Sat"))
axis(2)
box()
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()
setwd("../")
