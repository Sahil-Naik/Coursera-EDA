SCC <- readRDS("Data/Source_Classification_Code.rds")
EMIT <- readRDS("Data/summarySCC_PM25.rds")
BALTI_DATA <- EMIT[EMIT$fips=="24510",]
BALTI_E_YEAR <- aggregate(Emissions ~ year, BALTI_DATA, sum)
png("plot2.png", width = 480, height = 480)
barplot(height=BALTI_E_YEAR$Emissions/1000, names.arg = BALTI_E_YEAR$year, xlab = "Year",
        ylab=expression("Aggregated Emission"),
        main = expression("Baltimore Aggregated PM'[2.5]*' Emmissions by Year"))
dev.off()