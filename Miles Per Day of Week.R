library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
library(plyr)
FullDS <- read.csv("~/Dropbox/R/CitiBike/FullDS.csv")

#Convert the date column to a date type
FullDS$Date <- as.Date(FullDS$Date, "%m/%d/%y")
FullDS$day <- weekdays(as.Date(FullDS$Date))

#Calculate the mean miles for each day of the week
mm <- ddply(FullDS, "day", summarise, mpd = mean(Miles))
mm$day<-factor(mm$day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
a <- ggplot(mm, aes(x=factor(day), y=mpd))
a <- a+geom_bar(stat = "identity")
a <- a+labs(title="Average Miles by Day of Week", x="Day of Week", y="Average Miles/Day")
a


tm <- ddply(FullDS, "day", summarise, mpd = mean(Trips))
tm$day<-factor(tm$day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
b <- ggplot(tm, aes(x=factor(day), y=mpd))
b <- b+geom_bar(stat = "identity")
b <- b+labs(title="Average Number of Trips by Day of Week", x="Day of Week", y="Average Trips/Day")
b

dm <- ddply(FullDS, "day", summarise, mpd = sum(Miles)/sum(Trips))
dm$day<-factor(dm$day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
c <- ggplot(dm, aes(x=factor(day), y=mpd))
c <- c+geom_bar(stat = "identity")
c <- c+labs(title="Average Length of Trips by Day of Week", x="Day of Week", y="Average Length(miles)")
c