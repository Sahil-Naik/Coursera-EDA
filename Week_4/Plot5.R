SCC <- readRDS("Data/Source_Classification_Code.rds")
EMIT <- readRDS("Data/summarySCC_PM25.rds")
BALTI_DATA <- EMIT[EMIT$fips=="24510",]
png("plot5.png", width=480, height=480)
chart3 <- ggplot(BALTI_TYPE_EMIT, aes(factor(year), Emissions))
chart3 <- chart3 + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total Emissions')) +
  ggtitle('Baltimore Motor Vehicle PM[2.5] Emissions From 1999 to 2008')
print(chart3)
dev.off()