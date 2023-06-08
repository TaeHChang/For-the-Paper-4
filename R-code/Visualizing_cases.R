###########  Figure (Maybe 2?) 
##### 확진자 수 단순 시각화하여 비교하기.


library(tidyverse)
library(readr)
library(readxl)
library(TTR)
library(zoo)
library(lubridate)

varicella <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/varicella/varicella_total.xlsx",
                        col_types = c("numeric", "numeric", "numeric", "date", "numeric", "numeric"))
whooping_cough <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/whooping_cough/whooping_cough_total.xlsx",
                             col_types = c("numeric", "numeric", "numeric", "date", "numeric", "numeric"))
mumps <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/mumps/mumps_total.xlsx",
                    col_types = c("numeric", "numeric", "numeric", "date", "numeric", "numeric"))
pneumococcal <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/pneumococcal_disease/pneumococcal_total.xlsx",
                           col_types = c("numeric", "numeric", "numeric", "date", "numeric", "numeric"))
scarlet_fever <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/scarlet_fever/scarlet_fever_total.xlsx",
                            col_types = c("numeric", "numeric", "numeric", "date", "numeric", "numeric"))


varicella <- varicella %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(year, week, cases_by_index1, cases_by_index2)

whooping <- whooping_cough %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(year, week, cases_by_index1, cases_by_index2)

mumps <- mumps %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(year, week, cases_by_index1, cases_by_index2)

pneumococcal <- pneumococcal %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(year, week, cases_by_index1, cases_by_index2)

scarlet <- scarlet_fever %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(year, week, cases_by_index1, cases_by_index2)


varicella_2016 <- varicella %>% 
  filter(year == 2016)
varicella_2017 <- varicella %>% 
  filter(year == 2017)
varicella_2018 <- varicella %>% 
  filter(year == 2018)
varicella_2019 <- varicella %>% 
  filter(year == 2019)
varicella_2020 <- varicella %>% 
  filter(year == 2020)
varicella_2021 <- varicella %>% 
  filter(year == 2021)

varicella_2016$ma <- rollmean(varicella_2016$cases_by_index1, k = 3, align = "center", fill = NA)
varicella_2017$ma <- rollmean(varicella_2017$cases_by_index1, k = 3, align = "center", fill = NA)
varicella_2018$ma <- rollmean(varicella_2018$cases_by_index1, k = 3, align = "center", fill = NA)
varicella_2019$ma <- rollmean(varicella_2019$cases_by_index1, k = 3, align = "center", fill = NA)
varicella_2020$ma <- rollmean(varicella_2020$cases_by_index1, k = 3, align = "center", fill = NA)
varicella_2021$ma <- rollmean(varicella_2021$cases_by_index1, k = 3, align = "center", fill = NA)

mumps_2016 <- mumps %>% 
  filter(year == 2016)
mumps_2017 <- mumps %>% 
  filter(year == 2017)
mumps_2018 <- mumps %>% 
  filter(year == 2018)
mumps_2019 <- mumps %>% 
  filter(year == 2019)
mumps_2020 <- mumps %>% 
  filter(year == 2020)
mumps_2021 <- mumps %>% 
  filter(year == 2021)

mumps_2016$ma <- rollmean(mumps_2016$cases_by_index1, k = 3, align = "center", fill = NA)
mumps_2017$ma <- rollmean(mumps_2017$cases_by_index1, k = 3, align = "center", fill = NA)
mumps_2018$ma <- rollmean(mumps_2018$cases_by_index1, k = 3, align = "center", fill = NA)
mumps_2019$ma <- rollmean(mumps_2019$cases_by_index1, k = 3, align = "center", fill = NA)
mumps_2020$ma <- rollmean(mumps_2020$cases_by_index1, k = 3, align = "center", fill = NA)
mumps_2021$ma <- rollmean(mumps_2021$cases_by_index1, k = 3, align = "center", fill = NA)

whooping_2016 <- whooping %>% 
  filter(year == 2016)
whooping_2017 <- whooping %>% 
  filter(year == 2017)
whooping_2018 <- whooping %>% 
  filter(year == 2018)
whooping_2019 <- whooping %>% 
  filter(year == 2019)
whooping_2020 <- whooping %>% 
  filter(year == 2020)
whooping_2021 <- whooping %>% 
  filter(year == 2021)

