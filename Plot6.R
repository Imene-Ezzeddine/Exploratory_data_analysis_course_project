# Reading files
NEI <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/Source_Classification_Code.rds")


#Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?
png(file="C:/Users/dell/Desktop/exploratory_data_analysis/course project/plot6.png",
    width=480, height=480)
library(dplyr)
NEI_mv_comp <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
NEI_mv_comp_sum <- NEI_mv_comp %>% group_by(year, fips)%>%
  summarise(total_emissions = sum(Emissions))
library(ggplot2)
p <- ggplot(NEI_mv_comp_sum, aes(x= year, y= total_emissions, col = fips))+
  geom_point()+
  geom_line(linetype = "dashed")+
  theme_bw()
p
dev.off()
