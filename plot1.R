######################################################################################
#plot1.R                                                                             #
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

#Plot1
hist(hpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
