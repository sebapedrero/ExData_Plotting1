Sys.setlocale("LC_TIME", "English")
hpc<-read.table("household_power_consumption.txt",head=T,sep=";",dec=".",na="?",
                colClasses=c("factor","factor","numeric","numeric",
                             "numeric","numeric","numeric","numeric","numeric"))
hpc$date<-paste(hpc$Date,hpc$Time,sep=' ')
hpc$date<-strptime(hpc$date,format="%d/%m/%Y %H:%M:%S")
hpc_plots<-hpc[hpc$date>"2007-01-31 23:59:00" & hpc$date<"2007-02-03 00:00:00",]
png(filename="plot1.png",width=480,height=480)
hist(hpc_plots$Global_active_power, main="Global Active Power",xlab="Gloval Active Power (kilowatts)", col="red", ylim=c(0,1200))
dev.off()

