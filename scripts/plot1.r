# Create plot1
# Created by John Ripy on 2015/02/07

# Load data from cleaned file or download it if necessary
source("scripts/get_clean_data.r")

# Create device png
png(filename="plots/plot1.png",
    width=480,
    height=480,
    bg="transparent"
    )

# Create plot
hist(dfEPC$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red"
     )

# Roger says turn off the device
dev.off()