whooping_2016$ma <- rollmean(whooping_2016$cases_by_index1, k = 3, align = "center", fill = NA)
whooping_2017$ma <- rollmean(whooping_2017$cases_by_index1, k = 3, align = "center", fill = NA)
whooping_2018$ma <- rollmean(whooping_2018$cases_by_index1, k = 3, align = "center", fill = NA)
whooping_2019$ma <- rollmean(whooping_2019$cases_by_index1, k = 3, align = "center", fill = NA)
whooping_2020$ma <- rollmean(whooping_2020$cases_by_index1, k = 3, align = "center", fill = NA)
whooping_2021$ma <- rollmean(whooping_2021$cases_by_index1, k = 3, align = "center", fill = NA)

pneumococcal_2016 <- pneumococcal %>% 
  filter(year == 2016)
pneumococcal_2017 <- pneumococcal %>% 
  filter(year == 2017)
pneumococcal_2018 <- pneumococcal %>% 
  filter(year == 2018)
pneumococcal_2019 <- pneumococcal %>% 
  filter(year == 2019)
pneumococcal_2020 <- pneumococcal %>% 
  filter(year == 2020)
pneumococcal_2021 <- pneumococcal %>% 
  filter(year == 2021)

pneumococcal_2016$ma <- rollmean(pneumococcal_2016$cases_by_index1, k = 3, align = "center", fill = NA)
pneumococcal_2017$ma <- rollmean(pneumococcal_2017$cases_by_index1, k = 3, align = "center", fill = NA)
pneumococcal_2018$ma <- rollmean(pneumococcal_2018$cases_by_index1, k = 3, align = "center", fill = NA)
pneumococcal_2019$ma <- rollmean(pneumococcal_2019$cases_by_index1, k = 3, align = "center", fill = NA)
pneumococcal_2020$ma <- rollmean(pneumococcal_2020$cases_by_index1, k = 3, align = "center", fill = NA)
pneumococcal_2021$ma <- rollmean(pneumococcal_2021$cases_by_index1, k = 3, align = "center", fill = NA)

scarlet_2016 <- scarlet %>% 
  filter(year == 2016)
scarlet_2017 <- scarlet %>% 
  filter(year == 2017)
scarlet_2018 <- scarlet %>% 
  filter(year == 2018)
scarlet_2019 <- scarlet %>% 
  filter(year == 2019)
scarlet_2020 <- scarlet %>% 
  filter(year == 2020)
scarlet_2021 <- scarlet %>% 
  filter(year == 2021)

scarlet_2016$ma <- rollmean(scarlet_2016$cases_by_index1, k = 3, align = "center", fill = NA)
scarlet_2017$ma <- rollmean(scarlet_2017$cases_by_index1, k = 3, align = "center", fill = NA)
scarlet_2018$ma <- rollmean(scarlet_2018$cases_by_index1, k = 3, align = "center", fill = NA)
scarlet_2019$ma <- rollmean(scarlet_2019$cases_by_index1, k = 3, align = "center", fill = NA)
scarlet_2020$ma <- rollmean(scarlet_2020$cases_by_index1, k = 3, align = "center", fill = NA)
scarlet_2021$ma <- rollmean(scarlet_2021$cases_by_index1, k = 3, align = "center", fill = NA)

#################################################################################################

###### Varicella
ggplot() + geom_line(aes(x = week, y = ma), data = varicella_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= varicella_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= varicella_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= varicella_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= varicella_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = week, y = ma), data= varicella_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50))


###### Mumps
ggplot() + geom_line(aes(x = week, y = ma), data = mumps_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= mumps_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= mumps_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= mumps_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= mumps_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = week, y = ma), data= mumps_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50))


###### Whooping
ggplot() + geom_line(aes(x = week, y = ma), data = whooping_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= whooping_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= whooping_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= whooping_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= whooping_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = week, y = ma), data= whooping_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50))


###### Scarlet
ggplot() + geom_line(aes(x = week, y = ma), data = scarlet_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= scarlet_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= scarlet_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= scarlet_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= scarlet_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = week, y = ma), data= scarlet_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50))


###### Pneumococcal
ggplot() + geom_line(aes(x = week, y = ma), data = pneumococcal_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= pneumococcal_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= pneumococcal_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= pneumococcal_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = week, y = ma), data= pneumococcal_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = week, y = ma), data= pneumococcal_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = c(0, 10, 20, 30, 40, 50))











################################### Gastro-intestinal


tuberculosis_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/tuberculosis_monthly_2016-2021.xlsx")
hepatitis_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/hepatitis_A_monthly_2016-2021.xlsx")
shigellosis_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/shigellosis_monthly_2016-2021.xlsx")
enterohemorrhagic_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/enterohemorrhagic_monthly_2016-2021.xlsx")
typhoid_total <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/typhoid_monthly_2016-2021.csv")



typhoid_total <- typhoid_total %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
         year = year(Date),
         month = month(Date)
  ) %>% dplyr::select(Date, year,month, cases_by_index1, cases_by_index2)

