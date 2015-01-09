##此段代码为创建图形1文件plot1.png的代码
##因为题目没有特别要求因此没有写成函数调用形式

##读取已经保存的子集数据，数据处理部分请查看datachangeR中的代码
dt <- read.csv("homework1.csv")
##对Date和Time字段进行格式调整
as.Date(dt$Date,format = "%d/%m/%Y") ->dt$Date
strptime(dt$Time,format="%Y-%m-%d  %H:%M:%S",tz="GMT") ->dt$Time
##数字化全球家庭每分钟的平均有功功率
activepower<- as.numeric(as.character(dt$Global_active_power))
#构建png图形并保存文件
png(file="plot1.png", width = 480, height = 480,bg= "transparent")
hist(activepower,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
dev.off()

#保存为plot1.png文件