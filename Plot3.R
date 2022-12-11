# Reading files
NEI <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Desktop/exploratory_data_analysis/Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 
# 1999, 2008 for Baltimore City?
png(file="C:/Users/dell/Desktop/exploratory_data_analysis/course project/plot3.png",
    width=680, height=480)
NEI_baltimore <- subset(NEI, fips == "24510")
library(dplyr)
NEI_baltimore_type <- NEI_baltimore %>% group_by(year, type)%>%
  summarise(total_emissions = sum(Emissions))
library(ggpubr)
pt <- subset(NEI_baltimore_type, type=="POINT")
npt <- subset(NEI_baltimore_type, type=="NONPOINT")
ort <- subset(NEI_baltimore_type, type=="ON-ROAD")
nrt <- subset(NEI_baltimore_type, type=="NON-ROAD")
#plot point type
library(ggplot2)
dp1 <-ggplot(pt, aes(x = year, y = total_emissions))+
  geom_point()+
  theme_bw()+
  scale_x_continuous(breaks=seq(1990,2008,3))+
  ggtitle("Point type total emission")
dp1
dp2 <-ggplot(npt, aes(x = year, y = total_emissions))+
  geom_point()+
  theme_bw()+
  scale_x_continuous(breaks=seq(1990,2008,3))+
  ggtitle("Non-point type total emission")
dp2
dp3 <-ggplot(ort, aes(x = year, y = total_emissions))+
  geom_point()+
  theme_bw()+
  scale_x_continuous(breaks=seq(1990,2008,3))+
  ggtitle("On road type total emission")
dp3
dp4 <-ggplot(nrt, aes(x = year, y = total_emissions))+
  geom_point()+
  theme_bw()+
  scale_x_continuous(breaks=seq(1990,2008,3))+
  ggtitle("NOn road type total emission")
dp4
ggarrange(dp1, dp2, dp3, dp4,
          ncol = 2, nrow = 2)
dev.off()
