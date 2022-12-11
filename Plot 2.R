# Reading files
NEI <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in
#the Baltimore City, Maryland from 1999 to 2008?
png(file="C:/Users/dell/Desktop/exploratory_data_analysis/course project/plot2.png",
    width=480, height=480)
NEI_baltimore <- subset(NEI, fips == "24510")
NEI_baltimore_year <- as.data.frame.table(tapply(NEI_baltimore$Emissions,
                                                 NEI_baltimore$year, FUN=sum))
colnames(NEI_baltimore_year)<- c("Year", "Sum of emissions")
plot(NEI_baltimore_year$Year, NEI_baltimore_year$`Sum of emissions`, type="p", main = "PM2.5 emission from all sources for each 
of the years 1999, 2002, 2005, and 2008 in Baltimore City", xlab="YEAR", ylab = "Total PM2.5 emission (tons)")
dev.off()
