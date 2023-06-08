######### ARIMA modeling with Moving Average (3-month window)

library(tidyverse)
library(readr)
library(forecast)
library(zoo)

########################################
######### For gastro-intestinal diseases
########################################


######### typhoid #################
typhoid <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/typhoid_monthly_2016-2021.csv"
)

### 건강보험 청구 건수 10억 건 당 case
typhoid <- typhoid %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)

### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tstyphoid <- ts(typhoid[,c("cases_by_index1", "cases_by_index2")], start = c(2015, 12), end = c(2022, 1), frequency = 12)


### 3달의 window를 적용해서 이동평균값 계산하기
ma_typhoid <- rollmean(tstyphoid, k = 3, align =  "center")

autoplot(ma_typhoid[,"cases_by_index1"]) +
  ggtitle("Typhoid") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

### index_1
train <- window(ma_typhoid, end=c(2020,2))
observed <- window(tstyphoid, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()
train[,"cases_by_index1"] %>% diff(lag=12) %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"])

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(1,0,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(1,0,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,1),  seasonal=c(1,0,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,3),  seasonal=c(1,0,0))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,3),  seasonal=c(1,0,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(1,1,0))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(1,1,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(2,0,0))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(2,0,1))
fit_1_10

fit_1_10 %>% accuracy()

checkresiduals(fit_1_1, lag=12)

forcast_typhoid <- fit_1_2 %>% forecast(h = 24)

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_typhoid, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()



### index_2
train <- window(ma_typhoid, end=c(2020,2))
observed <- window(tstyphoid, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()
train[,"cases_by_index2"] %>% diff(lag=12) %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"])

fit_1_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,2),  seasonal=c(1,0,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(1,0,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,1),  seasonal=c(1,0,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,3),  seasonal=c(1,0,0))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,3),  seasonal=c(1,0,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(1,1,0))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(1,1,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(2,0,0))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,3),  seasonal=c(2,0,1))
fit_1_10

fit_1_10 %>% accuracy()

checkresiduals(fit_1_1, lag=12)

forcast_1_1 <- fit_1_1 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_1_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()





######### hepatitis_A #################
library(readxl)
hepatitis_A <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/hepatitis_A_monthly_2016-2021.xlsx")

hepatitis_A <- hepatitis_A %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case


### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tshepatitis_A <- ts(hepatitis_A[,c("cases_by_index1", "cases_by_index2")], start = c(2015, 12), end = c(2022, 1), frequency = 12)


### 3달의 window를 적용해서 이동평균값 계산하기
ma_hepatitis_A <- rollmean(tshepatitis_A, k = 3, align =  "center")

autoplot(ma_hepatitis_A[,"cases_by_index1"]) +
  ggtitle("Typhoid") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()


### index_1
train <- window(ma_hepatitis_A, end=c(2020,2))
observed <- window(ma_hepatitis_A, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"])

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(4,1,1))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(4,1,2))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(5,1,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(4,2,0))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,2))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(4,0,0))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(5,1,1))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_10, lag=12)


forcast_hepatitis <- fit_1_10 %>% forecast(h = 24)


autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_hepatitis, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()


### index_2
train <- window(ma_hepatitis_A, end=c(2020,2))
observed <- window(ma_hepatitis_A, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()


ndiffs(train[,"cases_by_index2"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index2"])

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(4,1,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,2))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,3))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,1))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,2))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,1))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,3))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(5,1,1))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_1, lag=12)
checkresiduals(fit_2_10, lag=12)

forcast_2_1 <- fit_2_1 %>% forecast(h = 24)
forcast_2_10 <- fit_2_10 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw() +
  ylim(c(0, 5000))

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_10, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()





######### Shigellosis #################
library(readxl)
shigellosis <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/shigellosis_monthly_2016-2021.xlsx")

shigellosis <- shigellosis %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case



### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tsshigellosis <- ts(shigellosis[,c("cases_by_index1", "cases_by_index2")], start = c(2015, 12), end = c(2022, 1), frequency = 12)


