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

##Draws initial plot
with(subsetdf, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

##Creating PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()