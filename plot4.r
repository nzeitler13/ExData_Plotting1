require(ggplot)
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
## generate plot for sub metering
esm <- ggplot(dat2, aes(count,y=value,color=variable))+geom_line(aes(y=Sub_metering_1, col="Sub_metering_1"))+geom_line(aes(y=Sub_metering_2, col="Sub_metering_2"))+geom_line(aes(y=Sub_metering_3, col="sub_metering_3"))+xlab("")+ylab("Energy sub metering")+scale_x_discrete(breaks=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))+theme(legend.position=c(.882,.86))

## generate plot for global active power
gap <- <- ggplot(dat2, aes(count,y=value))+geom_line(aes(y=Global_active_power))+ylab("Global Active Power")+xlab("")+scale_x_discrete(breaks=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))

## generate plot for voltage
volt <- ggplot(dat2, aes(count,y=value))+geom_line(aes(y=Voltage))+ylab("Voltage")+xlab("")+scale_x_discrete(breaks=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))

## generate plot for global reaciive power
grp <- ggplot(dat2, aes(count,y=value))+geom_line(aes(y=Global_reactive_power))+ylab("Global Reactive Power")+xlab("")+scale_x_discrete(breaks=c(1,2880/2,2880), labels=c("Thu","Fri","Sat"))

## multiplot function taken from http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_%28ggplot2%29/
## all code from here until Otherwise stated is taken from this location and credit goes to Winston Chang...

#Multiple plot function

# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.

# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

## ... end multiplot function.  

png("plot4.png",width=480, height=480)
> multiplot(gap,esm,volt,gr, cols=2)
dev.off
setwd("../")
