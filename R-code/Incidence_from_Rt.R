################ Estimated incidence from Rt
################
library(tidyverse)
library(readr)
library(forecast)
library(zoo)

load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_varicella.rda" )

load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_whooping.rda" )

load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_mumps.rda" )

load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_pneumococcal.rda" )

load("C:/Users/Taehee/OneDrive/바탕 화면/My papers/Modelling_KDMIN_작업중/Arima/Moving_average/Respiratory/forcast_scarlet.rda" )

forcast_varicella 
forcast_whooping
forcast_mumps
forcast_pneumococcal
forcast_scarlet

varicella_Rt <- cbind(as.data.frame(forcast_varicella$mean), as.data.frame(forcast_varicella$lower),
                      as.data.frame(forcast_varicella$upper))
colnames(varicella_Rt) <- c("mean", "lower80", "lower95", "upper80", "upper95")
whooping_Rt <- cbind(as.data.frame(forcast_whooping$mean), as.data.frame(forcast_whooping$lower),
                      as.data.frame(forcast_whooping$upper))
colnames(whooping_Rt) <- c("mean", "lower80", "lower95", "upper80", "upper95")
mumps_Rt <- cbind(as.data.frame(forcast_mumps$mean), as.data.frame(forcast_mumps$lower),
                     as.data.frame(forcast_mumps$upper))
colnames(mumps_Rt) <- c("mean", "lower80", "lower95", "upper80", "upper95")
pneumococcal_Rt <- cbind(as.data.frame(forcast_pneumococcal$mean), as.data.frame(forcast_pneumococcal$lower),
                  as.data.frame(forcast_pneumococcal$upper))
colnames(pneumococcal_Rt) <- c("mean", "lower80", "lower95", "upper80", "upper95")
scarlet_Rt <- cbind(as.data.frame(forcast_scarlet$mean), as.data.frame(forcast_scarlet$lower),
                         as.data.frame(forcast_scarlet$upper))
colnames(scarlet_Rt) <- c("mean", "lower80", "lower95", "upper80", "upper95")

library(readxl)
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

varicella_1 <- varicella %>% 
  filter(year > 2019)
whooping_cough_1 <- whooping_cough %>% 
  filter(year > 2019)
mumps_1 <- mumps %>% 
  filter(year > 2019)
pneumococcal_1 <- pneumococcal %>% 
  filter(year > 2019)
scarlet_fever_1 <- scarlet_fever %>% 
  filter(year > 2019)

varicella_total <- cbind(varicella_1, varicella_Rt) 
whooping_total <- cbind(whooping_cough_1, whooping_Rt)
mumps_total <- cbind(mumps_1, mumps_Rt)
pneumococcal_total <- cbind(pneumococcal_1, pneumococcal_Rt)
scarlet_total <- cbind(scarlet_fever_1, scarlet_Rt)



######### Varicella #################

## Serial interval for varicella 14.0, std: 2.2
beta=14.0/sqrt(2.2)
alpha = 14.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 


varicella_total <- varicella_total %>% 
  dplyr::select(-year,-week)

varicella_R
varicella_meanR <- varicella_R[,c("`Mean(R)`", "`Quantile.0.25(R)`", "`Quantile.0.05(R)`", "`Quantile.0.75(R)`", "`Quantile.0.95(R)`")]

date <- as.data.frame(as.Date(varicella$date))
date <- date[1:306,]

varicella_meanR <- varicella_meanR %>% 
  cbind(date) 

varicella_meanR <- varicella_meanR %>% 
  dplyr::select(date, `Mean(R)`, `Quantile.0.25(R)`, `Quantile.0.05(R)`, `Quantile.0.75(R)`, `Quantile.0.95(R)`)

varicella_meanR <- cbind(varicella[197:209, 3], varicella_meanR[197:209,])

colnames(varicella_meanR) <- c("cases", "date", "mean", "lower80", "lower95", "upper80", "upper95")

varicella_total <- rbind(varicella_meanR, varicella_total)


