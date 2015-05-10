require(lattice)
## downlaod and craete the dataset for just means
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## check for presence of needed folder
if (!file.exists("exdata_data_household_power_consumption.zip")){
	setInternet2(use = TRUE)
	download.file(url, "exdata_data_household_power_consumption", method = "internal")
	unzip ("exdata_data_household_power_consumption")
	}
if (file.exists("data.zip")&!file.exists("UCI HAR Dataset")) unzip ("data.zip")
## read in all necessary data sets and return to main folder
setwd("exdata_data_household_power_consumption")
dat <- read.table("household_power_consumption.txt",sep = ";",nrows = 2879, skip = 66638)
head <-read.table("household_power_consumption.txt",sep = ";",nrows = 1, stringsAsFactors=FALSE)
names(dat) <- head
png("plot1.png",width=480, height=480)
histogram(dat$Global_active_power, type="count", col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency", main="Global Active Power", breaks = seq(0,8,.5), scales = list(y=list(at=seq(0,1200,200)), x=list(at=seq(0,6,2))))
dev.off
