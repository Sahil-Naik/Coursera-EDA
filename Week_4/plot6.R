SCC <- readRDS("Data/Source_Classification_Code.rds")
EMIT <- readRDS("Data/summarySCC_PM25.rds")
BALTI_DATA_F <- summarise(group_by(filter(EMIT, EMIT$fips=="24510" & type=="ON-ROAD"), year),
                          Emissions=sum(Emissions))
LA_DATA_F <- summarise(group_by(filter(EMIT, EMIT$fips=="06037" & type=="ON-ROAD"), year),
                          Emissions=sum(Emissions))

BALTI_DATA_F$County <- "Baltimore City, MD"
LA_DATA_F$County <- "Los Angeles County, CA"

BALTI_LA_EMIT <- rbind(BALTI_DATA_F, LA_DATA_F)
png("plot6.png", width=480, height=480)
ggplot(BALTI_LA_EMIT, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("Total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Baltimore City vs Los Angeles County Motor vehicle emission in tons"))+
  geom_label(aes(fill = County),colour = "yellow", fontface = "bold")
dev.off()