# Reading files
NEI <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/Source_Classification_Code.rds")

#How have emissions from motor vehicle 
#sources changed from 1999, 2008 in Baltimore City?
png(file="C:/Users/dell/Desktop/exploratory_data_analysis/course project/plot5.png",
    width=480, height=480)
library(dplyr)
NEI_mv <- subset(NEI, fips=="24510" , type = "ON-ROAD")
NEI_mv_year <- as.data.frame.table(tapply(NEI_mv$Emissions, NEI_mv$year, FUN=sum))
colnames(NEI_mv_year)<- c("Year", "Sum of emissions")
plot(NEI_mv_year$Year, NEI_mv_year$`Sum of emissions`, type="p", main = "PM2.5 emission from Motor Vehicules for each 
of the years 1999, 2002, 2005, and 2008", xlab="YEAR", ylab = "Total PM2.5 emission (tons)")
dev.off()
