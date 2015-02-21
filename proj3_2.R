dir()
setwd("C:/DB")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question

subs_24510 <- NEI[NEI$fips == "24510",]

counts <- tapply(subs_24510$Emissions, subs_24510$year, FUN=sum)

barplot(counts, main="Total emissions from PM2.5 in the Baltimore City", 
        xlab="YEAR",   col=rainbow(5))


dev.copy(png, file= "plot2.png",width = 480, height = 480, units = "px", pointsize = 12  )
dev.off()


