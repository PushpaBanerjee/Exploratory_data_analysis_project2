setwd("D:/data science course complete/Exploraty data analysis/project2")

library(ggplot2)
# Load RDS

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(SCC)


# Subsetting the data from Baltimore
baltimore <- subset(NEI, NEI$fips == "24510")

# Subsetting the SCC data including the words "Motor vehicle" in the short name into 'sub_car'

nums <- subset(SCC$SCC, grepl('Motor',SCC$Short.Name))

# subset all baltimore emissions, where SCC is in nums
motor <- subset(baltimore, baltimore$SCC %in% nums)

#sum up emissions data
data <- tapply(motor$Emissions, motor$year, sum)

png("plot5.png")
barplot(data, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Baltimore" ~ PM[2.5] ~ "Motor Vehicle Emissions"), col="grey")
dev.off()