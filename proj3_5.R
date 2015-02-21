dir()
setwd("C:/DB")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?
# Baltimore City, Maryland (fips == "24510")

subs_24510 <- NEI[NEI$fips == "24510",]
vehicle_src <- SCC[grepl("Highway Vehicles", SCC$SCC.Level.Two),]

subs_vehicle <- subs_24510[(subs_24510$SCC %in% vehicle_src$SCC), ]


counts <- tapply(subs_vehicle$Emissions, subs_vehicle$year, FUN=sum)

barplot(counts, main="Emissions from motor vehicle in Baltimore City", 
        xlab="YEAR", col=rainbow(5))

dev.copy(png, file= "plot5.png",width = 480, height = 480, units = "px", pointsize = 12  )
dev.off()


