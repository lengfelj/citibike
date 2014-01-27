library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
FullDS <- read.csv("~/Dropbox/R/CitiBike/FullDS.csv")

#Convert the date column to a date type
FullDS$Date <- as.Date(FullDS$Date, "%m/%d/%y")

a = ggplot(FullDS, aes(x=Temp, y=Miles, colour=Temp))+ geom_point()
a <- a + scale_colour_gradient2(low="#0000CC", mid="#CCCCCC", high="#CC0000", midpoint=50)
a <- a + geom_smooth()
a <- a + labs(title = "Number of Miles per day vs. Average Daily Temperature", colour="Temp(F)")
a