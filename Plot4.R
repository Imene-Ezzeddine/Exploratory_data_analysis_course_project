# Reading files
NEI <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/Source_Classification_Code.rds")

#Across the United States, how have emissions from coal
#combustion-related sources changed from 1999, 2008?
png(file="C:/Users/dell/Desktop/exploratory_data_analysis/course project/plot4.png",
    width=480, height=480)
library(dplyr)
SCC_coal <- SCC[grep("Coal", SCC$Short.Name), ]
NEI_coal <- semi_join(NEI, SCC_coal, by="SCC")
NEI_coal_year <- as.data.frame.table(tapply(NEI_coal$Emissions, NEI_coal$year, FUN=sum))
colnames(NEI_coal_year)<- c("Year", "Sum of emissions")
plot(NEI_coal_year$Year, NEI_coal_year$`Sum of emissions`, type="p", main = "PM2.5 emission from coal-related combustion for each 
of the years 1999, 2002, 2005, and 2008", xlab="YEAR", ylab = "Total PM2.5 emission (tons)")
dev.off()
