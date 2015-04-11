# Reading the data
df <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", 
                 colClasses = c("character", "character", rep("numeric", 7)), comment.char="")

#Converting date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting for date 2007-02-01 and 2007-02-02
df.subset <- df[df$Date == "2007-02-01" | df$Date== "2007-02-02", ]


# Plot 4
png(filename = "plot4.png", width=480, height=480)

par(mfcol= c(2,2))
plot(df.subset$Global_active_power, type="l", xlab= "", ylab="Global Active Power", axes= F, frame= T)
axis(1, at= seq(0, 2880, by= 1440), labels= c("Thu", "Fri", "Sat"))
axis(2)

with(df.subset, plot(df.subset$Sub_metering_1, type="l", xlab= "", ylab="Energy sub metering", axes= F, frame= T))
with(df.subset, lines(df.subset$Sub_metering_2, col= 2))
with(df.subset, lines(df.subset$Sub_metering_3, col= 4))
axis(1, at= seq(0, 2880, by= 1440), labels= c("Thu", "Fri", "Sat"))
axis(2)
legend("topright", lwd = 1, col = c(1, 2, 4), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex= 0.7)

plot(df.subset$Voltage, type="l", xlab= "datetime", ylab="Voltage", axes= F, frame= T)
axis(1, at= seq(0, 2880, by= 1440), labels= c("Thu", "Fri", "Sat"))
axis(2)

plot(df.subset$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power", axes= F, frame= T)
axis(1, at= seq(0, 2880, by= 1440), labels= c("Thu", "Fri", "Sat"))
axis(2)

dev.off()