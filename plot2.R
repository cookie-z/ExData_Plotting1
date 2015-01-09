##此段代码为创建图形2文件plot2.png的代码
##因为题目没有特别要求因此没有写成函数调用形式

##读取已经保存的子集数据，数据处理部分请查看datachangeR中的代码
dt <- read.csv("homework1.csv")
##对Date和Time字段进行格式调整
as.Date(dt$Date,format = "%d/%m/%Y") ->dt$Date
strptime(dt$Time,format="%Y-%m-%d  %H:%M:%S",tz="GMT") ->dt$Time
##数字化全球家庭每分钟的平均有功功率
activepower<- as.numeric(as.character(dt$Global_active_power))
#构建png图形并保存文件，其x轴坐标是根据系统的区域设置显示英文或中文
##中文系统的小伙伴需要设置成美国区域才能显示如示例所给出的Thu、Fri等
##星期几的信息，否则会显示中文的周四、周五，此处请注意！
png(file="plot2.png",  width = 480, height = 480, bg="transparent") 
plot(dt$Time,activepower,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()

#保存为plot2.png文件