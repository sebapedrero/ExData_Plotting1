Sys.setlocale("LC_TIME", "English")
hpc<-read.table("household_power_consumption.txt",head=T,sep=";",dec=".",na="?",
                colClasses=c("factor","factor","numeric","numeric",
                             "numeric","numeric","numeric","numeric","numeric"))
hpc$date<-paste(hpc$Date,hpc$Time,sep=' ')
hpc$date<-strptime(hpc$date,format="%d/%m/%Y %H:%M:%S")
hpc_plots<-hpc[hpc$date>"2007-01-31 23:59:00" & hpc$date<"2007-02-03 00:00:00",]
png(filename="plot2.png",width=480,height=480)
plot(hpc_plots$date,hpc_plots$Global_active_power,type='l',
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

