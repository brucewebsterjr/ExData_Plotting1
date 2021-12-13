## Reformatting original dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data for the correct dates
data_sub <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Reformatting the date and time variables
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$datetime <- as.POSIXct(datetime)

## Creating the 2nd plot
plot(data_sub$Global_active_power~data_sub$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()