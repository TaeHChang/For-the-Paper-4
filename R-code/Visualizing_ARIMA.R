#### Visualizing ARIMA



library(tidyverse)
library(readr)
library(readxl)

varicella_forcast <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\varicella_total_rev.csv")         
pneumococcal_forcast <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\pneumococcal_total_rev.csv")         
scarlet_forcast <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\scarlet_total_rev.csv")         
whooping_forcast <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\whooping_total_rev.csv")         
mumps_forcast <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\mumps_total_rev.csv")   

varicella_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/varicella/varicella_total.xlsx")
whooping_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/whooping_cough/whooping_cough_total.xlsx")
mumps_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/mumps/mumps_total.xlsx")
pneumococcal_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/pneumococcal_disease/pneumococcal_total.xlsx")
scarlet_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/scarlet_fever/scarlet_fever_total.xlsx")


###########################################################################################################################
######### 안 쓰는 부분
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_typhoid.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_hepatitis.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_enterohemorrhagic.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_shigellosis.rda" )
load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_tuberculosis.rda" )

forcast_typhoid <- cbind(forcast_typhoid$lower,forcast_typhoid$mean,forcast_typhoid$upper)
forcast_hepatitis <- cbind(forcast_hepatitis$lower,forcast_hepatitis$mean,forcast_hepatitis$upper)
forcast_enterohemorrhagic <- cbind(forcast_enterohemorrhagic$lower,forcast_enterohemorrhagic$mean,forcast_enterohemorrhagic$upper)
forcast_shigellosis <- cbind(forcast_shigellosis$lower,forcast_shigellosis$mean,forcast_shigellosis$upper)
forcast_tuberculosis <- cbind(forcast_tuberculosis$lower,forcast_tuberculosis$mean,forcast_tuberculosis$upper)

forcast_enterohemorrhagic <- as_tibble(forcast_enterohemorrhagic) %>% 
  rename(est_lower80 = `forcast_enterohemorrhagic$lower.80%`,
         est_lower95 = `forcast_enterohemorrhagic$lower.95%`,
         est_mean = `forcast_enterohemorrhagic$mean`,
         est_upper80 = `forcast_enterohemorrhagic$upper.80%`,
         est_upper95 = `forcast_enterohemorrhagic$upper.95%`)

forcast_hepatitis <- as_tibble(forcast_hepatitis) %>% 
  rename(est_lower80 = `forcast_hepatitis$lower.80%`,
         est_lower95 = `forcast_hepatitis$lower.95%`,
         est_mean = `forcast_hepatitis$mean`,
         est_upper80 = `forcast_hepatitis$upper.80%`,
         est_upper95 = `forcast_hepatitis$upper.95%`)

forcast_shigellosis <- as_tibble(forcast_shigellosis) %>% 
  rename(est_lower80 = `forcast_shigellosis$lower.80%`,
         est_lower95 = `forcast_shigellosis$lower.95%`,
         est_mean = `forcast_shigellosis$mean`,
         est_upper80 = `forcast_shigellosis$upper.80%`,
         est_upper95 = `forcast_shigellosis$upper.95%`)

forcast_tuberculosis <- as_tibble(forcast_tuberculosis) %>% 
  rename(est_lower80 = `forcast_tuberculosis$lower.80%`,
         est_lower95 = `forcast_tuberculosis$lower.95%`,
         est_mean = `forcast_tuberculosis$mean`,
         est_upper80 = `forcast_tuberculosis$upper.80%`,
         est_upper95 = `forcast_tuberculosis$upper.95%`)

forcast_typhoid <- as_tibble(forcast_typhoid) %>% 
  rename(est_lower80 = `forcast_typhoid$lower.80%`,
         est_lower95 = `forcast_typhoid$lower.95%`,
         est_mean = `forcast_typhoid$mean`,
         est_upper80 = `forcast_typhoid$upper.80%`,
         est_upper95 = `forcast_typhoid$upper.95%`)

write.csv(forcast_typhoid, "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_typhoid.csv")
write.csv(forcast_shigellosis, "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_shigellosis.csv")
write.csv(forcast_tuberculosis, "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_tuberculosis.csv")
write.csv(forcast_enterohemorrhagic, "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_enterohemorrhagic.csv")
write.csv(forcast_hepatitis, "C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_hepatitis.csv")
################################################################################################################################


