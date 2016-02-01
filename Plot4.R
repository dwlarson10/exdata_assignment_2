
setwd("~/Desktop/exdata-data-NEI_data")
require(dplyr)
require(tidyr)
require(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

NEI <- tbl_df(NEI)%>%group_by(year)
merge <- tbl_df(merge(x=NEI, y=SCC.coal, by='SCC'))%>%group_by(year)
sumYear <- summarise(merge,total=sum(Emissions))
Coalplot<- ggplot(sumYear,aes(y=total,x=as.factor(year),fill=year))+geom_bar(stat = 'identity')
ggsave(Coalplot,file="plot4.png",width = 5, height = 4)
