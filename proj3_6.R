dir()
setwd("C:/DB")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). 
# Baltimore City, Maryland (fips == "24510")
# Which city has seen greater changes over time in motor vehicle emissions?

subs_24510 <- NEI[NEI$fips == "24510",]
subs_06037 <- NEI[NEI$fips == "06037",]
vehicle_src <- SCC[grepl("Highway Vehicles", SCC$SCC.Level.Two),]

subs_vehicle_Baltimore <- subs_24510[(subs_24510$SCC %in% vehicle_src$SCC), ]
subs_vehicle_LosAngeles <- subs_06037[(subs_06037$SCC %in% vehicle_src$SCC), ]


counts_Baltimore <- tapply(subs_vehicle_Baltimore$Emissions, subs_vehicle_Baltimore$year, FUN=sum)
counts_LosAngeles <- tapply(subs_vehicle_LosAngeles$Emissions, subs_vehicle_LosAngeles$year, FUN=sum)

par(mfrow=c(2,1))

barplot(counts_Baltimore, main="Emissions from motor vehicle in Baltimore City", 
        xlab="YEAR", col=rainbow(5))

barplot(counts_LosAngeles, main="Emissions from motor vehicle in Los Angeles ", 
        xlab="YEAR", col=rainbow(5))

dev.copy(png, file= "plot6.png", units = "px", pointsize = 12  )
dev.off()


