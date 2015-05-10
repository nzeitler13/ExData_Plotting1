require(ggplot2)
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
dat <- read.table("household_power_consumption.txt",sep = ";",nrows = 2879, skip = 66638)
head <-read.table("household_power_consumption.txt",sep = ";",nrows = 1, stringsAsFactors=FALSE)
names(dat) <- head
dat$count <- seq(0,2880,1)a <- ggplot(dat2, aes(count,y=value,color=variable))+geom_line(aes(y=Sub_metering_1, col="Sub_metering_1"))+geom_line(aes(y=Sub_metering_2, col="Sub_metering_2"))+geom_line(aes(y=Sub_metering_3, col="sub_metering_3"))
a <- a+xlab("")
a <- a+ylab("Energy sub metering")
a <- a+scale_x_discrete(breaks=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))
a <- a+theme(legend.position=c(.882,.86))
png("plot3.png",width=480, height=480)
a
dev.off
setwd("../")
