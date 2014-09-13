setwd("D:/data science course complete/Exploraty data analysis/project2")

library(ggplot2)
# Load RDS

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#head(SCC)


#all coal IDs
nums <- subset(SCC$SCC, grepl("[Cc]oal", SCC$Short.Name))

#subset all NEI obs. where NEI$SCC is in nums
coal <- subset(NEI, NEI$SCC %in% nums)

#sum emissions
data <- tapply(coal$Emissions, coal$year, sum)

png("plot4.png")
barplot(data/1000, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions in '000 tons"), 
        main=expression("Total US"~ PM[2.5] ~ "Coal Emissions by Year"), col="blue")
dev.off()