### 3달의 window를 적용해서 이동평균값 계산하기
ma_shigellosis <- rollmean(tsshigellosis, k = 3, align =  "center")

autoplot(ma_shigellosis[,"cases_by_index1"]) +
  ggtitle("shigellosis") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

### index_1
train <- window(ma_shigellosis, end=c(2020,2))
observed <- window(ma_shigellosis, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"]) ### 계절성 차분 필요.

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,1),  seasonal=c(0,1,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,2),  seasonal=c(0,1,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,0),  seasonal=c(0,1,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,0),  seasonal=c(0,1,0))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(1,1,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(0,1,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(1,1,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(4,1,0),  seasonal=c(0,1,0))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(4,1,1),  seasonal=c(0,1,0))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_2, lag=12)


forcast_shigellosis <- fit_1_2 %>% forecast(h = 24)


autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_shigellosis, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()


### index_2
train <- window(ma_shigellosis, end=c(2020,2))
observed <- window(ma_shigellosis, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()


ndiffs(train[,"cases_by_index2"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index2"]) ### 계절성 차분 필요.

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,1),  seasonal=c(0,1,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,2),  seasonal=c(0,1,0))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,0),  seasonal=c(0,1,0))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,0),  seasonal=c(0,1,0))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(1,1,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(0,1,1))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(1,1,1))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(4,1,0),  seasonal=c(0,1,0))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(4,1,1),  seasonal=c(0,1,0))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_1, lag=12)


forcast_2_1 <- fit_2_1 %>% forecast(h = 24)


autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()






######### enterohemorrhagic #################
library(readxl)
enterohemorrhagic <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/enterohemorrhagic_monthly_2016-2021.xlsx")

enterohemorrhagic <- enterohemorrhagic %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case


### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tsenterohemorrhagic <- ts(enterohemorrhagic[,c("cases_by_index1", "cases_by_index2")], start = c(2015, 12), end = c(2022, 1), frequency = 12)


### 3달의 window를 적용해서 이동평균값 계산하기
ma_enterohemorrhagic <- rollmean(tsenterohemorrhagic, k = 3, align =  "center")

autoplot(ma_enterohemorrhagic[,"cases_by_index1"]) +
  ggtitle("enterohemorrhagic") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

### index_1
train <- window(ma_enterohemorrhagic, end=c(2020,2))
observed <- window(ma_enterohemorrhagic, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) 
nsdiffs(train[,"cases_by_index1"]) ### 계절성 차분 필요.

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(0,1,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,1),  seasonal=c(0,1,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,0,0),  seasonal=c(0,1,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,0,0),  seasonal=c(0,1,0))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,0,1),  seasonal=c(0,1,0))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(0,1,0))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(0,2,0))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_1, lag=12)
checkresiduals(fit_1_10, lag=12)

forcast_enterohemorrhagic <- fit_1_2 %>% forecast(h = 24)


autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_enterohemorrhagic, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()




### index_2
train <- window(ma_enterohemorrhagic, end=c(2020,2))
observed <- window(ma_enterohemorrhagic, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()


ndiffs(train[,"cases_by_index2"]) 
nsdiffs(train[,"cases_by_index2"]) ### 계절성 차분 필요.

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(0,1,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,1),  seasonal=c(0,1,0))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,0))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,1))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,0,0),  seasonal=c(0,1,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,0,0),  seasonal=c(0,1,0))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,0,1),  seasonal=c(0,1,0))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(0,1,0))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(0,2,0))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_1, lag=12)
checkresiduals(fit_2_10, lag=12)

forcast_2_1 <- fit_2_1 %>% forecast(h = 24)
forcast_2_10 <- fit_2_10 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()





######### Tuberculosis #################
library(readxl)
tuberculosis <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/tuberculosis_monthly_2016-2021.xlsx")

tuberculosis <- tuberculosis %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case


### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tstuberculosis <- ts(tuberculosis[,c("cases_by_index1", "cases_by_index2")], start = c(2015, 12), end = c(2022, 1), frequency = 12)


