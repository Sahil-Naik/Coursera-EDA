SCC <- readRDS("Data/Source_Classification_Code.rds")
EMIT <- readRDS("Data/summarySCC_PM25.rds")
BALTI_DATA <- EMIT[EMIT$fips=="24510",]
png("plot4.png", width = 480, height = 480)
chart1 <- ggplot(BALTI_TYPE_EMIT, aes(factor(year), Emissions))
chart1 <- chart + geom_bar(stat="identity") +
  xlab("Year") +  
  ylab(expression('Total Emissions')) +
  ggtitle('Total [2.5]* Coal Emissions From 1999 to 2008')
print(chart1)
dev.off()