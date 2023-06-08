######### ARIMA modeling 

library(tidyverse)
library(readr)
library(forecast)
hospital_index_1 <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/hospital_index_1.csv")
hospital_index_2 <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/hospital_index_2.csv")

########################################
######### For gastro-intestinal diseases
########################################


######### Typhoid #################
typhoid <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/typhoid_monthly_2016-2021.csv"
                    )
typhoid <- typhoid %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
         )### 건강보험 청구 건수 10억 건 당 case


tstyphoid <- ts(typhoid[,c("cases_by_index1", "cases_by_index2")], start = 2016, frequency = 12)

autoplot(tstyphoid[,"cases_by_index1"]) +
  ggtitle("Typhoid") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

autoplot(tstyphoid[,"cases_by_index2"]) +
  ggtitle("Typhoid") +
  xlab("Year") +
  ylab("Cases_by_index2") +
  theme_bw() + geom_line(size = 1) +
  geom_point()


### index_1
train <- window(tstyphoid, end=c(2020,2))
observed <- window(tstyphoid, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()
train[,"cases_by_index1"] %>% diff(lag=12) %>% ggtsdisplay()


fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,0,1))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,2))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,2))
fit_1_10

fit_1_10 %>% accuracy()

checkresiduals(fit_1_1, lag=12)
checkresiduals(fit_1_7, lag=12)

forcast_1_1 <- fit_1_1 %>% forecast(h = 24)
forcast_1_7 <- fit_1_7 %>% forecast(h = 24)

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_1, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_7, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()
 

### index_2
train <- window(tstyphoid, end=c(2020,2))
observed <- window(tstyphoid, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()
train[,"cases_by_index2"] %>% diff(lag=12) %>% ggtsdisplay()


fit_1_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,0,1))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,2))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,2))
fit_1_10

fit_1_10 %>% accuracy()

checkresiduals(fit_1_1, lag=12)
checkresiduals(fit_1_7, lag=12)

forcast_1_1 <- fit_1_1 %>% forecast(h = 24)
forcast_1_7 <- fit_1_7 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_1_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_1_7, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()






######### hepatitis_A #################
library(readxl)
hepatitis_A <- read_excel("My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/hepatitis_A_monthly_2016-2021.xlsx")

hepatitis_A <- hepatitis_A %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case


tshepatitis_A <- ts(hepatitis_A[,c("cases_by_index1", "cases_by_index2")], start = 2016, frequency = 12)

autoplot(tshepatitis_A[,"cases_by_index1"]) +
  ggtitle("hepatitis_A") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

autoplot(tshepatitis_A[,"cases_by_index2"]) +
  ggtitle("hepatitis_A") +
  xlab("Year") +
  ylab("Cases_by_index2") +
  theme_bw() + geom_line(size = 1) +
  geom_point()


### index_1
train <- window(tshepatitis_A, end=c(2020,2))
observed <- window(tshepatitis_A, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"])

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(0,0,1))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(1,0,1))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,1),  seasonal=c(0,0,1))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,3),  seasonal=c(0,0,1))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,0,2),  seasonal=c(1,0,2))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(1,0,2))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,2),  seasonal=c(0,0,0))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,2),  seasonal=c(0,0,1))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(3,1,3),  seasonal=c(0,0,1))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_1, lag=12)
checkresiduals(fit_1_2, lag=12)

forcast_1_1 <- fit_1_1 %>% forecast(h = 24)
forcast_1_2 <- fit_1_2 %>% forecast(h = 24)

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_1, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_2, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()


### index_2
train <- window(tshepatitis_A, end=c(2020,2))
observed <- window(tshepatitis_A, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()
train[,"cases_by_index2"] %>% diff(lag=12) %>% ggtsdisplay()

ndiffs(train[,"cases_by_index2"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index2"])

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,0,1))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(3,1,1))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,0,0))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,1))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(4,0,0))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(4,1,0))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(4,1,1))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_1, lag=12)
checkresiduals(fit_2_4, lag=12)

forcast_2_1 <- fit_2_1 %>% forecast(h = 24)
forcast_2_4 <- fit_2_4 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_4, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()





######### Shigellosis #################
library(readxl)
shigellosis <- read_excel("My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/shigellosis_monthly_2016-2021.xlsx")

shigellosis <- shigellosis %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case


tsshigellosis <- ts(shigellosis[,c("cases_by_index1", "cases_by_index2")], start = 2016, frequency = 12)

autoplot(tsshigellosis[,"cases_by_index1"]) +
  ggtitle("shigellosis") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

autoplot(tsshigellosis[,"cases_by_index2"]) +
  ggtitle("shigellosis") +
  xlab("Year") +
  ylab("Cases_by_index2") +
  theme_bw() + geom_line(size = 1) +
  geom_point()


### index_1
train <- window(tsshigellosis, end=c(2020,2))
observed <- window(tsshigellosis, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index1"])

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,1))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,0,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,0))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,1))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,1,2))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,0,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,1))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(2,0,2))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_1, lag=12)
checkresiduals(fit_1_3, lag=12)

forcast_1_1 <- fit_1_1 %>% forecast(h = 24)
forcast_1_3 <- fit_1_3 %>% forecast(h = 24)

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_1, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_3, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()


