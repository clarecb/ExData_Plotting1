##Set personal working directory
##setwd("~/R/CourseraR4")

df = read.table("household_power_consumption.txt", header = T, sep=";", 
                comment.char="%", stringsAsFactors=FALSE, na.strings="?")

##Change date format
df$Date = as.Date(df$Date, "%d/%m/%Y")

##subset data for two days Feb 1 and 2 2007. 
subsetdf = subset(df, df$Date=="2007-02-01"|df$Date=="2007-02-02") 

##Draws initial histogram
with(subsetdf, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))

##Creating PNG file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
