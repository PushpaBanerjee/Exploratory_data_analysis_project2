setwd("D:/data science course complete/Exploraty data analysis/project2")

library(ggplot2)
# Load RDS

NEI <- readRDS("summarySCC_PM25.rds")

#SCC <- readRDS("Source_Classification_Code.rds")

#subsetting and modifying the data veriables

baltimore <- subset(NEI, NEI$fips == "24510")
baltimore$year <- as.factor(baltimore$year)
baltimore$type <- as.factor(baltimore$type)

# Plotting the bargraph by adding layer

png("plot3.png")
plot3 <- ggplot(baltimore, aes(year,Emissions)
plot3 <- plot3 + geom_bar(stat="identity")
plot3 <- plot3 + labs(y=expression(~ PM[2.5] ~ "Emissions (tons)"))
plot3 <- plot3 + labs(title=expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year and Type"))
plot3 <- plot3 + facet_grid(. ~ type)
plot3
dev.off()