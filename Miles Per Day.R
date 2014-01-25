library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
FullDS <- read.csv("~/Dropbox/R/CitiBike/FullDS.csv")

#Convert the date column to a date type
FullDS$Date <- as.Date(FullDS$Date, "%m/%d/%y")



#Simple line plot of miles per day
a <- ggplot(FullDS, aes(x=Date, y=Miles))
a <- a+geom_line()
a <- a+ geom_smooth()
a