### 3달의 window를 적용해서 이동평균값 계산하기
ma_tuberculosis <- rollmean(tstuberculosis, k = 3, align =  "center")

autoplot(ma_tuberculosis[,"cases_by_index1"]) +
  ggtitle("tuberculosis") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

### index_1
train <- window(ma_tuberculosis, end=c(2020,2))
observed <- window(ma_tuberculosis, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"]) 

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,3),  seasonal=c(1,0,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,4),  seasonal=c(1,0,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(1,0,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(1,0,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(2,0,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(2,0,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,5),  seasonal=c(1,0,0))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,2),  seasonal=c(1,0,0))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,2),  seasonal=c(1,0,0))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_7, lag=12)
checkresiduals(fit_1_4, lag=12)

forcast_tuberculosis <- fit_1_7 %>% forecast(h = 24)
forcast_1_3 <- fit_1_3 %>% forecast(h = 24)

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_tuberculosis, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_3, size = 1, CI = FALSE) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()


### index_2
train <- window(ma_tuberculosis, end=c(2020,2))
observed <- window(ma_tuberculosis, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()


ndiffs(train[,"cases_by_index2"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index2"]) 

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,3),  seasonal=c(1,0,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,4),  seasonal=c(1,0,0))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(1,0,0))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(1,0,1))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(2,0,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,4),  seasonal=c(2,0,1))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,5),  seasonal=c(1,0,0))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,2),  seasonal=c(1,0,0))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,2),  seasonal=c(1,0,0))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_4, lag=12)
checkresiduals(fit_2_10, lag=12)

forcast_2_4 <- fit_2_4 %>% forecast(h = 24)
forcast_2_1 <- fit_2_1 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_4, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()