hepatitis_total <- hepatitis_total %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
         year = year(Date),
         month = month(Date)
  ) %>% dplyr::select(Date, year,month, cases_by_index1, cases_by_index2)

shigellosis_total <- shigellosis_total %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
         year = year(Date),
         month = month(Date)
  ) %>% dplyr::select(Date, year,month, cases_by_index1, cases_by_index2)

enterohemorrhagic_total <- enterohemorrhagic_total %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
         year = year(Date),
         month = month(Date)
  ) %>% dplyr::select(Date, year,month, cases_by_index1, cases_by_index2)

tuberculosis_total <- tuberculosis_total %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
         year = year(Date),
         month = month(Date)
  ) %>% dplyr::select(Date, year, month, cases_by_index1, cases_by_index2)


typhoid_total$ma <- as.vector(rollmean(typhoid_total$cases_by_index1, k = 3, align = "center", fill = NA))
typhoid_2016 <- typhoid_total %>% 
  filter(year == 2016)
typhoid_2017 <- typhoid_total %>% 
  filter(year == 2017)
typhoid_2018 <- typhoid_total %>% 
  filter(year == 2018)
typhoid_2019 <- typhoid_total %>% 
  filter(year == 2019)
typhoid_2020 <- typhoid_total %>% 
  filter(year == 2020)
typhoid_2021 <- typhoid_total %>% 
  filter(year == 2021)


hepatitis_total$ma <- as.vector(rollmean(hepatitis_total$cases_by_index1, k = 3, align = "center", fill = NA))
hepatitis_2016 <- hepatitis_total %>% 
  filter(year == 2016)
hepatitis_2017 <- hepatitis_total %>% 
  filter(year == 2017)
hepatitis_2018 <- hepatitis_total %>% 
  filter(year == 2018)
hepatitis_2019 <- hepatitis_total %>% 
  filter(year == 2019)
hepatitis_2020 <- hepatitis_total %>% 
  filter(year == 2020)
hepatitis_2021 <- hepatitis_total %>% 
  filter(year == 2021)


shigellosis_total$ma <- as.vector(rollmean(shigellosis_total$cases_by_index1, k = 3, align = "center", fill = NA))
shigellosis_2016 <- shigellosis_total %>% 
  filter(year == 2016)
shigellosis_2017 <- shigellosis_total %>% 
  filter(year == 2017)
shigellosis_2018 <- shigellosis_total %>% 
  filter(year == 2018)
shigellosis_2019 <- shigellosis_total %>% 
  filter(year == 2019)
shigellosis_2020 <- shigellosis_total %>% 
  filter(year == 2020)
shigellosis_2021 <- shigellosis_total %>% 
  filter(year == 2021)

enterohemorrhagic_total$ma <- as.vector(rollmean(enterohemorrhagic_total$cases_by_index1, k = 3, align = "center", fill = NA))
enterohemorrhagic_2016 <- enterohemorrhagic_total %>% 
  filter(year == 2016)
enterohemorrhagic_2017 <- enterohemorrhagic_total %>% 
  filter(year == 2017)
enterohemorrhagic_2018 <- enterohemorrhagic_total %>% 
  filter(year == 2018)
enterohemorrhagic_2019 <- enterohemorrhagic_total %>% 
  filter(year == 2019)
enterohemorrhagic_2020 <- enterohemorrhagic_total %>% 
  filter(year == 2020)
enterohemorrhagic_2021 <- enterohemorrhagic_total %>% 
  filter(year == 2021)


tuberculosis_total$ma <- as.vector(rollmean(tuberculosis_total$cases_by_index1, k = 3, align = "center", fill = NA))
tuberculosis_2016 <- tuberculosis_total %>% 
  filter(year == 2016)
tuberculosis_2017 <- tuberculosis_total %>% 
  filter(year == 2017)
tuberculosis_2018 <- tuberculosis_total %>% 
  filter(year == 2018)
tuberculosis_2019 <- tuberculosis_total %>% 
  filter(year == 2019)
tuberculosis_2020 <- tuberculosis_total %>% 
  filter(year == 2020)
tuberculosis_2021 <- tuberculosis_total %>% 
  filter(year == 2021)


###### Typhoid
ggplot() + geom_line(aes(x = month, y = ma), data = typhoid_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= typhoid_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= typhoid_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= typhoid_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= typhoid_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= typhoid_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())