typhoid_forcast <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_typhoid.csv")
shigellosis_forcast <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_shigellosis.csv")
tuberculosis_forcast <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_tuberculosis.csv")
enterohemorrhagic_forcast <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_enterohemorrhagic.csv")
hepatitis_forcast <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Gastro_intestinal/forcast_hepatitis.csv")


tuberculosis_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/tuberculosis_monthly_2016-2021.xlsx")
hepatitis_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/hepatitis_A_monthly_2016-2021.xlsx")
shigellosis_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/shigellosis_monthly_2016-2021.xlsx")
enterohemorrhagic_total <- read_excel("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/enterohemorrhagic_monthly_2016-2021.xlsx")
typhoid_total <- read.csv("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Data/Gastro_intestinal_monthly/typhoid_monthly_2016-2021.csv")



################################################################################################################
#### Variacella

varicella_2016_2019 <- varicella_total[1:214,]
varicella_2020_2021 <- varicella_total[215:313,]
varicella_forcast <- as_tibble(varicella_forcast[19:117,])

varicella_2016_2019 <- varicella_2016_2019 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

varicella_2020_2021 <- varicella_2020_2021 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

varicella_forcast <- varicella_forcast %>% 
  mutate(est_mean_by_index1 = est_mean / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_mean_by_index2 = est_mean / index_2 * 1000000000,
         est_lower80_by_index1 = est_lower80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_lower80_by_index2 = est_lower80 / index_2 * 1000000000,
         est_upper80_by_index1 = est_upper80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_upper80_by_index2 = est_upper80 / index_2 * 1000000000,
  ) %>% dplyr::select(date, est_mean_by_index1, est_mean_by_index2, est_lower80_by_index1, 
                      est_lower80_by_index2, est_upper80_by_index1, est_upper80_by_index2, est_mean ,
                      est_lower80, est_upper80)

varicella_forcast$date <- as.Date(varicella_forcast$date)
varicella_2016_2019$date <- as.Date(varicella_2016_2019$date)
varicella_2020_2021$date <- as.Date(varicella_2020_2021$date)


### index_1
ggplot() + geom_line(aes(x = date, y = cases_by_index1), data = varicella_2016_2019, col = "black", size = 0.8) + 
     geom_line(aes(x = date, y = cases_by_index1), data= varicella_2020_2021, col = "#FF3333", size = 0.8) +
     geom_ribbon(aes(x = date, ymin = est_lower80_by_index1, 
                               ymax = est_upper80_by_index1), 
                              data= varicella_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
     geom_line(aes(x = date, y = est_mean_by_index1), data= varicella_forcast, col = "#3333FF", size = 0.8) +
     scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 1000)) +
     theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


### index_2
ggplot() + geom_line(aes(x = date, y = cases_by_index2), data = varicella_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index2), data= varicella_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index2, 
                  ymax = est_upper80_by_index2), 
              data= varicella_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index2), data= varicella_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 3500)) +
  theme_bw()


### Raw cases
ggplot() + geom_line(aes(x = date, y = cases), data = varicella_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases), data= varicella_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= varicella_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean), data= varicella_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 5000)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




#### mumps

mumps_2016_2019 <- mumps_total[1:214,]
mumps_2020_2021 <- mumps_total[215:313,]
mumps_forcast <- as_tibble(mumps_forcast[19:117,])

mumps_2016_2019 <- mumps_2016_2019 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

mumps_2020_2021 <- mumps_2020_2021 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

mumps_forcast <- mumps_forcast %>% 
  mutate(est_mean_by_index1 = est_mean / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_mean_by_index2 = est_mean / index_2 * 1000000000,
         est_lower80_by_index1 = est_lower80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_lower80_by_index2 = est_lower80 / index_2 * 1000000000,
         est_upper80_by_index1 = est_upper80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_upper80_by_index2 = est_upper80 / index_2 * 1000000000,
  ) %>% dplyr::select(date, est_mean_by_index1, est_mean_by_index2, est_lower80_by_index1, 
                      est_lower80_by_index2, est_upper80_by_index1, est_upper80_by_index2, est_mean ,
                      est_lower80, est_upper80)

mumps_forcast$date <- as.Date(mumps_forcast$date)
mumps_2016_2019$date <- as.Date(mumps_2016_2019$date)
mumps_2020_2021$date <- as.Date(mumps_2020_2021$date)


### index_1
ggplot() + geom_line(aes(x = date, y = cases_by_index1), data = mumps_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index1), data= mumps_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index1, 
                  ymax = est_upper80_by_index1), 
              data= mumps_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index1), data= mumps_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