save(forcast_typhoid, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_varicella.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_varicella.rda" )

save(forcast_shigellosis, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_whooping.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_whooping.rda" )

save(forcast_enterohemorrhagic, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_mumps.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_mumps.rda" )

save(forcast_hepatitis, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_pneumococcal.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_pneumococcal.rda" )

save(forcast_tuberculosis, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_scarlet.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_scarlet.rda" )






















########################################
######### For respiratory diseases
########################################
library(lubridate)
index_1 <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Data\\hospital_index_1.csv")
index_2 <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Data\\hospital_index_2.csv")


######### Varicella #################
library(readxl)
varicella <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/varicella/varicella_total.xlsx",
                        col_types = c("numeric", "numeric", "numeric", "date"))

###### 이거는 Rt니까 index는 없어도 됨. index는 나중에 case로 바꾼 후에 추가하기.

### Estimate R code에서 계산하는 Rt 객체 가져와서 사용하기.
varicella_R
varicella_meanR <- varicella_R$R[,"Mean(R)"]

varicella_meanR <- varicella_meanR %>% 
  cbind(as.Date(varicella$date)) 

colnames(varicella_meanR) <- c("Rt", "date") 
varicella_meanR <- as_tibble(varicella_meanR)

varicella_meanR$date <- as.Date(varicella_meanR$date, origin = "1970-01-01")

### ts 객체로 변환하기.
tsvaricella <- ts(varicella_meanR[,"Rt"], start = c(2016,1), end = c(2021,52), frequency = 52)


### 5주의 window를 적용해서 이동평균값 계산하기
### 근데 굳이 rollmean까지 필요 없는듯하다.
ma_varicella <- rollmean(tsvaricella, k = 5, align =  "center")


######## 
train <- window(ma_varicella, end=c(2020,2))

train %>% ggtsdisplay()

### 비계절성 혹은 계절성 차분 필요.
ndiffs(train) 
nsdiffs(train)

fit_varicella <- Arima(train + 0.01, lambda = 0, order=c(3,0,2),  seasonal=c(0,1,0))
fit_1_1
fit_1_2 <- Arima(train + 0.01, lambda = 0, order=c(3,0,1),  seasonal=c(0,1,0))
fit_1_2
fit_1_3 <- Arima(train + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(0,1,0))
fit_1_3
fit_1_4 <- Arima(train + 0.01, lambda = 0, order=c(3,1,2),  seasonal=c(0,1,0))
fit_1_4
fit_1_5 <- Arima(train + 0.01, lambda = 0, order=c(3,0,2),  seasonal=c(1,1,0))
fit_1_5
fit_1_6 <- Arima(train + 0.01, lambda = 0, order=c(3,0,2),  seasonal=c(0,1,1))
fit_1_6
fit_1_7 <- Arima(train + 0.01, lambda = 0, order=c(4,0,2),  seasonal=c(0,1,0))
fit_1_7
fit_1_8 <- Arima(train + 0.01, lambda = 0, order=c(3,0,3),  seasonal=c(0,1,0))
fit_1_8
fit_1_9 <- Arima(train + 0.01, lambda = 0, order=c(4,0,3),  seasonal=c(0,1,0))
fit_1_9
fit_1_10 <- Arima(train + 0.01, lambda = 0, order=c(4,1,3),  seasonal=c(0,1,0))
fit_1_10

fit_1_7 %>% accuracy()

checkresiduals(fit_1_1, lag = 12)

forcast_varicella <- fit_varicella %>% forecast(h = 104)

autoplot(train, size = 1) + 
  autolayer(forcast_varicella , size = 1) + theme_bw()





######### Whooping cough #################
library(readxl)
whooping_cough <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/whooping_cough/whooping_cough_total.xlsx",
                        col_types = c("numeric", "numeric", "numeric", "date"))

###### 이거는 Rt니까 index는 없어도 됨. index는 나중에 case로 바꾼 후에 추가하기.

### Estimate R code에서 계산하는 Rt 객체 가져와서 사용하기.
whooping_R
whooping_cough_meanR <- whooping_R$R[,"Mean(R)"]

whooping_cough_meanR <- whooping_cough_meanR %>% 
  cbind(as.Date(whooping_cough$date)) 

colnames(whooping_cough_meanR) <- c("Rt", "date") 
whooping_cough_meanR <- as_tibble(whooping_cough_meanR)

whooping_cough_meanR$date <- as.Date(whooping_cough_meanR$date, origin = "1970-01-01")

### ts 객체로 변환하기.
tswhooping_cough <- ts(whooping_cough_meanR[,"Rt"], start = c(2016,1), end = c(2021,52), frequency = 52)


### 5주의 window를 적용해서 이동평균값 계산하기

ma_whooping_cough <- rollmean(tswhooping_cough, k = 5, align =  "center")


######## 
train <- window(ma_whooping_cough, end=c(2020,2))

train %>% ggtsdisplay()

### 비계절성 혹은 계절성 차분 필요.
ndiffs(train) 
nsdiffs(train)

fit_1_1 <- auto.arima(train + 0.01, lambda = 0,seasonal=TRUE, stepwise = FALSE)
fit_1_1
fit_1_2 <- Arima(train + 0.01, lambda = 0, order=c(4,1,1),  seasonal=c(1,1,1))
fit_1_2
fit_1_3 <- Arima(train + 0.01, lambda = 0, order=c(4,1,0),  seasonal=c(0,0,1))
fit_1_3
fit_1_4 <- Arima(train + 0.01, lambda = 0, order=c(4,1,0),  seasonal=c(1,0,1))
fit_1_4
fit_whooping <- Arima(train + 0.01, lambda = 0, order=c(4,1,1),  seasonal=c(1,1,1))
fit_1_5
fit_1_6 <- Arima(train + 0.01, lambda = 0, order=c(2,1,1),  seasonal=c(1,0,1))
fit_1_6
fit_1_7 <- Arima(train + 0.01, lambda = 0, order=c(3,1,0),  seasonal=c(1,0,1))
fit_1_7
fit_1_8 <- Arima(train + 0.01, lambda = 0, order=c(4,1,2),  seasonal=c(1,0,1))
fit_1_8
fit_1_9 <- Arima(train + 0.01, lambda = 0, order=c(4,0,3),  seasonal=c(1,0,1))
fit_1_9
fit_1_10 <- Arima(train + 0.01, lambda = 0, order=c(4,1,1),  seasonal=c(0,0,0))
fit_1_10

fit_1_2 %>% accuracy()

checkresiduals(fit_1_2)

forcast_whooping <- fit_whooping %>% forecast(h = 104)

autoplot(train, size = 1) + ylim(c(0,15)) +
  autolayer(forcast_whooping, size = 1) + theme_bw()





######### mumps #################
library(readxl)
mumps <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/mumps/mumps_total.xlsx",
                             col_types = c("numeric", "numeric", "numeric", "date"))

###### 이거는 Rt니까 index는 없어도 됨. index는 나중에 case로 바꾼 후에 추가하기.

### Estimate R code에서 계산하는 Rt 객체 가져와서 사용하기.
mumps_R
mumps_meanR <- mumps_R$R[,"Mean(R)"]

mumps_meanR <- mumps_meanR %>% 
  cbind(as.Date(mumps$date)) 

colnames(mumps_meanR) <- c("Rt", "date") 
mumps_meanR <- as_tibble(mumps_meanR)

mumps_meanR$date <- as.Date(mumps_meanR$date, origin = "1970-01-01")

### ts 객체로 변환하기.
tsmumps <- ts(mumps_meanR[,"Rt"], start = c(2016,1), end = c(2021,52), frequency = 52)


### 5주의 window를 적용해서 이동평균값 계산하기

ma_mumps <- rollmean(tsmumps, k = 5, align =  "center")


######## 
train <- window(ma_mumps, end=c(2020,2))

train %>% ggtsdisplay()

### 비계절성 혹은 계절성 차분 필요.
ndiffs(train) 
nsdiffs(train)

fit_1_1 <- auto.arima(train + 0.01, lambda = 0,seasonal=TRUE, stepwise = FALSE)
fit_1_1
fit_1_2 <- Arima(train + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(1,1,0))
fit_1_2
fit_1_3 <- Arima(train + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(1,1,1))
fit_1_3
fit_1_4 <- Arima(train + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(1,1,0))
fit_1_4
fit_1_5 <- Arima(train + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(1,1,0))
fit_1_5
fit_1_6 <- Arima(train + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(0,1,0))
fit_1_6
fit_1_7 <- Arima(train + 0.01, lambda = 0, order=c(2,0,1),  seasonal=c(1,1,0))
fit_1_7
fit_mumps <- Arima(train + 0.01, lambda = 0, order=c(0,0,1),  seasonal=c(1,1,0))
fit_1_8
fit_1_9 <- Arima(train + 0.01, lambda = 0, order=c(1,1,1),  seasonal=c(1,1,0))
fit_1_9
fit_1_10 <- Arima(train + 0.01, lambda = 0, order=c(2,1,1),  seasonal=c(1,1,0))
fit_1_10

fit_1_8 %>% accuracy()

checkresiduals(fit_1_2)

forcast_mumps <- fit_mumps %>% forecast(h = 104)

autoplot(train, size = 1) + ylim(c(0,6)) +
  autolayer(forcast_mumps, size = 1) + theme_bw()







######### pneumococcal #################
library(readxl)
pneumococcal <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/pneumococcal_disease/pneumococcal_total.xlsx",
                    col_types = c("numeric", "numeric", "numeric", "date"))

###### 이거는 Rt니까 index는 없어도 됨. index는 나중에 case로 바꾼 후에 추가하기.

### Estimate R code에서 계산하는 Rt 객체 가져와서 사용하기.
pneumococcal_R
pneumococcal_meanR <- pneumococcal_R$R[,"Mean(R)"]

pneumococcal_meanR <- pneumococcal_meanR %>% 
  cbind(as.Date(pneumococcal$date)) 

colnames(pneumococcal_meanR) <- c("Rt", "date") 
pneumococcal_meanR <- as_tibble(pneumococcal_meanR)

pneumococcal_meanR$date <- as.Date(pneumococcal_meanR$date, origin = "1970-01-01")

### ts 객체로 변환하기.
tspneumococcal <- ts(pneumococcal_meanR[,"Rt"], start = c(2016,1), end = c(2021,52), frequency = 52)


### 5주의 window를 적용해서 이동평균값 계산하기

ma_pneumococcal <- rollmean(tspneumococcal, k = 5, align =  "center")


######## 
train <- window(ma_pneumococcal, end=c(2020,2))

train %>% ggtsdisplay()

### 비계절성 혹은 계절성 차분 필요.
ndiffs(train) 
nsdiffs(train)

fit_1_1 <- auto.arima(train + 0.01, lambda = 0,seasonal=TRUE, stepwise = FALSE)
fit_1_1
fit_1_2 <- Arima(train + 0.01, lambda = 0, order=c(2,0,1),  seasonal=c(1,1,1))
fit_1_2
fit_1_3 <- Arima(train + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,1))
fit_1_3
fit_1_4 <- Arima(train + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(1,1,1))
fit_1_4
fit_1_5 <- Arima(train + 0.01, lambda = 0, order=c(3,0,0),  seasonal=c(1,1,1))
fit_1_5
fit_1_6 <- Arima(train + 0.01, lambda = 0, order=c(3,0,1),  seasonal=c(1,1,1))
fit_1_6
fit_pneumococcal <- Arima(train + 0.01, lambda = 0, order=c(2,0,0),  seasonal=c(1,1,0))
fit_1_7
fit_1_8 <- Arima(train + 0.01, lambda = 0, order=c(2,0,0),  seasonal=c(0,1,0))
fit_1_8
fit_1_9 <- Arima(train + 0.01, lambda = 0, order=c(2,0,0),  seasonal=c(0,1,1))
fit_1_9
fit_1_10 <- Arima(train + 0.01, lambda = 0, order=c(2,0,0),  seasonal=c(1,0,1))
fit_1_10

