require(lattice)
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
dat$count <- seq(0,2880,1)

## generate and print out the plot
png("plot2.png",width=480, height=480)
xyplot(Global_active_power~count,data=dat2, type="l",ylab="Global Active Power(kilowatts)", xlab="", scales=list(x=list(at=c(0,2880/2,2880), labels=c("Thu","Fri","Sat"))))
dev.off
## return to main user directory
setwd("../")