dir()
setwd("C:/DB")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

subs_24510 <- NEI[NEI$fips == "24510",]
str(subs_24510)

library(ggplot2)

ggplot(data=subs_24510,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="darkgrey") +
facet_wrap(~type, scales ="free_y")+
theme(axis.text.x = element_text(angle=45, hjust =1))+
labs(x="year") + 
labs(title=expression("Emissions from 1999–2008 for Baltimore City by source"))


dev.copy(png, file= "plot3.png",width = 480, height = 480, units = "px", pointsize = 12  )
dev.off()



