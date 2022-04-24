SCC <- readRDS("Data/Source_Classification_Code.rds")
EMIT <- readRDS("Data/summarySCC_PM25.rds")
BALTI_DATA <- EMIT[EMIT$fips=="24510",]
BALTI_TYPE_EMIT <- aggregate(Emissions ~ year+type, BALTI_DATA, sum)
png("plot3.png", width=480, height=480)
chart <- ggplot(BALTI_TYPE_EMIT, aes(year, Emissions, color = type))
chart <- chart + geom_line() + xlab("Year") + ylab(expression('Total Emissions')) + ggtitle('Total Baltimore Emissions [2.5]* From 1999 to 2008')
print(chart)
dev.off()