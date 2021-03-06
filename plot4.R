dat = read.csv2('household_power_consumption.txt', na.strings = '?', colClasses = 'character', stringsAsFactors = FALSE)
dat = transform(dat,
                Date = as.Date(Date, format='%d/%m/%Y'),
                Time = strptime(paste(Date, Time, sep=' '), format='%d/%m/%Y %H:%M:%S'),
                Global_active_power = as.numeric(Global_active_power),
                Global_reactive_power = as.numeric(Global_reactive_power),
                Voltage = as.numeric(Voltage),
                Global_intensity = as.numeric(Global_intensity),
                Sub_metering_1 = as.numeric(Sub_metering_1),
                Sub_metering_2 = as.numeric(Sub_metering_2),
                Sub_metering_3 = as.numeric(Sub_metering_3))

dat = dat[dat$Date >= as.Date('2007-02-01') & dat$Date <= as.Date('2007-02-02'), ]

par(mfrow=c(2,2))
par(mar=c(5.1, 5.1, 4.1, 2.1))
par(cex=0.6)

plot(dat$Time, dat$Global_active_power, type='l', xlab='', ylab='Global Active Power')

plot(dat$Time, dat$Voltage, type='l', xlab='datetime', ylab='Voltage')

plot(dat$Time, dat$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(dat$Time, dat$Sub_metering_2, type='l', col='red')
lines(dat$Time, dat$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, lwd=1, bty='n')

plot(dat$Time, dat$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()
