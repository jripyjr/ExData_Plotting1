# Create plot2
# Created by John Ripy on 2015/02/07

# Load data from cleaned file or download it if necessary
source("scripts/get_clean_data.r")

# Create device png
png(filename="plots/plot2.png",
    width=480,
    height=480,
    bg="transparent"
)

# Create plot
plot(dfEPC$DateTime,
     dfEPC$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l"
     )

# Roger says turn off the device
dev.off()