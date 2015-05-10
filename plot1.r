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
dat <- read.table("household_power_consumption.txt",sep = ";",nrows = 2880, skip = 66637)
head <-read.table("household_power_consumption.txt",sep = ";",nrows = 1, stringsAsFactors=FALSE)
names(dat) <- head
dat$Times <-as.POSIXct(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

#make and save plot
png("plot1.png",width=480, height=480)
hist(dat$Global_active_power,main="Global Active Power", xlab= "Global Active Power(kilowatts)",ylab="Frequency", col = "red")
dev.off()
setwd("../")