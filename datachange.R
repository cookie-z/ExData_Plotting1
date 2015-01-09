##此段代码实现功能为读取单个家庭耗电量数据集的
##2007年2月1日与2007年2月2日的数据子集并保存
##读取txt数据源文件

data <- read.table("household_power_consumption.txt",sep=";",header = TRUE)
##对2007年2月1日与2007年2月2日两天数据进行筛选
dt <- data[(data["Date"]=='1/2/2007'|data["Date"]=='2/2/2007'),]
##对Date和Time字段进行格式调整，Time属性与日期合并，方便后续处理
mapply(paste,dt$Date,dt$Time) -> dt$Time
strptime(dt$Time,format="%d/%m/%Y %H:%M:%S",tz="GMT") ->dt$Time
##写入csv文件保存在工作空间
write.csv(dt,"homework1.csv")