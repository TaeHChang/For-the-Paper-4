########### Figure 1 

################ 시각화하기
library(lubridate)
library(readr); library(tidyverse)

covid_data_Korea <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\북한코로나과제\\COVID19 data\\covid_data_Korea.csv")
covid_data_Korea$date <- as.Date(covid_data_Korea$date) 
covid_data_Korea <- covid_data_Korea %>% 
  mutate(CFR = (total_deaths/total_cases) *100)
covid_data_Korea <- covid_data_Korea %>% 
  filter(date < "2023-01-01")
covid_data_Korea <- covid_data_Korea %>% 
  filter(date < "2022-01-01")

ggplot(data = covid_data_Korea) + geom_line(aes(x = date, y = CFR), col = "#FF6666", size = 0.8) +
  theme_bw()

# New cases, deaths
ggplot(data = covid_data_Korea) + geom_col(aes(x = date, y = new_cases), col = "#CCCCFF", alpha = 0.5) +
  geom_line(aes(x = date, y = new_cases_smoothed), col = "#0000FF", size = 1) + 
  geom_col(aes(x = date, y = new_deaths), col = "#FFCCCC", alpha = 0.5) + 
  geom_line(aes(x = date, y = new_deaths_smoothed), col = "#FF3333", size = 1) +
  theme_bw()

# Total cases, deaths
ggplot(data = covid_data_Korea) + geom_area(aes(x = date, y = total_cases), fill = "#CCCCFF", alpha = 0.5) +
  geom_line(aes(x = date, y = total_cases), col = "#0000FF", size = 1) +
  geom_area(aes(x = date, y = total_deaths), fill = "#FFCCCC", alpha = 0.5) +
  geom_line(aes(x = date, y =total_deaths), col = "#FF3333", size = 1) +
  theme_bw()

#  new cases and total deaths
ggplot(data = covid_data_Korea) + geom_col(aes(x = date, y = new_cases), col = "#CCCCFF", alpha = 0.5) +
  geom_line(aes(x = date, y = new_cases_smoothed), col = "#0000FF", size = 1) + 
  scale_x_date(date_labels = "%Y-%m-%d") + ylim(c(0, 15000)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())