### index_2
train <- window(tsshigellosis, end=c(2020,2))
observed <- window(tsshigellosis, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()


ndiffs(train[,"cases_by_index2"]) ### 비계절성 차분 필요.
nsdiffs(train[,"cases_by_index2"])

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,0,1))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,1))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,0,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,0))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,0,2))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,0,1))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(2,1,1))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_1, lag=12)
checkresiduals(fit_2_10, lag=12)

forcast_2_1 <- fit_2_1 %>% forecast(h = 24)
forcast_2_10 <- fit_2_10 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_1, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_10, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()





######### Enterohemorrhagic #################
library(readxl)
enterohemorrhagic <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/enterohemorrhagic_monthly_2016-2021.xlsx")

enterohemorrhagic <- enterohemorrhagic %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  )### 건강보험 청구 건수 10억 건 당 case


tsenterohemorrhagic <- ts(enterohemorrhagic[,c("cases_by_index1", "cases_by_index2")], start = 2016, frequency = 12)

autoplot(tsenterohemorrhagic[,"cases_by_index1"]) +
  ggtitle("enterohemorrhagic") +
  xlab("Year") +
  ylab("Cases_by_index1")+
  theme_bw() + geom_line(size = 1) +
  geom_point()

autoplot(tsenterohemorrhagic[,"cases_by_index2"]) +
  ggtitle("enterohemorrhagic") +
  xlab("Year") +
  ylab("Cases_by_index2") +
  theme_bw() + geom_line(size = 1) +
  geom_point()


### index_1
train <- window(tsenterohemorrhagic, end=c(2020,2))
observed <- window(tsenterohemorrhagic, start=c(2020,3))
train[,"cases_by_index1"]  %>% ggtsdisplay()

ndiffs(train[,"cases_by_index1"]) 
nsdiffs(train[,"cases_by_index1"]) ### 계절성 차분 필요.

fit_1_1 <- auto.arima(train[,"cases_by_index1"] + 0.01, lambda = 0,seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_1_1
fit_1_2 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,0))
fit_1_2
fit_1_3 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,1,0),  seasonal=c(1,1,0))
fit_1_3
fit_1_4 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,0,1),  seasonal=c(1,1,0))
fit_1_4
fit_1_5 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(1,1,0))
fit_1_5
fit_1_6 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,1,1),  seasonal=c(1,1,0))
fit_1_6
fit_1_7 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,0,0),  seasonal=c(1,1,1))
fit_1_7
fit_1_8 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,1))
fit_1_8
fit_1_9 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(1,1,1))
fit_1_9
fit_1_10 <- Arima(train[,"cases_by_index1"] + 0.01, lambda = 0, order=c(0,0,0),  seasonal=c(2,1,0))
fit_1_10

fit_1_10 %>% accuracy()


checkresiduals(fit_1_7, lag=12)
checkresiduals(fit_1_10, lag=12)

forcast_1_7 <- fit_1_7 %>% forecast(h = 24)
forcast_1_10 <- fit_1_10 %>% forecast(h = 24)

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_7, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index1"], size = 1) + 
  autolayer(forcast_1_10, size = 1) +
  autolayer(observed[,"cases_by_index1"], color = "red", size = 1) + theme_bw()


### index_2
train <- window(tsenterohemorrhagic, end=c(2020,2))
observed <- window(tsenterohemorrhagic, start=c(2020,3))
train[,"cases_by_index2"]  %>% ggtsdisplay()


ndiffs(train[,"cases_by_index2"]) 
nsdiffs(train[,"cases_by_index2"]) ### 계절성 차분 필요.

fit_2_1 <- auto.arima(train[,"cases_by_index2"] + 0.01, lambda = 0, seasonal=TRUE, stepwise=FALSE, approximation=FALSE)
fit_2_1
fit_2_2 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,0))
fit_2_2
fit_2_3 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,1,0),  seasonal=c(1,1,0))
fit_2_3
fit_2_4 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0,  order=c(0,0,1),  seasonal=c(1,1,0))
fit_2_4
fit_2_5 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(1,1,0))
fit_2_5
fit_2_6 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,1,1),  seasonal=c(1,1,0))
fit_2_6
fit_2_7 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,0,0),  seasonal=c(1,1,1))
fit_2_7
fit_2_8 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,0),  seasonal=c(1,1,1))
fit_2_8
fit_2_9 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(1,0,1),  seasonal=c(1,1,1))
fit_2_9
fit_2_10 <- Arima(train[,"cases_by_index2"] + 0.01, lambda = 0, order=c(0,0,0),  seasonal=c(2,1,0))
fit_2_10

fit_2_10 %>% accuracy()

checkresiduals(fit_2_7, lag=12)
checkresiduals(fit_2_10, lag=12)

forcast_2_7 <- fit_2_7 %>% forecast(h = 24)
forcast_2_10 <- fit_2_10 %>% forecast(h = 24)

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_7, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()

autoplot(train[,"cases_by_index2"], size = 1) + 
  autolayer(forcast_2_10, size = 1) +
  autolayer(observed[,"cases_by_index2"], color = "red", size = 1) + theme_bw()
