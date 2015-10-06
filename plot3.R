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

##Draws initial plot with Sub_meterine_1
with(subsetdf, plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
##Adds Sub_metering_2 and Sub_metering_3
lines(subsetdf$Time, subsetdf$Sub_metering_2, col="red")
lines(subsetdf$Time, subsetdf$Sub_metering_3, col="blue")
##Adds legend
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)

##Creating PNG file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()