
library(lubridate)

rawd <- read.table(skip = 66636,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  nrows = 2880,
                  file = "household_power_consumption.txt",
                  #header = TRUE,
                  sep = ";",
                  na.strings = "?",
                  stringsAsFactors = FALSE
                  )

hist(x = rawd$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active power (kilowatts)")

# Export to PNG
dev.copy(device = png, filename = 'plot1.png', width = 480, height = 480)
dev.off()