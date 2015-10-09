##Set personal working directory
##setwd("~/R/CourseraR4")

##read data into R
df = read.table("household_power_consumption.txt", header = T, sep=";", 
                comment.char="%", stringsAsFactors=FALSE, na.strings="?")

##Change time format
df$Time = strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

##Change date format
df$Date = as.Date(df$Date, "%d/%m/%Y")

##subset data for two days Feb 1 and 2 2007. 
subsetdf = subset(df, df$Date=="2007-02-01"|df$Date=="2007-02-02") 

##Creating PNG file
png(file="plot4.png", width=480, height=480)

##Set 2x2 plot
par(mfrow=c(2,2))

##Draws global active power plot
with(subsetdf, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

##Draws voltage plot
with(subsetdf, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

##Draws energy sub metering plot
with(subsetdf, plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
##Adds Sub_metering_2 and Sub_metering_3
lines(subsetdf$Time, subsetdf$Sub_metering_2, col="red")
lines(subsetdf$Time, subsetdf$Sub_metering_3, col="blue")
##Adds legend
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")

##Draws global reative power plot
with(subsetdf, plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reative_power"))

dev.off()