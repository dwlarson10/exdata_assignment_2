setwd("~/Desktop/exdata-data-NEI_data")
require(tidyr)
require(dplyr)
require(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIType <- tbl_df(NEI)%>%group_by(year,type)
sumYear <- summarise(NEIType,total=sum(Emissions))
balType <- ggplot(sumYear,aes(y=total,x=as.factor(year),fill=year))+geom_bar(stat = 'identity') + facet_grid(type~.)
ggsave(balType,file="plot3.png",width = 5, height = 4)