###### Tuberculosis
ggplot() + geom_line(aes(x = month, y = ma), data = tuberculosis_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= tuberculosis_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= tuberculosis_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= tuberculosis_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= tuberculosis_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= tuberculosis_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


###### Enterohermorrahagic
ggplot() + geom_line(aes(x = month, y = ma), data = enterohemorrhagic_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= enterohemorrhagic_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= enterohemorrhagic_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= enterohemorrhagic_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= enterohemorrhagic_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= enterohemorrhagic_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


###### Shigellosis
ggplot() + geom_line(aes(x = month, y = ma), data = shigellosis_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= shigellosis_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= shigellosis_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= shigellosis_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= shigellosis_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= shigellosis_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


###### Hepatitis
ggplot() + geom_line(aes(x = month, y = ma), data = hepatitis_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= hepatitis_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= hepatitis_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= hepatitis_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= hepatitis_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= hepatitis_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())





###########################################################
bovine_tuber <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Bovine/cow_tuber_monthly.csv"
)
#### 둘로 나누어져 있는 year, month 합치기
bovine_tuber$date <- as.Date(paste0(with(bovine_tuber, sprintf("%d-%d", year, month)), "-01"), format = "%Y-%m-%d")

bovine_tuber <- bovine_tuber %>% 
  dplyr::select(year, date, month, cases)

### cattle farm / numbers
bovine_farm <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/cattle_farm.csv"
)


bovine_tuber <- bovine_tuber %>% 
  left_join(bovine_farm, by = "year") %>% 
  mutate(cases_by_farm = cases / farms * 100000, # 10만 farms 당
         cases_by_numbers = cases / cattle_number * 1000000, # 100만 마리 당
  ) %>% dplyr::select(date, year, month, cases_by_farm, cases_by_numbers)


bovine_tuber$ma <- as.vector(rollmean(bovine_tuber$cases_by_farm, k = 3, align = "center", fill = NA))
bovine_tuber_2016 <- bovine_tuber %>% 
  filter(year == 2016)
bovine_tuber_2017 <- bovine_tuber %>% 
  filter(year == 2017)
bovine_tuber_2018 <- bovine_tuber %>% 
  filter(year == 2018)
bovine_tuber_2019 <- bovine_tuber %>% 
  filter(year == 2019)
bovine_tuber_2020 <- bovine_tuber %>% 
  filter(year == 2020)
bovine_tuber_2021 <- bovine_tuber %>% 
  filter(year == 2021)


###### bovine_tuber
ggplot() + geom_line(aes(x = month, y = ma), data = bovine_tuber_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_tuber_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_tuber_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_tuber_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_tuber_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= bovine_tuber_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


###########################################################
bovine_brucella <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Bovine/cow_brucella_monthly.csv"
)
#### 둘로 나누어져 있는 year, month 합치기
bovine_brucella$date <- as.Date(paste0(with(bovine_brucella, sprintf("%d-%d", year, month)), "-01"), format = "%Y-%m-%d")

bovine_brucella <- bovine_brucella %>% 
  dplyr::select(year, date, month, cases)

### cattle farm / numbers
bovine_farm <- read_csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/cattle_farm.csv"
)


bovine_brucella <- bovine_brucella %>% 
  left_join(bovine_farm, by = "year") %>% 
  mutate(cases_by_farm = cases / farms * 100000, # 10만 farms 당
         cases_by_numbers = cases / cattle_number * 1000000, # 100만 마리 당
  ) %>% dplyr::select(date, year, month, cases_by_farm, cases_by_numbers)


bovine_brucella$ma <- as.vector(rollmean(bovine_brucella$cases_by_farm, k = 3, align = "center", fill = NA))
bovine_brucella_2016 <- bovine_brucella %>% 
  filter(year == 2016)
bovine_brucella_2017 <- bovine_brucella %>% 
  filter(year == 2017)
bovine_brucella_2018 <- bovine_brucella %>% 
  filter(year == 2018)
bovine_brucella_2019 <- bovine_brucella %>% 
  filter(year == 2019)
bovine_brucella_2020 <- bovine_brucella %>% 
  filter(year == 2020)
bovine_brucella_2021 <- bovine_brucella %>% 
  filter(year == 2021)


###### bovine_brucella
ggplot() + geom_line(aes(x = month, y = ma), data = bovine_brucella_2016, col = "black", size = 0.8, lty = 4, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_brucella_2017, col = "black", size = 0.8, lty = 3, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_brucella_2018, col = "black", size = 0.8, lty = 2, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_brucella_2019, col = "black", size = 0.8, lty = 1, alpha = 0.8) +
  geom_line(aes(x = month, y = ma), data= bovine_brucella_2021, col = "#3333FF", size = 0.8, alpha = 0.9) +
  geom_line(aes(x = month, y = ma), data= bovine_brucella_2020, col = "#FF3333", size = 0.8, alpha = 0.9) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
