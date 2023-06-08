####################################################################################################
## estimate Rt based on the predicted cases
######################################################################################################
 


############ 기존에 사용하던 모델링 코드 예시
library(EpiEstim); library(tidyverse)

### 최근까지의 연령별 확진자 수
raw.COVID.case.by.age<-read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\COVID modelling\\dat_local_trans_by_age.csv",stringsAsFactors = F) # only local transmission
tail(raw.COVID.case.by.age) 

#Date로 코딩하기
raw.COVID.case.by.age$Date<-as.Date(raw.COVID.case.by.age$Date)

library(dplyr)
library(tidyverse)
#dat<-raw.COVID.case.by.sido[,c("Date","SKI","others2")] # others2 = All-SKI
dat <- raw.COVID.case.by.age %>%
  select(Date, total) %>%
  filter(as.Date(Date) >"2021-01-31")

### 일별 확진자수와 날짜 데이터 넣고 데이터프레임 만든다.
incid.all1 <- data.frame(I=dat[,2], dates= dat[,1])
incid.all1

#### With updated serial interval of delta ########################################

#Updated on 2022-07-14 

# Wild type: mean_si=3.93, sd=4.86 (Hong et al., 2020)

# Delta variant (21/07/25~, After when the delta virus accounted for 50%)
# mean_si= 2.46, std_si= 3.77 (Ryu et al., 2021 )

# Omicron variant (22/02/19 ~ )
# mean_si= 2.9, std_si = 1.6 (Song et al., 2022)


# Previous ---------------------------------------------------------------------
# period 1: ~21/07/24 (Before when the delta virus accounted for 50%) (existing)
# mean_si=4.7, std_si=2.9,

# period 2: 21/07/25~ (after when the delta virus accounted for 50%) (updated)
# mean_si_d = 2.46 std_si_d =3.77 (Ryu et al., 2021)


###################################################################################

## estimated R plot

### 오미크론 변이의 serial interval 값을 기존 문헌에 기초해서 임의로 삽입.
config_si <- make_config(list(mean_si=2.9, std_si=1.6))

incid.all1_om <- incid.all1 %>% filter(dates>"2022-02-08") #오미크론 기간에 대해서만 
R_parametric_all1 <- estimate_R(incid.all1_om, method="parametric_si", config=config_si)


##### 전국 감염 재생산 지수 추이 (그림 1-3)
plot(R_parametric_all1, what="R", legend=FALSE, 
     options_R =  list(col = palette(), transp = 0.2,
                       xlab = "Date", 
                       ylab = "전국 Rt(Omicron)",ylim=c(0.5,2))) + 
  scale_x_date(date_labels = "%y-%m-%d", date_breaks = "1 month",
               limits = c(as.Date("2022-02-18"), as.Date("2022-12-30")))

tail(R_parametric_all1$R,1)



################################################################################################

#### 실제로 분석에 사용할 것들 해보기.


library(EpiEstim); library(tidyverse) ;library(readxl)

### 수두
varicella_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/varicella/varicella_total.xlsx")
whooping_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/whooping_cough/whooping_cough_total.xlsx")
mumps_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/mumps/mumps_total.xlsx")
pneumococcal_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/pneumococcal_disease/pneumococcal_total.xlsx")
scarlet_fever_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/scarlet_fever/scarlet_fever_total.xlsx")

dat <- 1:313
varicella_total$date <- dat
whooping_total$date <- dat
mumps_total$date <- dat
pneumococcal_total$date <- dat
scarlet_fever_total$date <- dat


### 주별별 확진자수와 날짜 데이터 넣고 데이터프레임 만든다.
varicella <- data.frame(I=varicella_total[,3], dates= varicella_total[,4])
varicella <- varicella %>% 
  rename(I = cases, dates = date)
varicella$dates <- as.numeric(varicella$dates)

whooping <- data.frame(I=whooping_total[,3], dates= whooping_total[,4])
whooping <- whooping %>% 
  rename(I = cases, dates = date)
whooping$dates <- as.numeric(whooping$dates)

