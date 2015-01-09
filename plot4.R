##此段代码为创建图形4文件plot4.png的代码
##因为题目没有特别要求因此没有写成函数调用形式

##读取已经保存的子集数据，数据处理部分请查看datachangeR中的代码
dt <- read.csv("homework1.csv")
##对Date和Time字段进行格式调整
as.Date(dt$Date,format = "%d/%m/%Y") ->dt$Date
strptime(dt$Time,format="%Y-%m-%d  %H:%M:%S",tz="GMT") ->dt$Time
##数字化全球家庭每分钟的平均有功功率
activepower<- as.numeric(as.character(dt$Global_active_power))
##数字化全球家庭每分钟的平均无功功率
reactivepower<- as.numeric(as.character(dt$Global_reactive_power))
##数字化 每分钟的平均电压
voltagedata <- as.numeric(as.character(dt$Voltage))
##电量分项计量编号1、2、3数字化
sub1 <- as.numeric(as.character(dt$Sub_metering_1))
sub2 <- as.numeric(as.character(dt$Sub_metering_2))
sub3 <- as.numeric(as.character(dt$Sub_metering_3))
#构建png图形并保存文件，其x轴坐标是根据系统的区域设置显示英文或中文
##中文系统的小伙伴需要设置成美国区域才能显示如示例所给出的Thu、Fri等
##星期几的信息，否则会显示中文的周四、周五，此处请注意！
png(file="plot4.png",  width = 480, height = 480, bg="transparent") 
##建立一个容纳2乘2四个图形的绘图空间
par(mfrow=c(2,2),mar=c(4,4,2,1))
##绘制有功功率图
plot(dt$Time,activepower,type="l",xlab="",ylab="Global Active Power")
##绘制平均电压图
plot(dt$Time,voltagedata ,type="l",xlab="datetime",ylab="Voltage")
##绘制电量分项图，带图例说明
plot(dt$Time,sub1,type="l",xlab="",ylab="Energy sub metering")
lines(x=dt$Time, y=sub2, col="red")
lines(x=dt$Time, y=sub3, col="blue")
legend("topright",lty=1,bty="n",yjust=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##绘制无功功率图
plot(dt$Time,reactivepower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()

#保存为plot4.png文件