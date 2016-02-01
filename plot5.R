setwd("~/Desktop/exdata-data-NEI_data")
require(dplyr)
require(tidyr)
require(ggplot2)



## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

MD.onroad <- subset(NEI, (fips == '24510') & type == 'ON-ROAD')
CA.onroad <- subset(NEI, (fips == '06037') & type == 'ON-ROAD')
both.onroad <- rbind(MD.onroad,CA.onroad)


onRoad<- tbl_df(both.onroad)%>%group_by(year,fips)
sumYear <- summarise(onRoad,total=sum(Emissions))
MDCAMV<- ggplot(sumYear,aes(y=total,x=factor(year),fill=year))+geom_bar(stat = 'identity')+facet_grid(fips~.)
ggsave(MDCA,file="plot5.png",width = 5, height = 4)