### index_2
ggplot() + geom_line(aes(x = date, y = cases_by_index2), data = mumps_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index2), data= mumps_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index2, 
                  ymax = est_upper80_by_index2), 
              data= mumps_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index2), data= mumps_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()

### Raw cases
ggplot() + geom_line(aes(x = date, y = cases), data = mumps_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases), data= mumps_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= mumps_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean), data= mumps_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 1000)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())






#### scarlet

scarlet_2016_2019 <- scarlet_total[1:214,]
scarlet_2020_2021 <- scarlet_total[215:313,]
scarlet_forcast <- as_tibble(scarlet_forcast[19:117,])

scarlet_2016_2019 <- scarlet_2016_2019 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

scarlet_2020_2021 <- scarlet_2020_2021 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

scarlet_forcast <- scarlet_forcast %>% 
  mutate(est_mean_by_index1 = est_mean / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_mean_by_index2 = est_mean / index_2 * 1000000000,
         est_lower80_by_index1 = est_lower80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_lower80_by_index2 = est_lower80 / index_2 * 1000000000,
         est_upper80_by_index1 = est_upper80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_upper80_by_index2 = est_upper80 / index_2 * 1000000000,
  ) %>% dplyr::select(date, est_mean_by_index1, est_mean_by_index2, est_lower80_by_index1, 
                      est_lower80_by_index2, est_upper80_by_index1, est_upper80_by_index2, est_mean ,
                      est_lower80, est_upper80)

scarlet_forcast$date <- as.Date(scarlet_forcast$date)
scarlet_2016_2019$date <- as.Date(scarlet_2016_2019$date)
scarlet_2020_2021$date <- as.Date(scarlet_2020_2021$date)


### index_1
ggplot() + geom_line(aes(x = date, y = cases_by_index1), data = scarlet_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index1), data= scarlet_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index1, 
                  ymax = est_upper80_by_index1), 
              data= scarlet_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index1), data= scarlet_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


### index_2
ggplot() + geom_line(aes(x = date, y = cases_by_index2), data = scarlet_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index2), data= scarlet_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index2, 
                  ymax = est_upper80_by_index2), 
              data= scarlet_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index2), data= scarlet_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()

### Raw cases
ggplot() + geom_line(aes(x = date, y = cases), data = scarlet_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases), data= scarlet_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= scarlet_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean), data= scarlet_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 1000)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




#### whooping

whooping_2016_2019 <- whooping_total[1:214,]
whooping_2020_2021 <- whooping_total[215:313,]
whooping_forcast <- as_tibble(whooping_forcast[19:117,])

whooping_2016_2019 <- whooping_2016_2019 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

whooping_2020_2021 <- whooping_2020_2021 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

whooping_forcast <- whooping_forcast %>% 
  mutate(est_mean_by_index1 = est_mean / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_mean_by_index2 = est_mean / index_2 * 1000000000,
         est_lower80_by_index1 = est_lower80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_lower80_by_index2 = est_lower80 / index_2 * 1000000000,
         est_upper80_by_index1 = est_upper80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_upper80_by_index2 = est_upper80 / index_2 * 1000000000,
  ) %>% dplyr::select(date, est_mean_by_index1, est_mean_by_index2, est_lower80_by_index1, 
                      est_lower80_by_index2, est_upper80_by_index1, est_upper80_by_index2, est_mean ,
                      est_lower80, est_upper80)

whooping_forcast$date <- as.Date(whooping_forcast$date)
whooping_2016_2019$date <- as.Date(whooping_2016_2019$date)
whooping_2020_2021$date <- as.Date(whooping_2020_2021$date)


### index_1
ggplot() + geom_line(aes(x = date, y = cases_by_index1), data = whooping_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index1), data= whooping_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index1, 
                  ymax = est_upper80_by_index1), 
              data= whooping_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index1), data= whooping_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


### index_2
ggplot() + geom_line(aes(x = date, y = cases_by_index2), data = whooping_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index2), data= whooping_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index2, 
                  ymax = est_upper80_by_index2), 
              data= whooping_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index2), data= whooping_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()


### Raw cases
ggplot() + geom_line(aes(x = date, y = cases), data = whooping_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases), data= whooping_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= whooping_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean), data= whooping_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 200)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())





#### pneumococcal

