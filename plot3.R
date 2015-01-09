##此段代码为创建图形3文件plot3.png的代码
##因为题目没有特别要求因此没有写成函数调用形式

##读取已经保存的子集数据，数据处理部分请查看datachangeR中的代码
dt <- read.csv("homework1.csv")
##对Date和Time字段进行格式调整
as.Date(dt$Date,format = "%d/%m/%Y") ->dt$Date
strptime(dt$Time,format="%Y-%m-%d  %H:%M:%S",tz="GMT") ->dt$Time
##电量分项计量编号1、2、3数字化
sub1 <- as.numeric(as.character(dt$Sub_metering_1))
sub2 <- as.numeric(as.character(dt$Sub_metering_2))
sub3 <- as.numeric(as.character(dt$Sub_metering_3))
#构建png图形并保存文件，其x轴坐标是根据系统的区域设置显示英文或中文
##中文系统的小伙伴需要设置成美国区域才能显示如示例所给出的Thu、Fri等
##星期几的信息，否则会显示中文的周四、周五，此处请注意！
png(file="plot3.png",  width = 480, height = 480, bg="transparent") 
##绘制Sub_metering_1折线图，黑色线条
plot(dt$Time,sub1,type="l",xlab="",ylab="Energy sub metering")
##添加绘制Sub_metering_2折线图，红色线条
lines(x=dt$Time, y=sub2, col="red")
##添加绘制Sub_metering_3折线图，蓝色线条
lines(x=dt$Time, y=sub3, col="blue")
##添加图例说明
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

#保存为plot3.png文件