fit_1_10 %>% accuracy()

checkresiduals(fit_1_7)

forcast_pneumococcal <- fit_pneumococcal %>% forecast(h = 104)

autoplot(train, size = 1) + ylim(c(0,6)) +
  autolayer(forcast_pneumococcal, size = 1) + theme_bw()











######### scarlet_fever #################
library(readxl)
scarlet_fever <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/scarlet_fever/scarlet_fever_total.xlsx",
                           col_types = c("numeric", "numeric", "numeric", "date"))

###### 이거는 Rt니까 index는 없어도 됨. index는 나중에 case로 바꾼 후에 추가하기.

### Estimate R code에서 계산하는 Rt 객체 가져와서 사용하기.
scarlet_fever_R
scarlet_fever_meanR <- scarlet_fever_R$R[,"Mean(R)"]

scarlet_fever_meanR <- scarlet_fever_meanR %>% 
  cbind(as.Date(scarlet_fever$date)) 

colnames(scarlet_fever_meanR) <- c("Rt", "date") 
scarlet_fever_meanR <- as_tibble(scarlet_fever_meanR)

scarlet_fever_meanR$date <- as.Date(scarlet_fever_meanR$date, origin = "1970-01-01")

### ts 객체로 변환하기.
tsscarlet_fever <- ts(scarlet_fever_meanR[,"Rt"], start = c(2016,1), end = c(2021,52), frequency = 52)


