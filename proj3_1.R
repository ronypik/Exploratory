dir()
setwd("C:/DB")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008

str(NEI)

counts <- tapply(NEI$Emissions, NEI$year, FUN=sum)

barplot(counts, main="Total emissions from PM2.5", 
        xlab="YEARS",   col=rainbow(5))

dev.copy(png, file= "plot1.png",width = 480, height = 480, units = "px", pointsize = 12  )
dev.off()
