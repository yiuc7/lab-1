EPI_data5 <- read.csv("./2010EPI_data.csv")
EPI_data5
library(readxl)
EPI_data <- read_excel("./2010EPI_data.xls")
sheet_names <- excel_sheets("./2010EPI_data.xls")
sheet_names
list_all <- lapply(sheet_names, function(x)as.data.frame(read_excel("./2010EPI_data.xls", sheet = x)))
names(list_all) <- sheet_names
list_all[["EPI2010_all countries"]]
attach(list_all[["EPI2010_all countries"]])
df_EPI <- list_all[["EPI2010_all countries"]]
df_EPI$EPI <- as.numeric(df_EPI$EPI)
is.na(df_EPI$EPI)
tf <- is.na(df_EPI$EPI)

###EPI column without NAs
E <- df_EPI$EPI[!tf]

summary(EPI)

fivenum(df_EPI$EPI,na.rm=TRUE)
stem(df_EPI$EPI)
hist(df_EPI$EPI)
hist(df_EPI$EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(df_EPI$EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
rug(df_EPI$EPI) 
qqnorm(df_EPI$EPI); qqline(df_EPI$EPI)

###filtering out the NA in DALY
df_EPI$DALY = as.numeric(df_EPI$DALY)
tf_1 <- is.na(df_EPI$DALY)
D <- df_EPI$DALY[!tf_1]

boxplot(E,D) 
qqplot(E,D)

EPILand<-EPI[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(Eland)
