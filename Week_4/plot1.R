SCC <- readRDS("Data/Source_Classification_Code.rds")
EMIT <- readRDS("Data/summarySCC_PM25.rds")
EMISSION_YEAR <- aggregate(Emissions ~ year, EMIT, sum)
png("Plot1.png", width=480, height=480)
barplot(height=EMISSION_YEAR$Emissions/1000, names.arg = EMISSION_YEAR$year, xlab = "Year",
        ylab = expression("Aggregated Emissions"),
        main = expression("Aggregated PM'[2.5]*' Emmissions by Year"))
dev.off()
