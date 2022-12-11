# Reading files
NEI <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/Source_Classification_Code.rds")

# The total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008

png(file="C:/Users/dell/Desktop/exploratory_data_analysis/course project/plot1.png",
    width=480, height=480)
NEI_year <- as.data.frame.table(tapply(NEI$Emissions, NEI$year, FUN=sum))
colnames(NEI_year)<- c("Year", "Sum of emissions")
plot(NEI_year$Year, NEI_year$`Sum of emissions`, type="p", main = "PM2.5 emission from all sources for each 
of the years 1999, 2002, 2005, and 2008", xlab="YEAR", ylab = "Total PM2.5 emission (tons)")
dev.off()
