############ Line and dot plots
library(readr)
library(tidyverse)

######### dengue
dengue <- read.csv("D:\\Modelling_KDMIN\\Data\\dengue\\dengue.csv")

ggplot(dengue, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### enterohemorrhagic
enterohemorrhagic <- read.csv("D:\\Modelling_KDMIN\\Data\\enterohemorrhagic\\enterohemorrhagic.csv")

ggplot(enterohemorrhagic, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### hemorrhagic_fever
hemorrhagic_fever <- read.csv("D:\\Modelling_KDMIN\\Data\\hemorrhagic_fever\\hemorrhagic_fever.csv")

ggplot(hemorrhagic_fever, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### hepatitis_A
hepatitis_A <- read.csv("D:\\Modelling_KDMIN\\Data\\hepatitis_A\\hepatitis_A.csv")

ggplot(hepatitis_A, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### legionella
legionella <- read.csv("D:\\Modelling_KDMIN\\Data\\legionella\\legionella.csv")

ggplot(legionella, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### malaria
malaria <- read.csv("D:\\Modelling_KDMIN\\Data\\malaria\\malaria.csv")

ggplot(malaria, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### measles
measles <- read.csv("D:\\Modelling_KDMIN\\Data\\measles\\measles.csv")

ggplot(measles, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### mumps
mumps <- read.csv("D:\\Modelling_KDMIN\\Data\\mumps\\mumps.csv")

ggplot(mumps, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### pneumococcal
pneumococcal <- read.csv("D:\\Modelling_KDMIN\\Data\\pneumococcal\\pneumococcal.csv")

ggplot(pneumococcal, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### scarlet_fever
scarlet_fever <- read.csv("D:\\Modelling_KDMIN\\Data\\scarlet_fever\\scarlet_fever.csv")

ggplot(scarlet_fever, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### SFTS
SFTS <- read.csv("D:\\Modelling_KDMIN\\Data\\SFTS\\SFTS.csv")

ggplot(SFTS, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### shigellosis
shigellosis <- read.csv("D:\\Modelling_KDMIN\\Data\\shigellosis\\shigellosis.csv")

ggplot(shigellosis, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### tsutsugamushi
tsutsugamushi <- read.csv("D:\\Modelling_KDMIN\\Data\\tsutsugamushi\\tsutsugamushi.csv")

ggplot(tsutsugamushi, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### typhoid
typhoid <- read.csv("D:\\Modelling_KDMIN\\Data\\typhoid\\typhoid.csv")

ggplot(typhoid, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### varicella
varicella <- read.csv("D:\\Modelling_KDMIN\\Data\\varicella\\varicella.csv")

ggplot(varicella, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))


######### whooping_cough
whooping_cough <- read.csv("D:\\Modelling_KDMIN\\Data\\whooping_cough\\whooping_cough.csv")

ggplot(whooping_cough, aes(x = X, y = cases)) + geom_line(size = 0.9, alpha= 0.8) + 
  geom_smooth(method = 'gam', aes(color="gam")) + geom_smooth(method = 'loess', aes(color="loess"))











