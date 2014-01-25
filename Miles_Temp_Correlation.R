library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
FullDS <- read.csv("~/Dropbox/R/CitiBike/FullDS.csv")

#Convert the date column to a date type
FullDS$Date <- as.Date(FullDS$Date, "%m/%d/%y")

a = ggplot(FullDS, aes(x=Temp, y=Miles))+ geom_point()
a <- a + geom_smooth()
a