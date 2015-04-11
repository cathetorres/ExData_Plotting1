# Reading the data
df <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", 
                 colClasses = c("character", "character", rep("numeric", 7)), comment.char="")

#Converting date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting for date 2007-02-01 and 2007-02-02
df.subset <- df[df$Date == "2007-02-01" | df$Date== "2007-02-02", ]

# Plot 1
png(filename = "plot1.png", width=480, height=480)
hist(df.subset$Global_active_power, col= 2, main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()