pneumococcal_2016_2019 <- pneumococcal_total[1:214,]
pneumococcal_2020_2021 <- pneumococcal_total[215:313,]
pneumococcal_forcast <- as_tibble(pneumococcal_forcast[19:117,])

pneumococcal_2016_2019 <- pneumococcal_2016_2019 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

pneumococcal_2020_2021 <- pneumococcal_2020_2021 %>% 
  mutate(cases_by_index1 = cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = cases / index_2 * 1000000000,
  ) %>% dplyr::select(date, cases_by_index1, cases_by_index2, cases)

pneumococcal_forcast <- pneumococcal_forcast %>% 
  mutate(est_mean_by_index1 = est_mean / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_mean_by_index2 = est_mean / index_2 * 1000000000,
         est_lower80_by_index1 = est_lower80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_lower80_by_index2 = est_lower80 / index_2 * 1000000000,
         est_upper80_by_index1 = est_upper80 / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         est_upper80_by_index2 = est_upper80 / index_2 * 1000000000,
  ) %>% dplyr::select(date, est_mean_by_index1, est_mean_by_index2, est_lower80_by_index1, 
                      est_lower80_by_index2, est_upper80_by_index1, est_upper80_by_index2,  est_mean ,
                      est_lower80, est_upper80)

pneumococcal_forcast$date <- as.Date(pneumococcal_forcast$date)
pneumococcal_2016_2019$date <- as.Date(pneumococcal_2016_2019$date)
pneumococcal_2020_2021$date <- as.Date(pneumococcal_2020_2021$date)


### index_1
ggplot() + geom_line(aes(x = date, y = cases_by_index1), data = pneumococcal_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index1), data= pneumococcal_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index1, 
                  ymax = est_upper80_by_index1), 
              data= pneumococcal_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index1), data= pneumococcal_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


### index_2
ggplot() + geom_line(aes(x = date, y = cases_by_index2), data = pneumococcal_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases_by_index2), data= pneumococcal_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80_by_index2, 
                  ymax = est_upper80_by_index2), 
              data= pneumococcal_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean_by_index2), data= pneumococcal_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") +
  theme_bw()

### Raw cases
ggplot() + geom_line(aes(x = date, y = cases), data = pneumococcal_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = date, y = cases), data= pneumococcal_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= pneumococcal_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = date, y = est_mean), data= pneumococcal_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 50)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())







################################################################################################################
#### Typhoid

typhoid_2016_2019 <- typhoid_total[2:51,]
typhoid_2020_2021 <- typhoid_total[52:73,]
typhoid_forcast 

typhoid_2016_2019 <- typhoid_2016_2019 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)

typhoid_2020_2021 <- typhoid_2020_2021 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)


typhoid_forcast$Date <- as.Date(typhoid_forcast$Date)
typhoid_2016_2019$Date <- as.Date(typhoid_2016_2019$Date)
typhoid_2020_2021$Date <- as.Date(typhoid_2020_2021$Date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_index1), data = typhoid_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_index1), data= typhoid_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= typhoid_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = est_mean), data= typhoid_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 10)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




### shigellosis
shigellosis_2016_2019 <- shigellosis_total[2:51,]
shigellosis_2020_2021 <- shigellosis_total[52:73,]
shigellosis_forcast 

shigellosis_2016_2019 <- shigellosis_2016_2019 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)

shigellosis_2020_2021 <- shigellosis_2020_2021 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)


shigellosis_forcast$Date <- as.Date(shigellosis_forcast$Date)
shigellosis_2016_2019$Date <- as.Date(shigellosis_2016_2019$Date)
shigellosis_2020_2021$Date <- as.Date(shigellosis_2020_2021$Date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_index1), data = shigellosis_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_index1), data= shigellosis_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= shigellosis_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = est_mean), data= shigellosis_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 10)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




### tuberculosis
tuberculosis_2016_2019 <- tuberculosis_total[2:51,]
tuberculosis_2020_2021 <- tuberculosis_total[52:73,]
tuberculosis_forcast 

tuberculosis_2016_2019 <- tuberculosis_2016_2019 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)

tuberculosis_2020_2021 <- tuberculosis_2020_2021 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)


tuberculosis_forcast$Date <- as.Date(tuberculosis_forcast$Date)
tuberculosis_2016_2019$Date <- as.Date(tuberculosis_2016_2019$Date)
tuberculosis_2020_2021$Date <- as.Date(tuberculosis_2020_2021$Date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_index1), data = tuberculosis_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_index1), data= tuberculosis_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= tuberculosis_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = est_mean), data= tuberculosis_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 800)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




