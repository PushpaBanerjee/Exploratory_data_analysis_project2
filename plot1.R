setwd("D:/data science course complete/Exploraty data analysis/project2")
library(plyr)

# Load RDS
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
#SCC <- readRDS("Source_Classification_Code.rds")

#summary

data <- tapply(NEI$Emissions, NEI$year, sum)

#Plotting the data 
png("plot1.png")
barplot(data/1000, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions in '000 tons"), 
        main=expression("Total US"~ PM[2.5] ~ "Emissions by Year"), col="orange")
dev.off()