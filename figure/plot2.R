# Reading the data
df <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", 
                 colClasses = c("character", "character", rep("numeric", 7)), comment.char="")

#Converting date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting for date 2007-02-01 and 2007-02-02
df.subset <- df[df$Date == "2007-02-01" | df$Date== "2007-02-02", ]

# Plot 2
png(filename = "plot2.png", width=480, height=480)
plot(df.subset$Global_active_power, type="l", xlab= "", ylab="Global Active Power (kilowatts)", axes= F, frame= T)
axis(1, at= seq(0, 2880, by= 1440), labels= c("Thu", "Fri", "Sat"))
axis(2)
dev.off()