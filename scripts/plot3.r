# Create plot3
# Created by John Ripy on 2015/02/07

# Load data from cleaned file or download it if necessary
source("scripts/get_clean_data.r")

# Create device png
png(filename="plots/plot3.png",
    width=480,
    height=480,
    bg="transparent"
)

# Create plot
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
                "Sub_metering_3"),
       col=c("black",
             "red",
             "blue"
             ), 
       lty="solid"
       )

# Roger says turn off the device
dev.off()