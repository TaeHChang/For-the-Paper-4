################ daily data to monthly and weekly data.
library(lubridate)
library(zoo)
library(tidyverse)


### 소 결핵, 브루셀라만 사용.
library(readxl)
cow_tuber <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/소_결핵.xlsx", 
                   col_types = c("skip", "skip", "skip", 
                                 "text", "skip", "numeric", "skip", 
                                 "skip"))
View(cow_tuber)

cow_tuber$Date <- substr(cow_tuber$Date, 1, 10)
cow_tuber$Date <- as.Date(cow_tuber$Date)

cow_tuber_weekly <- cow_tuber %>% 
  group_by(year = year(cow_tuber$Date), week = week(cow_tuber$Date))  %>% 
  summarise(cases = sum(Number, na.rm = T)) 

cow_tuber_weekly$X <- 1:length(cow_tuber_weekly$year)

cow_tuber_monthly <- cow_tuber %>% 
  group_by(year = year(cow_tuber$Date), month = month(cow_tuber$Date))  %>% 
  summarise(cases = sum(Number, na.rm = T))

cow_tuber_monthly$X <- 1:length(cow_tuber_monthly$year)

ggplot(cow_tuber_weekly, aes(x = X, y = cases)) +
  geom_line(linewidth = 0.7) + 
  geom_point(size = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  theme_bw()

ggplot(cow_tuber_monthly, aes(x = X, y = cases)) +
  geom_line(linewidth = 0.7) + 
  geom_point(size = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  theme_bw()


##### 브루셀라
library(readxl)
cow_brucella <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/소_브루셀라.xlsx", 
                        col_types = c("skip", "skip", "skip", 
                                      "text", "skip", "numeric", "skip", 
                                      "skip"))
View(cow_brucella)

cow_brucella$Date <- substr(cow_brucella$Date, 1, 10)
cow_brucella$Date <- as.Date(cow_brucella$Date)

cow_brucella_weekly <- cow_brucella %>% 
  group_by(year = year(cow_brucella$Date), week = week(cow_brucella$Date))  %>% 
  summarise(cases = sum(Number, na.rm = T)) 

cow_brucella_weekly$X <- 1:length(cow_brucella_weekly$year)

cow_brucella_monthly <- cow_brucella %>% 
  group_by(year = year(cow_brucella$Date), month = month(cow_brucella$Date))  %>% 
  summarise(cases = sum(Number, na.rm = T))

cow_brucella_monthly$X <- 1:length(cow_brucella_monthly$year)

ggplot(cow_brucella_weekly, aes(x = X, y = cases)) +
  geom_line(linewidth = 0.7) + 
  geom_point(size = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  theme_bw()

ggplot(cow_brucella_monthly, aes(x = X, y = cases)) +
  geom_line(linewidth = 0.7) + 
  geom_point(size = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  theme_bw()

write.csv(cow_brucella_weekly, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Data\\Bovine\\cow_brucella_weekly.csv")
write.csv(cow_brucella_monthly, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Data\\Bovine\\cow_brucella_monthly.csv")
write.csv(cow_tuber_weekly, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Data\\Bovine\\cow_tuber_weekly.csv")
write.csv(cow_tuber_monthly, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Data\\Bovine\\cow_tuber_monthly.csv")















