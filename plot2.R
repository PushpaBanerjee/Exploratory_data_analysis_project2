setwd("D:/data science course complete/Exploraty data analysis/project2")

# Load RDS
NEI <- readRDS("summarySCC_PM25.rds")
str(NEI)
#SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data for baltimore

baltimore <- subset(NEI, NEI$fips == "24510")


baltimoreSum <- tapply(baltimore$Emissions, baltimore$year, sum)

#Ploting the bar graph for baltimore
png("plot2.png")
barplot(baltimoreSum , xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Total Baltimore"~ PM[2.5] ~ "Emissions by Year"), 
        col="yellow")
dev.off()