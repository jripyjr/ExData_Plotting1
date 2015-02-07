# Get and load data for Electric Power Consumption
# Created by John Ripy on 2015/02/07

# Check if the file exists, if not, download and clean
# If it exists, load the data into a data frame
if(!file.exists('electric_power_consumption.csv')){
        
        # Download data
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        destFile <- "electric_power_consumption.zip"
        download.file(fileURL,
                      destfile = destFile
                      )
        
        #Let them know it may take a while to process
        message("Please be patient... this may take a few moments")
        
        # Get the name of the file in the zip
        fileName <- unzip(destFile,
                          list=TRUE
                          )
        fileName <- fileName$Name
        
        # Unzip the file
        unzip(destFile)
        
        # Delete the zip 
        file.remove(destFile)
        
        # Read data into a data frame, set the classes of the columns
        dfEPC <- read.table(fileName,
                            header=TRUE,
                            sep=';',
                            na.strings='?',
                            colClasses=c(rep('character', 2),
                                         rep('numeric',7)
                                         )
                            )
        
        # Delete the text file
        file.remove(fileName)
        
        # Convert dates and times
        dfEPC$DateTime <- strptime(paste(dfEPC$Date,
                                         dfEPC$Time,
                                         sep=" "
                                         ),
                                   "%d/%m/%Y %H:%M:%S"
                                   )
        
        # Subset the desired dates
        dfEPC <- subset(dfEPC,
                        dfEPC$DateTime$year == 107 & #Years since 1900
                        dfEPC$DateTime$mon == 1 & #Months start at 0
                        (dfEPC$DateTime$mday == 1 | dfEPC$DateTime$mday == 2)
                        )
        
        # Output a cleaned data file
        write.csv(dfEPC,
                  file = "electric_power_consumption.csv",
                  row.names=FALSE
                  )
} else {
        # Load data from the cleaned file
        dfEPC <- read.csv("electric_power_consumption.csv",
                          colClasses=c(rep('character', 2),
                                       rep('numeric',7),
                                       'character'                                       
                                       )
                          )
        
        # Make sure the DateTime is really DateTime
        dfEPC$DateTime <- strptime(dfEPC$DateTime,
                                   "%Y-%m-%d %H:%M:%S"
                                   )
}