### enterohemorrhagic
enterohemorrhagic_2016_2019 <- enterohemorrhagic_total[2:51,]
enterohemorrhagic_2020_2021 <- enterohemorrhagic_total[52:73,]
enterohemorrhagic_forcast 

enterohemorrhagic_2016_2019 <- enterohemorrhagic_2016_2019 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)

enterohemorrhagic_2020_2021 <- enterohemorrhagic_2020_2021 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)


enterohemorrhagic_forcast$Date <- as.Date(enterohemorrhagic_forcast$Date)
enterohemorrhagic_2016_2019$Date <- as.Date(enterohemorrhagic_2016_2019$Date)
enterohemorrhagic_2020_2021$Date <- as.Date(enterohemorrhagic_2020_2021$Date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_index1), data = enterohemorrhagic_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_index1), data= enterohemorrhagic_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= enterohemorrhagic_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = est_mean), data= enterohemorrhagic_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 30)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())





### hepatitis
hepatitis_2016_2019 <- hepatitis_total[2:51,]
hepatitis_2020_2021 <- hepatitis_total[52:73,]
hepatitis_forcast 

hepatitis_2016_2019 <- hepatitis_2016_2019 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)

hepatitis_2020_2021 <- hepatitis_2020_2021 %>% 
  mutate(cases_by_index1 = Cases / index_1 * 10000000, ### 실진료인원 1천만 명 당 case
         cases_by_index2 = Cases / index_2 * 1000000000,
  ) %>% dplyr::select(Date, cases_by_index1, cases_by_index2)


hepatitis_forcast$Date <- as.Date(hepatitis_forcast$Date)
hepatitis_2016_2019$Date <- as.Date(hepatitis_2016_2019$Date)
hepatitis_2020_2021$Date <- as.Date(hepatitis_2020_2021$Date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_index1), data = hepatitis_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_index1), data= hepatitis_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = est_lower80, 
                  ymax = est_upper80), 
              data= hepatitis_forcast, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = est_mean), data= hepatitis_forcast, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 600)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




##########################################################################



### Bovine Tuberculosis
bovine_tuber_2016_2019 <- bovine_tuber[2:51,]
bovine_tuber_2020_2021 <- bovine_tuber[52:73,]
forcast_bovine_tuber <- as.data.frame(forcast_bovine_tuber)[1:22,] 

### 이미 farm 숫자 기반으로 계산 해놔서 이 부분 스킵

forcast_bovine_tuber$Date <- as.Date(bovine_tuber_2020_2021$date)
bovine_tuber_2016_2019$Date <- as.Date(bovine_tuber_2016_2019$date)
bovine_tuber_2020_2021$Date <- as.Date(bovine_tuber_2020_2021$date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_farm), data = bovine_tuber_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_farm), data= bovine_tuber_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = `Lo 80`, 
                  ymax = `Hi 80`), 
              data= forcast_bovine_tuber, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = `Point Forecast`), data= forcast_bovine_tuber, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 600)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())




### Bovine Brucellosis
bovine_brucella_2016_2019 <- bovine_brucella[2:51,]
bovine_brucella_2020_2021 <- bovine_brucella[52:73,]
forcast_bovine_brucella <- as.data.frame(forcast_bovine_brucella)[1:22,] 

### 이미 farm 숫자 기반으로 계산 해놔서 이 부분 스킵

forcast_bovine_brucella$Date <- as.Date(bovine_brucella_2020_2021$date)
bovine_brucella_2016_2019$Date <- as.Date(bovine_brucella_2016_2019$date)
bovine_brucella_2020_2021$Date <- as.Date(bovine_brucella_2020_2021$date)



### index_1
ggplot() + geom_line(aes(x = Date, y = cases_by_farm), data = bovine_brucella_2016_2019, col = "black", size = 0.8) + 
  geom_line(aes(x = Date, y = cases_by_farm), data= bovine_brucella_2020_2021, col = "#FF3333", size = 0.8) +
  geom_ribbon(aes(x = Date, ymin = `Lo 80`, 
                  ymax = `Hi 80`), 
              data= forcast_bovine_brucella, fill = "#3333FF", col = "#3333FF", alpha = 0.1) +
  geom_line(aes(x = Date, y = `Point Forecast`), data= forcast_bovine_brucella, col = "#3333FF", size = 0.8) +
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 300)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
