######################################################################################
#plot3.R                                                                             #
#Assume dataset downloaded to ~Working_dir/data_hpc/household_power_consumption.txt  #
######################################################################################
#Dataset dir
dataset_dir <- "data_hpc"
data_file <- paste(dataset_dir, "/household_power_consumption.txt", sep = "")

# All data of household power consumption 
all_hpc <- read.csv(data_file, header=T, sep=';', na.strings="?", 
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset data to get 2 days of data
all_hpc$Date <- as.Date(all_hpc$Date, format="%d/%m/%Y")
hpc <- subset(all_hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

# Convert dates
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)

#plot 3
with(hpc, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.6)

# Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()