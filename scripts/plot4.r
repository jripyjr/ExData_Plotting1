# Create plot4
# Created by John Ripy on 2015/02/07

# Load data from cleaned file or download it if necessary
source("scripts/get_clean_data.r")

# Create device png
png(filename="plots/plot4.png",
    width=480,
    height=480,
    bg="transparent"
)

# Create plot
# Make quads
par(mfrow=c(2,2))

# Top left
plot(dfEPC$DateTime,
     dfEPC$Global_active_power,
     ylab="Global Active Power",
     xlab="",
     type="l"
     )

# Top right
plot(dfEPC$DateTime,
     dfEPC$Voltage,
     xlab="datetime",
     ylab="Voltage",
     type="l"
     )

# Bottom left
plot(dfEPC$DateTime,
     dfEPC$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering"
     )
lines(dfEPC$DateTime,
      dfEPC$Sub_metering_2,
      col="red"
      )
lines(dfEPC$DateTime,
      dfEPC$Sub_metering_3,
      col="blue"
      )
legend("topright", 
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"
                ),
       col=c("black",
             "red",
             "blue"), 
       lty="solid",
       bty="n"
       )

# Bottom right
plot(dfEPC$DateTime,
     dfEPC$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l"
     )

# Roger says turn off the device
dev.off()