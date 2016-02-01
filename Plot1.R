setwd("~/Desktop/exdata-data-NEI_data")
require(tidyr)
require(dplyr)
require(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- tbl_df(NEI)%>%group_by(year)

sumYear <- summarise(NEI,total=sum(Emissions))
png("plot1.png", width=480, height=480)
emisionsYear <- with(sumYear,barplot(total,names.arg = year,col=c("blue","green","purple","orange")))
dev.off()