### 5주의 window를 적용해서 이동평균값 계산하기

ma_scarlet_fever <- rollmean(tsscarlet_fever, k = 5, align =  "center")


######## 
train <- window(ma_scarlet_fever, end=c(2020,2))

train %>% ggtsdisplay()

### 비계절성 혹은 계절성 차분 필요.
ndiffs(train) 
nsdiffs(train)

fit_1_1 <- auto.arima(train + 0.01, lambda = 0,seasonal=TRUE, stepwise = FALSE)
fit_1_1
fit_1_2 <- Arima(train + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(0,1,0))
fit_1_2
fit_1_3 <- Arima(train + 0.01, lambda = 0, order=c(3,1,2),  seasonal=c(0,1,0))
fit_1_3
fit_1_4 <- Arima(train + 0.01, lambda = 0, order=c(1,1,2),  seasonal=c(0,1,0))
fit_1_4
fit_1_5 <- Arima(train + 0.01, lambda = 0, order=c(2,1,1),  seasonal=c(0,1,0))
fit_1_5
fit_1_6 <- Arima(train + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(1,1,0))
fit_1_6
fit_1_7 <- Arima(train + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(1,1,1))
fit_1_7
fit_1_8 <- Arima(train + 0.01, lambda = 0,  order=c(2,1,2),  seasonal=c(2,1,0))
fit_1_8
fit_scarlet <- Arima(train + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(0,1,1))
fit_1_9
fit_1_10 <- Arima(train + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(2,1,1))
fit_1_10

