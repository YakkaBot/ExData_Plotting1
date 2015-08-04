
library(lubridate)
library(dplyr)

rawd <- read.table(skip = 66637,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  nrows = 2880,
                  file = "household_power_consumption.txt",
                  #header = TRUE,
                  sep = ";",
                  na.strings = "?",
                  stringsAsFactors = FALSE
                  )

# Create the datetime column by combining the date and time columns.
rawd <- mutate(.data = rawd, datetime = paste(rawd$Date, rawd$Time, sep = " "))

# Convert datetime data type to a date time object.
rawd$datetime <- dmy_hms(rawd$datetime)

# Plot Line Graph
plot (y=rawd$Global_active_power, x = rawd$datetime,
      type = "l", 
      ylab = "Global Active Power (kilowatts)",
      xlab = ""
      )

# Export to PNG
dev.copy(device = png, filename = 'plot2.png', width = 480, height = 480)
dev.off()