varicella_total$est_mean<-NA
for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_mean[t]<- varicella_total[t,'mean'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

varicella_total$est_lower80<-NA
for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_lower80[t]<- varicella_total[t,'lower80'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

varicella_total$est_lower95<-NA
for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_lower95[t]<- varicella_total[t,'lower95'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

varicella_total$est_upper80<-NA
for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_upper80[t]<- varicella_total[t,'upper80'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

varicella_total$est_upper95<-NA
for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_upper95[t]<- varicella_total[t,'upper95'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

varicella_total






######### whooping #################

## Serial interval for whooping cough 22.8, std: 6.5
beta=22.8/sqrt(6.5)
alpha = 22.8 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 
whooping_total <- whooping_total %>% 
  dplyr::select(-year,-week)

whooping_R
whooping_meanR <- whooping_R$R[,c("Mean(R)", "Quantile.0.05(R)", "Quantile.0.25(R)", "Quantile.0.75(R)", "Quantile.0.95(R)")]

whooping_meanR <- whooping_meanR %>% 
  cbind(date) 

whooping_meanR <- whooping_meanR %>% 
  dplyr::select(date, `Mean(R)`, `Quantile.0.25(R)`, `Quantile.0.05(R)`, `Quantile.0.75(R)`, `Quantile.0.95(R)`)

whooping_meanR <- cbind(whooping_cough[197:209, 3], whooping_meanR[197:209,])

colnames(whooping_meanR) <- c("cases", "date", "mean", "lower80", "lower95", "upper80", "upper95")

whooping_total <- rbind(whooping_meanR, whooping_total)

whooping_total$est_mean<-NA
for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_mean[t]<- whooping_total[t,'mean'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

whooping_total$est_lower80<-NA
for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_lower80[t]<- whooping_total[t,'lower80'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

whooping_total$est_lower95<-NA
for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_lower95[t]<- whooping_total[t,'lower95'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

whooping_total$est_upper80<-NA
for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_upper80[t]<- whooping_total[t,'upper80'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

whooping_total$est_upper95<-NA
for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_upper95[t]<- whooping_total[t,'upper95'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

whooping_total






######### mumps #################

## Serial interval for mumps 18.0, std: 3.5
beta=18.0/sqrt(3.5)
alpha = 18.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 
mumps_total <- mumps_total %>% 
  dplyr::select(-year,-week)

mumps_R
mumps_meanR <- mumps_R$R[,c("Mean(R)", "Quantile.0.05(R)", "Quantile.0.25(R)", "Quantile.0.75(R)", "Quantile.0.95(R)")]

mumps_meanR <- mumps_meanR %>% 
  cbind(date) 

mumps_meanR <- mumps_meanR %>% 
  dplyr::select(date, `Mean(R)`, `Quantile.0.25(R)`, `Quantile.0.05(R)`, `Quantile.0.75(R)`, `Quantile.0.95(R)`)

mumps_meanR <- cbind(mumps[197:209, 3], mumps_meanR[197:209,])

colnames(mumps_meanR) <- c("cases", "date", "mean", "lower80", "lower95", "upper80", "upper95")

mumps_total <- rbind(mumps_meanR, mumps_total)

mumps_total$est_mean<-NA
for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_mean[t]<- mumps_total[t,'mean'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

mumps_total$est_lower80<-NA
for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_lower80[t]<- mumps_total[t,'lower80'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

mumps_total$est_lower95<-NA
for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_lower95[t]<- mumps_total[t,'lower95'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

mumps_total$est_upper80<-NA
for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_upper80[t]<- mumps_total[t,'upper80'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

mumps_total$est_upper95<-NA
for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_upper95[t]<- mumps_total[t,'upper95'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

mumps_total





######### pneumococcal #################

## Serial interval for pneumococcal 6.6, std: 1.8
beta=6.6/sqrt(1.8)
alpha = 6.6 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 
pneumococcal_total <- pneumococcal_total %>% 
  dplyr::select(-year,-week)

pneumococcal_R
pneumococcal_meanR <- pneumococcal_R$R[,c("Mean(R)", "Quantile.0.05(R)", "Quantile.0.25(R)", "Quantile.0.75(R)", "Quantile.0.95(R)")]

pneumococcal_meanR <- pneumococcal_meanR %>% 
  cbind(date) 

pneumococcal_meanR <- pneumococcal_meanR %>% 
  dplyr::select(date, `Mean(R)`, `Quantile.0.25(R)`, `Quantile.0.05(R)`, `Quantile.0.75(R)`, `Quantile.0.95(R)`)

pneumococcal_meanR <- cbind(pneumococcal[197:209, 3], pneumococcal_meanR[197:209,])

colnames(pneumococcal_meanR) <- c("cases", "date", "mean", "lower80", "lower95", "upper80", "upper95")

pneumococcal_total <- rbind(pneumococcal_meanR, pneumococcal_total)

pneumococcal_total$est_mean<-NA
for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_mean[t]<- pneumococcal_total[t,'mean'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

pneumococcal_total$est_lower80<-NA
for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_lower80[t]<- pneumococcal_total[t,'lower80'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

pneumococcal_total$est_lower95<-NA
for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_lower95[t]<- pneumococcal_total[t,'lower95'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

pneumococcal_total$est_upper80<-NA
for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_upper80[t]<- pneumococcal_total[t,'upper80'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

pneumococcal_total$est_upper95<-NA
for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_upper95[t]<- pneumococcal_total[t,'upper95'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

pneumococcal_total






######### Scarlet fever #################

## Serial interval for Scarlet fever 14.0, std: 4.9
beta=14.0/sqrt(4.9)
alpha = 14.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 
scarlet_total <- scarlet_total %>% 
  dplyr::select(-year,-week)

scarlet_fever_R
scarlet_meanR <- scarlet_fever_R$R[,c("Mean(R)", "Quantile.0.05(R)", "Quantile.0.25(R)", "Quantile.0.75(R)", "Quantile.0.95(R)")]

scarlet_meanR <- scarlet_meanR %>% 
  cbind(date) 

scarlet_meanR <- scarlet_meanR %>% 
  dplyr::select(date, `Mean(R)`, `Quantile.0.25(R)`, `Quantile.0.05(R)`, `Quantile.0.75(R)`, `Quantile.0.95(R)`)

scarlet_meanR <- cbind(scarlet_fever[197:209, 3], scarlet_meanR[197:209,])

colnames(scarlet_meanR) <- c("cases", "date", "mean", "lower80", "lower95", "upper80", "upper95")

scarlet_total <- rbind(scarlet_meanR, scarlet_total)

scarlet_total$est_mean<-NA
for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_mean[t]<- scarlet_total[t,'mean'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

scarlet_total$est_lower80<-NA
for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_lower80[t]<- scarlet_total[t,'lower80'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

scarlet_total$est_lower95<-NA
for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_lower95[t]<- scarlet_total[t,'lower95'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

scarlet_total$est_upper80<-NA
for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_upper80[t]<- scarlet_total[t,'upper80'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

scarlet_total$est_upper95<-NA
for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_upper95[t]<- scarlet_total[t,'upper95'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

scarlet_total



setwd("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory")
write.csv(varicella_total, "varicella_total.csv")
write.csv(mumps_total, "mumps_total.csv")
write.csv(whooping_total, "whooping_total.csv")
write.csv(pneumococcal_total, "pneumococcal_total.csv")
write.csv(scarlet_total, "scarlet_total.csv")
























#################################################################################################################
### 이미 계산을 한 번 해놨고, 2019년 데이터 일부를 가지고 있어서 그걸로 해보기
varicella_total <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\varicella_total.csv")

######### Varicella #################

## Serial interval for varicella 14.0, std: 2.2
beta=14.0/sqrt(2.2)
alpha = 14.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 



lim <- nrow(varicella_total)
a <- seq(from = 0, to = 96, by = 4)
for(t in 21:lim){ 
  varicella_total$est_mean[t]<- varicella_total[t,'mean'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}
varicella_total[1:18,'est_mean'] <- varicella_total[1:18,'cases']

for(i in a){
for(t in (21+i):lim){ 
  varicella_total$est_mean[t] <- varicella_total[t,'mean'] * sum(varicella_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
}
}


for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_lower80[t]<- varicella_total[t,'lower80'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    varicella_total$est_lower80[t] <- varicella_total[t,'lower80'] * sum(varicella_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_lower95[t]<- varicella_total[t,'lower95'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    varicella_total$est_lower95[t] <- varicella_total[t,'lower95'] * sum(varicella_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_upper80[t]<- varicella_total[t,'upper80'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    varicella_total$est_upper80[t] <- varicella_total[t,'upper80'] * sum(varicella_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(varicella_total)){ 
  varicella_total$est_upper95[t]<- varicella_total[t,'upper95'] * sum(varicella_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    varicella_total$est_upper95[t] <- varicella_total[t,'upper95'] * sum(varicella_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


varicella_total
write.csv(varicella_total, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\varicella_total_rev.csv")






#################################################################################################################
### 이미 계산을 한 번 해놨고, 2019년 데이터 일부를 가지고 있어서 그걸로 해보기
scarlet_total <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\scarlet_total.csv")

######### scarlet #################

## Serial interval for Scarlet fever 14.0, std: 4.9
beta=14.0/sqrt(4.9)
alpha = 14.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)


#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 



lim <- nrow(scarlet_total)
a <- seq(from = 0, to = 96, by = 4)
for(t in 21:lim){ 
  scarlet_total$est_mean[t]<- scarlet_total[t,'mean'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}
scarlet_total[1:18,'est_mean'] <- scarlet_total[1:18,'cases']

for(i in a){
  for(t in (21+i):lim){ 
    scarlet_total$est_mean[t] <- scarlet_total[t,'mean'] * sum(scarlet_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_lower80[t]<- scarlet_total[t,'lower80'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    scarlet_total$est_lower80[t] <- scarlet_total[t,'lower80'] * sum(scarlet_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_lower95[t]<- scarlet_total[t,'lower95'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    scarlet_total$est_lower95[t] <- scarlet_total[t,'lower95'] * sum(scarlet_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_upper80[t]<- scarlet_total[t,'upper80'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    scarlet_total$est_upper80[t] <- scarlet_total[t,'upper80'] * sum(scarlet_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(scarlet_total)){ 
  scarlet_total$est_upper95[t]<- scarlet_total[t,'upper95'] * sum(scarlet_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    scarlet_total$est_upper95[t] <- scarlet_total[t,'upper95'] * sum(scarlet_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


scarlet_total
write.csv(scarlet_total, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\scarlet_total_rev.csv")






#################################################################################################################
### 이미 계산을 한 번 해놨고, 2019년 데이터 일부를 가지고 있어서 그걸로 해보기
whooping_total <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\whooping_total.csv")

######### whooping #################

## Serial interval for whooping cough 22.8, std: 6.5
beta=22.8/sqrt(6.5)
alpha = 22.8 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 



lim <- nrow(whooping_total)
a <- seq(from = 0, to = 96, by = 4)
for(t in 21:lim){ 
  whooping_total$est_mean[t]<- whooping_total[t,'mean'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}
whooping_total[1:18,'est_mean'] <- whooping_total[1:18,'cases']

for(i in a){
  for(t in (21+i):lim){ 
    whooping_total$est_mean[t] <- whooping_total[t,'mean'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_lower80[t]<- whooping_total[t,'lower80'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    whooping_total$est_lower80[t] <- whooping_total[t,'lower80'] * sum(whooping_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_lower95[t]<- whooping_total[t,'lower95'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    whooping_total$est_lower95[t] <- whooping_total[t,'lower95'] * sum(whooping_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_upper80[t]<- whooping_total[t,'upper80'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    whooping_total$est_upper80[t] <- whooping_total[t,'upper80'] * sum(whooping_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(whooping_total)){ 
  whooping_total$est_upper95[t]<- whooping_total[t,'upper95'] * sum(whooping_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    whooping_total$est_upper95[t] <- whooping_total[t,'upper95'] * sum(whooping_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


whooping_total
write.csv(whooping_total, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\whooping_total_rev.csv")







#################################################################################################################
### 이미 계산을 한 번 해놨고, 2019년 데이터 일부를 가지고 있어서 그걸로 해보기
mumps_total <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\mumps_total.csv")

######### mumps #################

## Serial interval for mumps 18.0, std: 3.5
beta=18.0/sqrt(3.5)
alpha = 18.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)


#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 



lim <- nrow(mumps_total)
a <- seq(from = 0, to = 96, by = 8)
for(t in 21:lim){ 
  mumps_total$est_mean[t]<- mumps_total[t,'mean'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}
mumps_total[1:18,'est_mean'] <- mumps_total[1:18,'cases']

for(i in a){
  for(t in (21+i):lim){ 
    mumps_total$est_mean[t] <- mumps_total[t,'mean'] * sum(mumps_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_lower80[t]<- mumps_total[t,'lower80'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    mumps_total$est_lower80[t] <- mumps_total[t,'lower80'] * sum(mumps_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_lower95[t]<- mumps_total[t,'lower95'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    mumps_total$est_lower95[t] <- mumps_total[t,'lower95'] * sum(mumps_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_upper80[t]<- mumps_total[t,'upper80'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    mumps_total$est_upper80[t] <- mumps_total[t,'upper80'] * sum(mumps_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(mumps_total)){ 
  mumps_total$est_upper95[t]<- mumps_total[t,'upper95'] * sum(mumps_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    mumps_total$est_upper95[t] <- mumps_total[t,'upper95'] * sum(mumps_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


mumps_total
write.csv(mumps_total, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\mumps_total_rev.csv")





#################################################################################################################
### 이미 계산을 한 번 해놨고, 2019년 데이터 일부를 가지고 있어서 그걸로 해보기
pneumococcal_total <- read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\pneumococcal_total.csv")

######### pneumococcal #################

## Serial interval for pneumococcal 18.0, std: 3.5
beta=18.0/sqrt(3.5)
alpha = 18.0 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)


#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 



lim <- nrow(pneumococcal_total)
a <- seq(from = 0, to = 96, by = 8)
for(t in 21:lim){ 
  pneumococcal_total$est_mean[t]<- pneumococcal_total[t,'mean'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}
pneumococcal_total[1:18,'est_mean'] <- pneumococcal_total[1:18,'cases']

for(i in a){
  for(t in (21+i):lim){ 
    pneumococcal_total$est_mean[t] <- pneumococcal_total[t,'mean'] * sum(pneumococcal_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_lower80[t]<- pneumococcal_total[t,'lower80'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    pneumococcal_total$est_lower80[t] <- pneumococcal_total[t,'lower80'] * sum(pneumococcal_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_lower95[t]<- pneumococcal_total[t,'lower95'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    pneumococcal_total$est_lower95[t] <- pneumococcal_total[t,'lower95'] * sum(pneumococcal_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_upper80[t]<- pneumococcal_total[t,'upper80'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    pneumococcal_total$est_upper80[t] <- pneumococcal_total[t,'upper80'] * sum(pneumococcal_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}

for(t in 21:nrow(pneumococcal_total)){ 
  pneumococcal_total$est_upper95[t]<- pneumococcal_total[t,'upper95'] * sum(pneumococcal_total[1:(t-1),'cases']*dgamma((t-1):1,alpha, beta)  )
}

for(i in a){
  for(t in (21+i):lim){ 
    pneumococcal_total$est_upper95[t] <- pneumococcal_total[t,'upper95'] * sum(pneumococcal_total[1:(t-1),'est_mean']*dgamma((t-1):1,alpha, beta))
  }
}


pneumococcal_total
write.csv(pneumococcal_total, "C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\Arima\\Moving_average\\Respiratory\\pneumococcal_total_rev.csv")
