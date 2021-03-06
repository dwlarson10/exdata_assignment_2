
setwd("~/Desktop/exdata-data-NEI_data")
require(tidyr)
require(dplyr)
require(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- tbl_df(NEI)%>%group_by(year)
NEIbalt <- subset(NEI,fips==24510)
sumYear <- summarise(NEIbalt,total=sum(Emissions))
png("plot2.png", width=480, height=480)
emisionsBalt <- with(sumYear,barplot(total,names.arg = year,col=c("yellow","seagreen","purple","orange")))
dev.off()