fit_1_9 %>% accuracy()

checkresiduals(fit_1_9)

forcast_scarlet  <- fit_scarlet  %>% forecast(h = 104)

autoplot(train, size = 1) + ylim(c(0,10)) +
  autolayer(forcast_scarlet, size = 1) + theme_bw()







save(forcast_varicella, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_varicella.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_varicella.rda" )

save(forcast_whooping, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_whooping.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_whooping.rda" )

save(forcast_mumps, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_mumps.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_mumps.rda" )

save(forcast_pneumococcal, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_pneumococcal.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_pneumococcal.rda" )

save(forcast_scarlet, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_scarlet.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_scarlet.rda" )


forcast_varicella 
forcast_whooping
forcast_mumps
forcast_pneumococcal
forcast_scarlet





















########################################################################
################## Bovine diseases
########################################################################



######### Bovine tuberculosis #################
bovine_tuber <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Bovine/cow_tuber_monthly.csv"
)
#### 둘로 나누어져 있는 year, month 합치기
bovine_tuber$date <- as.Date(paste0(with(bovine_tuber, sprintf("%d-%d", year, month)), "-01"), format = "%Y-%m-%d")

bovine_tuber <- bovine_tuber %>% 
  dplyr::select(year, date, cases)


### cattle farm / numbers
bovine_farm <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/cattle_farm.csv"
)


bovine_tuber <- bovine_tuber %>% 
  left_join(bovine_farm, by = "year") %>% 
  mutate(cases_by_farm = cases / farms * 100000, # 10만 farms 당
         cases_by_numbers = cases / cattle_number * 1000000, # 100만 마리 당
  ) %>% dplyr::select(date, cases_by_farm, cases_by_numbers)

### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tsbovine_tuber <- ts(bovine_tuber[,c("cases_by_farm", "cases_by_numbers")], start = c(2015, 12), end = c(2022, 1), frequency = 12)

### 3달의 window를 적용해서 이동평균값 계산하기
ma_bovine_tuber  <- rollmean(tsbovine_tuber , k = 3, align =  "center")

autoplot(ma_bovine_tuber[,"cases_by_farm"]) +
  ggtitle("Bovine Tuberculosis") +
  xlab("Year") +
  ylab("Cases_by_farm")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

autoplot(ma_bovine_tuber[,"cases_by_numbers"]) +
  ggtitle("Bovine Tuberculosis") +
  xlab("Year") +
  ylab("Cases_by_numbers")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

### Farms
train <- window(ma_bovine_tuber, end=c(2020,2))
observed <- window(tsbovine_tuber, start=c(2020,3))
train[,"cases_by_farm"]  %>% ggtsdisplay()
train[,"cases_by_farm"] %>% diff(lag=12) %>% ggtsdisplay()

ndiffs(train[,"cases_by_farm"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_farm"])

fit_1_1 <- auto.arima(train[,"cases_by_farm"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(1,0,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(1,0,1))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(2,0,1))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,3),  seasonal=c(2,0,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,3),  seasonal=c(2,0,2))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,2))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,3))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,1),  seasonal=c(2,0,3))
fit_1_10

fit_1_4 %>% accuracy()

checkresiduals(fit_1_4, lag=12)

forcast_bovine_tuber <- fit_1_4 %>% forecast(h = 24)

