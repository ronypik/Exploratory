dir()
setwd("C:/DB")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

coal_src <- SCC[grepl("Coal", SCC$SCC.Level.Three),]


subs_Coal <- NEI[(NEI$SCC %in% coal_src$SCC), ]

counts <- tapply(subs_Coal$Emissions, subs_Coal$year, FUN=sum)

barplot(counts, main="Emissions from coal combustion-related sources across the US", 
        xlab="YEAR", col=rainbow(5))

dev.copy(png, file= "plot4.png",width = 680, height = 680, units = "px", pointsize = 12  )
dev.off()