mumps <- data.frame(I=mumps_total[,3], dates= mumps_total[,4])
mumps <- mumps %>% 
  rename(I = cases, dates = date)
mumps$dates <- as.numeric(mumps$dates)

pneumococcal <- data.frame(I=pneumococcal_total[,3], dates= pneumococcal_total[,4])
pneumococcal <- pneumococcal %>% 
  rename(I = cases, dates = date)
pneumococcal$dates <- as.numeric(pneumococcal$dates)

scarlet_fever <- data.frame(I=scarlet_fever_total[,3], dates= scarlet_fever_total[,4])
scarlet_fever <- scarlet_fever %>% 
  rename(I = cases, dates = date)
scarlet_fever$dates <- as.numeric(scarlet_fever$dates)


#### With updated serial intervals ########################################

# Varicella SI: 14.0, std: 2.2
# Mumps SI: 18.0, std: 3.5
# Whooping cough (Pertussis) SI: 22.8, std: 6.5
# Streptococcus pneumoniae SI: 6.6, std: 1.8
# Scarlet fever SI: 14.0, std: 4.9


###################################################################################

## Varicella estimated R plot 

### serial interval 값을 기존 문헌에 기초해서 임의로 삽입.
varicella_si <- make_config(list(mean_si=14.0, std_si=2.2))

varicella_R <- estimate_R(varicella, method="parametric_si", config=varicella_si)

##### 전국 감염 재생산 지수 추이 (그림 1-3)
plot(varicella_R, what="R", legend=FALSE, 
     options_R =  list(col = palette(), transp = 0.2,
                       xlab = "Date", 
                       ylab = "Varicella",ylim=c(0,4.5))) 



## Whooping cough estimated R plot 

### serial interval 값을 기존 문헌에 기초해서 임의로 삽입.
whooping_si <- make_config(list(mean_si=22.8, std_si=6.5))

whooping_R <- estimate_R(whooping, method="parametric_si", config=whooping_si)

##### 전국 감염 재생산 지수 추이 (그림 1-3)
plot(whooping_R, what="R", legend=FALSE, 
     options_R =  list(col = palette(), transp = 0.2,
                       xlab = "Date", 
                       ylab = "whooping cough",ylim=c(0,6))) 



## Mumps estimated R plot 

### serial interval 값을 기존 문헌에 기초해서 임의로 삽입.
mumps_si <- make_config(list(mean_si=18.0, std_si=3.5))

mumps_R <- estimate_R(mumps, method="parametric_si", config=mumps_si)

##### 전국 감염 재생산 지수 추이 (그림 1-3)
plot(mumps_R, what="R", legend=FALSE, 
     options_R =  list(col = palette(), transp = 0.2,
                       xlab = "Date", 
                       ylab = "mumps",ylim=c(0,4.5)))



## Streptococcus pneumoniae estimated R plot 

### serial interval 값을 기존 문헌에 기초해서 임의로 삽입.
pneumococcal_si <- make_config(list(mean_si=6.6, std_si=1.8))

pneumococcal_R <- estimate_R(pneumococcal, method="parametric_si", config=pneumococcal_si)

##### 전국 감염 재생산 지수 추이 (그림 1-3)
plot(pneumococcal_R, what="R", legend=FALSE, 
     options_R =  list(col = palette(), transp = 0.2,
                       xlab = "Date", 
                       ylab = "pneumococcal disease",ylim=c(0,4)))



## Scarlet fever estimated R plot 

### serial interval 값을 기존 문헌에 기초해서 임의로 삽입.
scarlet_fever_si <- make_config(list(mean_si=14.0, std_si=4.9))

scarlet_fever_R <- estimate_R(scarlet_fever, method="parametric_si", config=scarlet_fever_si)

##### 전국 감염 재생산 지수 추이 (그림 1-3)
plot(scarlet_fever_R, what="R", legend=FALSE, 
     options_R =  list(col = palette(), transp = 0.2,
                       xlab = "Date", 
                       ylab = "scarlet_fever",ylim=c(0,4)))

