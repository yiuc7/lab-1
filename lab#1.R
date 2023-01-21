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
E <- df_EPI$EPI[!tf]
E