autoplot(train[,"cases_by_farm"], size = 1) + 
  autolayer(forcast_bovine_tuber, size = 1) +
  autolayer(observed[,"cases_by_farm"], color = "red", size = 1) + theme_bw()


fit_number <- Arima(train[,"cases_by_numbers"] + 0.01, lambda = 0, order=c(0,0,2),  seasonal=c(2,0,1))
fit_number

forcast_number <- fit_number %>% forecast(h = 24)

autoplot(train[,"cases_by_numbers"], size = 1) + 
  autolayer(forcast_number, size = 1) +
  autolayer(observed[,"cases_by_numbers"], color = "red", size = 1) + theme_bw()








######### Bovine Brucellosis #################
bovine_brucella <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Bovine/cow_brucella_monthly.csv"
)
#### 둘로 나누어져 있는 year, month 합치기
bovine_brucella$date <- as.Date(paste0(with(bovine_brucella, sprintf("%d-%d", year, month)), "-01"), format = "%Y-%m-%d")

bovine_brucella <- bovine_brucella %>% 
  dplyr::select(year, date, cases)


### cattle farm / numbers
bovine_farm <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/cattle_farm.csv"
)


bovine_brucella <- bovine_brucella %>% 
  left_join(bovine_farm, by = "year") %>% 
  mutate(cases_by_farm = cases / farms * 100000, # 10만 farms 당
         cases_by_numbers = cases / cattle_number * 1000000, # 100만 마리 당
  ) %>% dplyr::select(date, cases_by_farm, cases_by_numbers)

### 앞뒤로 한달치의 값씩을 추가해서 NA값 없어지도록.
tsbovine_brucella <- ts(bovine_brucella[,c("cases_by_farm", "cases_by_numbers")], start = c(2015, 12), end = c(2022, 1), frequency = 12)

### 3달의 window를 적용해서 이동평균값 계산하기
ma_bovine_brucella  <- rollmean(tsbovine_brucella , k = 3, align =  "center")

autoplot(ma_bovine_brucella[,"cases_by_farm"]) +
  ggtitle("Bovine brucellaculosis") +
  xlab("Year") +
  ylab("Cases_by_farm")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

autoplot(ma_bovine_brucella[,"cases_by_numbers"]) +
  ggtitle("Bovine brucellaculosis") +
  xlab("Year") +
  ylab("Cases_by_numbers")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

### Farms
train <- window(ma_bovine_brucella, end=c(2020,2))
observed <- window(tsbovine_brucella, start=c(2020,3))
train[,"cases_by_farm"]  %>% ggtsdisplay()
train[,"cases_by_farm"] %>% diff(lag=12) %>% ggtsdisplay()

ndiffs(train[,"cases_by_farm"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_farm"])

fit_1_1 <- auto.arima(train[,"cases_by_farm"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(1,0,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(2,0,1))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,2),  seasonal=c(2,0,1))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,3),  seasonal=c(2,0,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(1,0,3),  seasonal=c(2,0,2))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,2))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,3))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_farm"] + 0.01, lambda = 0, order=c(2,0,1),  seasonal=c(2,0,3))
fit_1_10

fit_1_9 %>% accuracy()

checkresiduals(fit_1_2, lag=12)

forcast_bovine_brucella <- fit_1_3 %>% forecast(h = 24)

autoplot(train[,"cases_by_farm"], size = 1) + 
  autolayer(forcast_bovine_brucella, size = 1) +
  autolayer(observed[,"cases_by_farm"], color = "red", size = 1) + theme_bw()


fit_number <- Arima(train[,"cases_by_numbers"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(2,0,1))
fit_number

forcast_number <- fit_number %>% forecast(h = 24)

autoplot(train[,"cases_by_numbers"], size = 1) + 
  autolayer(forcast_number, size = 1) +
  autolayer(observed[,"cases_by_numbers"], color = "red", size = 1) + theme_bw()


save(forcast_bovine_brucella, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Bovine/forcast_bovine_brucella.rda" )
save(forcast_bovine_tuber, file = "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Bovine/forcast_bovine_tuber.rda" )
