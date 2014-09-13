setwd("D:/data science course complete/Exploraty data analysis/project2")

library(ggplot2)
# Load RDS

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(SCC)


# Subsetting the data fOR Baltimore and LA
baltimore <- subset(NEI, NEI$fips == "24510")
LA <- subset(NEI, NEI$fips == "06037")

# Subsetting the SCC data including the words "Motor vehicle" in the short name into 'sub_car'

nums <- subset(SCC$SCC, grepl('Motor',SCC$Short.Name))


# subset all baltimore & LA emissions, where SCC is in nums
baltmotor <- subset(baltimore, baltimore$SCC %in% nums)
LAmotor <-subset(LA, LA$SCC %in% nums)

#sum up emissions data
baltdata <- tapply(baltmotor$Emissions, baltmotor$year, sum)
LAdata <- tapply(LAmotor$Emissions, LAmotor$year, sum)

# plot with 1-row, 2 cols
png("plot6.png", width=600, height=600)
par(mfrow = c(1,2))
barplot(baltdata, xlab = "Year", ylab=expression(~ PM[2.5] ~    "Emissions (tons)"), 
        main=expression("Baltimore" ~ PM[2.5] ~ "Vehicle Emissions"), col="Yellow")
barplot(LAdata, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Los Angeles" ~ PM[2.5] ~ "Vehicle Emissions"), col="orange")
dev.off()

