Sys.setlocale("LC_TIME", "English")
hpc<-read.table("household_power_consumption.txt",head=T,sep=";",dec=".",na="?",
                colClasses=c("factor","factor","numeric","numeric",
                             "numeric","numeric","numeric","numeric","numeric"))
hpc$date<-paste(hpc$Date,hpc$Time,sep=' ')
hpc$date<-strptime(hpc$date,format="%d/%m/%Y %H:%M:%S")
hpc_plots<-hpc[hpc$date>"2007-01-31 23:59:00" & hpc$date<"2007-02-03 00:00:00",]
png(filename="plot3.png",width=480,height=480)
plot(hpc_plots$date,hpc_plots$Sub_metering_1,type='l',
     ylab="Energy sub metering",xlab="")
lines(hpc_plots$date,hpc_plots$Sub_metering_2,col=2)
lines(hpc_plots$date,hpc_plots$Sub_metering_3,col=4)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c(1,2,4),text.col="black",lwd=c(1,1,1),lty=c(1,1,1))
dev.off()

