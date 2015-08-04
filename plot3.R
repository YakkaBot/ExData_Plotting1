
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
plot (x = rawd$datetime, y = rawd$Sub_metering_1,
      type = "n", ylab = "Energy sub metering", xlab = ""
      )

# Add Lines
lines (x = rawd$datetime, y = rawd$Sub_metering_1, type = "l")
lines (x = rawd$datetime, y = rawd$Sub_metering_2, type = "l", col = "red")
lines (x = rawd$datetime, y = rawd$Sub_metering_3, type = "l", col = "blue")

# Add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

# Export to PNG
dev.copy(device = png, filename = 'plot3.png', width = 480, height = 480)
dev.off()