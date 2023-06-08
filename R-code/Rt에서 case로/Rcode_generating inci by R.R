setwd("D:/OneDrive/5_Ongoing research_project/28_infdiz_prediction/6_prediction_COVID/association")
setwd("C:/Users/kdmin/OneDrive/5_Ongoing research_project/28_infdiz_prediction/6_prediction_COVID/association")



raw<-read.csv("C:\\Users\\Taehee\\OneDrive\\바탕 화면\\My papers\\Modelling_KDMIN_작업중\\R-code\\Rt에서 case로\\final_lag1w.csv",stringsAsFactors = F)


head(raw)
names(raw)

dat2<-subset(raw, select=c("y80_omi","y80_omi_R"))

dat<-dat2[686:785,]

## Serial interval for omicron 2.9 (1.6)
beta=2.9/sqrt(1.6)
alpha = 2.9 * beta

rgamma(1,alpha, beta)
sum(dgamma(1:3,alpha, beta))
dgamma(1,alpha, beta)

###################################################
#Anne Cori et.al, “A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics,” American Journal of Epidemiology, vol.178, 2013. 

dat$est_inci<-NA
for(t in 3:nrow(dat)){ # 여기서 3부터 시작하는 이유는 3일 이하 값은 estimation이 1보다 작아서 그런 것이다. 숫자 뭘로 하든 어차피 계산되는 각 날짜 별 값은 다 같음.
  dat$est_inci[t]<- dat[t,2] * sum(dat[1:(t-1),1]*dgamma((t-1):1,alpha, beta)  )
}

## 여기에서 y80_omi가 신규확진자수, est_inci는 추정된 수.
dat

plot(dat[,c(1,3)])

plot(dat[,1],type="l",lwd=2)
lines(dat[,3],col=2,lwd=2)
lines(lowess(dat[,1],f=0.25)$y,col="blue",lwd=2 )


check.inci<-matrix(NA,nrow=13,ncol=2)

for(i in 1:13){
  check.inci[i,1]<-mean(dat[((7*i)+1):(7*(i+1)),1])
  check.inci[i,2]<-mean(dat[((7*i)+1):(7*(i+1)),3])
  
}

plot(check.inci[,2],type="l",lwd=2)
lines(check.inci[,1],col=2,lwd=2)

check.inci



?lowess
