########### Data processing

library(tidyverse)
library(readr)



########### Dengue fever
dengue_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2010.csv", 
                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2010 <- dengue_2010[-1, ,drop = FALSE]
rownames(dengue_2010) <- c(rep(201001:(201000 + nrow(dengue_2010))))
dengue_2010 <- rownames_to_column(dengue_2010, var = "year") 

dengue_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2011.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2011 <- dengue_2011[-1, ,drop = FALSE]
rownames(dengue_2011) <- c(rep(201101:(201100 + nrow(dengue_2011))))
dengue_2011 <- rownames_to_column(dengue_2011, var = "year") 

dengue_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2012.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2012 <- dengue_2012[-1, ,drop = FALSE]
rownames(dengue_2012) <- c(rep(201201:(201200 + nrow(dengue_2012))))
dengue_2012 <- rownames_to_column(dengue_2012, var = "year") 

dengue_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2013.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2013 <- dengue_2013[-1, ,drop = FALSE]
rownames(dengue_2013) <- c(rep(201301:(201300 + nrow(dengue_2013))))
dengue_2013 <- rownames_to_column(dengue_2013, var = "year") 

dengue_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2014.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2014 <- dengue_2014[-1, ,drop = FALSE]
rownames(dengue_2014) <- c(rep(201401:(201400 + nrow(dengue_2014))))
dengue_2014 <- rownames_to_column(dengue_2014, var = "year")

dengue_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2015.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2015 <- dengue_2015[-1, ,drop = FALSE]
rownames(dengue_2015) <- c(rep(201501:(201500 + nrow(dengue_2015))))
dengue_2015 <- rownames_to_column(dengue_2015, var = "year")

dengue_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2016.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2016 <- dengue_2016[-1, ,drop = FALSE]
rownames(dengue_2016) <- c(rep(201601:(201600 + nrow(dengue_2016))))
dengue_2016 <- rownames_to_column(dengue_2016, var = "year")

dengue_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2017.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2017 <- dengue_2017[-1, ,drop = FALSE]
rownames(dengue_2017) <- c(rep(201701:(201700 + nrow(dengue_2017))))
dengue_2017 <- rownames_to_column(dengue_2017, var = "year")

dengue_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2018.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2018 <- dengue_2018[-1, ,drop = FALSE]
rownames(dengue_2018) <- c(rep(201801:(201800 + nrow(dengue_2018))))
dengue_2018 <- rownames_to_column(dengue_2018, var = "year")

dengue_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2019.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2019 <- dengue_2019[-1, ,drop = FALSE]
rownames(dengue_2019) <- c(rep(201901:(201900 + nrow(dengue_2019))))
dengue_2019 <- rownames_to_column(dengue_2019, var = "year")

dengue_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2020.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2020 <- dengue_2020[-1, ,drop = FALSE]
rownames(dengue_2020) <- c(rep(202001:(202000 + nrow(dengue_2020))))
dengue_2020 <- rownames_to_column(dengue_2020, var = "year")

dengue_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2021.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2021 <- dengue_2021[-1, ,drop = FALSE]
rownames(dengue_2021) <- c(rep(202101:(202100 + nrow(dengue_2021))))
dengue_2021 <- rownames_to_column(dengue_2021, var = "year")

dengue_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/dengue/dengue_2022.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
dengue_2022 <- dengue_2022[-1, ,drop = FALSE]
rownames(dengue_2022) <- c(rep(202201:(202200 + nrow(dengue_2022))))
dengue_2022 <- rownames_to_column(dengue_2022, var = "year")

Dengue <- rbind(dengue_2010, dengue_2011, dengue_2012, dengue_2013, dengue_2014, dengue_2015, dengue_2016,
                dengue_2017, dengue_2018, dengue_2019, dengue_2020, dengue_2021, dengue_2022)

Dengue <- na.omit(Dengue)
colnames(Dengue) <- c("year", "cases")
write.csv(Dengue, "D:\\Modelling_KDMIN\\Data\\dengue\\dengue.csv")


########### Enterohemorrhagic
enterohemorrhagic_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2010.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2010 <- enterohemorrhagic_2010[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2010) <- c(rep(201001:(201000 + nrow(enterohemorrhagic_2010))))
enterohemorrhagic_2010 <- rownames_to_column(enterohemorrhagic_2010, var = "year") 

enterohemorrhagic_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2011.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2011 <- enterohemorrhagic_2011[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2011) <- c(rep(201101:(201100 + nrow(enterohemorrhagic_2011))))
enterohemorrhagic_2011 <- rownames_to_column(enterohemorrhagic_2011, var = "year") 

enterohemorrhagic_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2012.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2012 <- enterohemorrhagic_2012[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2012) <- c(rep(201201:(201200 + nrow(enterohemorrhagic_2012))))
enterohemorrhagic_2012 <- rownames_to_column(enterohemorrhagic_2012, var = "year") 

enterohemorrhagic_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2013.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2013 <- enterohemorrhagic_2013[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2013) <- c(rep(201301:(201300 + nrow(enterohemorrhagic_2013))))
enterohemorrhagic_2013 <- rownames_to_column(enterohemorrhagic_2013, var = "year") 

enterohemorrhagic_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2014.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2014 <- enterohemorrhagic_2014[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2014) <- c(rep(201401:(201400 + nrow(enterohemorrhagic_2014))))
enterohemorrhagic_2014 <- rownames_to_column(enterohemorrhagic_2014, var = "year")

enterohemorrhagic_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2015.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2015 <- enterohemorrhagic_2015[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2015) <- c(rep(201501:(201500 + nrow(enterohemorrhagic_2015))))
enterohemorrhagic_2015 <- rownames_to_column(enterohemorrhagic_2015, var = "year")

enterohemorrhagic_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2016.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2016 <- enterohemorrhagic_2016[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2016) <- c(rep(201601:(201600 + nrow(enterohemorrhagic_2016))))
enterohemorrhagic_2016 <- rownames_to_column(enterohemorrhagic_2016, var = "year")

enterohemorrhagic_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2017.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2017 <- enterohemorrhagic_2017[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2017) <- c(rep(201701:(201700 + nrow(enterohemorrhagic_2017))))
enterohemorrhagic_2017 <- rownames_to_column(enterohemorrhagic_2017, var = "year")

enterohemorrhagic_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2018.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2018 <- enterohemorrhagic_2018[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2018) <- c(rep(201801:(201800 + nrow(enterohemorrhagic_2018))))
enterohemorrhagic_2018 <- rownames_to_column(enterohemorrhagic_2018, var = "year")

enterohemorrhagic_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2019.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2019 <- enterohemorrhagic_2019[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2019) <- c(rep(201901:(201900 + nrow(enterohemorrhagic_2019))))
enterohemorrhagic_2019 <- rownames_to_column(enterohemorrhagic_2019, var = "year")

enterohemorrhagic_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2020.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2020 <- enterohemorrhagic_2020[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2020) <- c(rep(202001:(202000 + nrow(enterohemorrhagic_2020))))
enterohemorrhagic_2020 <- rownames_to_column(enterohemorrhagic_2020, var = "year")

enterohemorrhagic_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2021.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2021 <- enterohemorrhagic_2021[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2021) <- c(rep(202101:(202100 + nrow(enterohemorrhagic_2021))))
enterohemorrhagic_2021 <- rownames_to_column(enterohemorrhagic_2021, var = "year")

enterohemorrhagic_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/enterohemorrhagic/enterohemorrhagic_2022.csv", 
                                        col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
enterohemorrhagic_2022 <- enterohemorrhagic_2022[-1, ,drop = FALSE]
rownames(enterohemorrhagic_2022) <- c(rep(202201:(202200 + nrow(enterohemorrhagic_2022))))
enterohemorrhagic_2022 <- rownames_to_column(enterohemorrhagic_2022, var = "year")

enterohemorrhagic <- rbind(enterohemorrhagic_2010, enterohemorrhagic_2011, enterohemorrhagic_2012, enterohemorrhagic_2013, enterohemorrhagic_2014, enterohemorrhagic_2015, enterohemorrhagic_2016,
                enterohemorrhagic_2017, enterohemorrhagic_2018, enterohemorrhagic_2019, enterohemorrhagic_2020, enterohemorrhagic_2021, enterohemorrhagic_2022)

enterohemorrhagic <- na.omit(enterohemorrhagic)
colnames(enterohemorrhagic) <- c("year", "cases")
write.csv(enterohemorrhagic, "D:\\Modelling_KDMIN\\Data\\enterohemorrhagic\\enterohemorrhagic.csv")



########### hepatitis_A
hepatitis_A_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2011.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2011 <- hepatitis_A_2011[-1, ,drop = FALSE]
rownames(hepatitis_A_2011) <- c(rep(201101:(201100 + nrow(hepatitis_A_2011))))
hepatitis_A_2011 <- rownames_to_column(hepatitis_A_2011, var = "year") 

hepatitis_A_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2012.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2012 <- hepatitis_A_2012[-1, ,drop = FALSE]
rownames(hepatitis_A_2012) <- c(rep(201201:(201200 + nrow(hepatitis_A_2012))))
hepatitis_A_2012 <- rownames_to_column(hepatitis_A_2012, var = "year") 

hepatitis_A_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2013.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2013 <- hepatitis_A_2013[-1, ,drop = FALSE]
rownames(hepatitis_A_2013) <- c(rep(201301:(201300 + nrow(hepatitis_A_2013))))
hepatitis_A_2013 <- rownames_to_column(hepatitis_A_2013, var = "year") 

hepatitis_A_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2014.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2014 <- hepatitis_A_2014[-1, ,drop = FALSE]
rownames(hepatitis_A_2014) <- c(rep(201401:(201400 + nrow(hepatitis_A_2014))))
hepatitis_A_2014 <- rownames_to_column(hepatitis_A_2014, var = "year")

hepatitis_A_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2015.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2015 <- hepatitis_A_2015[-1, ,drop = FALSE]
rownames(hepatitis_A_2015) <- c(rep(201501:(201500 + nrow(hepatitis_A_2015))))
hepatitis_A_2015 <- rownames_to_column(hepatitis_A_2015, var = "year")

hepatitis_A_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2016.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2016 <- hepatitis_A_2016[-1, ,drop = FALSE]
rownames(hepatitis_A_2016) <- c(rep(201601:(201600 + nrow(hepatitis_A_2016))))
hepatitis_A_2016 <- rownames_to_column(hepatitis_A_2016, var = "year")

hepatitis_A_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2017.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2017 <- hepatitis_A_2017[-1, ,drop = FALSE]
rownames(hepatitis_A_2017) <- c(rep(201701:(201700 + nrow(hepatitis_A_2017))))
hepatitis_A_2017 <- rownames_to_column(hepatitis_A_2017, var = "year")

hepatitis_A_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2018.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2018 <- hepatitis_A_2018[-1, ,drop = FALSE]
rownames(hepatitis_A_2018) <- c(rep(201801:(201800 + nrow(hepatitis_A_2018))))
hepatitis_A_2018 <- rownames_to_column(hepatitis_A_2018, var = "year")

hepatitis_A_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2019.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2019 <- hepatitis_A_2019[-1, ,drop = FALSE]
rownames(hepatitis_A_2019) <- c(rep(201901:(201900 + nrow(hepatitis_A_2019))))
hepatitis_A_2019 <- rownames_to_column(hepatitis_A_2019, var = "year")

hepatitis_A_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2020.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2020 <- hepatitis_A_2020[-1, ,drop = FALSE]
rownames(hepatitis_A_2020) <- c(rep(202001:(202000 + nrow(hepatitis_A_2020))))
hepatitis_A_2020 <- rownames_to_column(hepatitis_A_2020, var = "year")

hepatitis_A_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2021.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2021 <- hepatitis_A_2021[-1, ,drop = FALSE]
rownames(hepatitis_A_2021) <- c(rep(202101:(202100 + nrow(hepatitis_A_2021))))
hepatitis_A_2021 <- rownames_to_column(hepatitis_A_2021, var = "year")

hepatitis_A_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hepatitis_A/hepatitis_A_2022.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hepatitis_A_2022 <- hepatitis_A_2022[-1, ,drop = FALSE]
rownames(hepatitis_A_2022) <- c(rep(202201:(202200 + nrow(hepatitis_A_2022))))
hepatitis_A_2022 <- rownames_to_column(hepatitis_A_2022, var = "year")

hepatitis_A <- rbind(hepatitis_A_2011, hepatitis_A_2012, hepatitis_A_2013, hepatitis_A_2014, hepatitis_A_2015, hepatitis_A_2016,
                           hepatitis_A_2017, hepatitis_A_2018, hepatitis_A_2019, hepatitis_A_2020, hepatitis_A_2021, hepatitis_A_2022)

hepatitis_A <- na.omit(hepatitis_A)
colnames(hepatitis_A) <- c("year", "cases")
write.csv(hepatitis_A, "D:\\Modelling_KDMIN\\Data\\hepatitis_A\\hepatitis_A.csv")


########### hemorrhagic_fever
hemorrhagic_fever_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2010.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2010 <- hemorrhagic_fever_2010[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2010) <- c(rep(201001:(201000 + nrow(hemorrhagic_fever_2010))))
hemorrhagic_fever_2010 <- rownames_to_column(hemorrhagic_fever_2010, var = "year") 

hemorrhagic_fever_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2011.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2011 <- hemorrhagic_fever_2011[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2011) <- c(rep(201101:(201100 + nrow(hemorrhagic_fever_2011))))
hemorrhagic_fever_2011 <- rownames_to_column(hemorrhagic_fever_2011, var = "year") 

hemorrhagic_fever_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2012.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2012 <- hemorrhagic_fever_2012[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2012) <- c(rep(201201:(201200 + nrow(hemorrhagic_fever_2012))))
hemorrhagic_fever_2012 <- rownames_to_column(hemorrhagic_fever_2012, var = "year") 

hemorrhagic_fever_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2013.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2013 <- hemorrhagic_fever_2013[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2013) <- c(rep(201301:(201300 + nrow(hemorrhagic_fever_2013))))
hemorrhagic_fever_2013 <- rownames_to_column(hemorrhagic_fever_2013, var = "year") 

hemorrhagic_fever_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2014.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2014 <- hemorrhagic_fever_2014[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2014) <- c(rep(201401:(201400 + nrow(hemorrhagic_fever_2014))))
hemorrhagic_fever_2014 <- rownames_to_column(hemorrhagic_fever_2014, var = "year")

hemorrhagic_fever_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2015.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2015 <- hemorrhagic_fever_2015[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2015) <- c(rep(201501:(201500 + nrow(hemorrhagic_fever_2015))))
hemorrhagic_fever_2015 <- rownames_to_column(hemorrhagic_fever_2015, var = "year")

hemorrhagic_fever_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2016.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2016 <- hemorrhagic_fever_2016[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2016) <- c(rep(201601:(201600 + nrow(hemorrhagic_fever_2016))))
hemorrhagic_fever_2016 <- rownames_to_column(hemorrhagic_fever_2016, var = "year")

hemorrhagic_fever_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2017.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2017 <- hemorrhagic_fever_2017[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2017) <- c(rep(201701:(201700 + nrow(hemorrhagic_fever_2017))))
hemorrhagic_fever_2017 <- rownames_to_column(hemorrhagic_fever_2017, var = "year")

hemorrhagic_fever_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2018.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2018 <- hemorrhagic_fever_2018[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2018) <- c(rep(201801:(201800 + nrow(hemorrhagic_fever_2018))))
hemorrhagic_fever_2018 <- rownames_to_column(hemorrhagic_fever_2018, var = "year")

hemorrhagic_fever_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2019.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2019 <- hemorrhagic_fever_2019[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2019) <- c(rep(201901:(201900 + nrow(hemorrhagic_fever_2019))))
hemorrhagic_fever_2019 <- rownames_to_column(hemorrhagic_fever_2019, var = "year")

hemorrhagic_fever_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2020.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2020 <- hemorrhagic_fever_2020[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2020) <- c(rep(202001:(202000 + nrow(hemorrhagic_fever_2020))))
hemorrhagic_fever_2020 <- rownames_to_column(hemorrhagic_fever_2020, var = "year")

hemorrhagic_fever_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2021.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2021 <- hemorrhagic_fever_2021[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2021) <- c(rep(202101:(202100 + nrow(hemorrhagic_fever_2021))))
hemorrhagic_fever_2021 <- rownames_to_column(hemorrhagic_fever_2021, var = "year")

hemorrhagic_fever_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/hemorrhagic_fever/hemorrhagic_fever_2022.csv", 
                                                   col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
hemorrhagic_fever_2022 <- hemorrhagic_fever_2022[-1, ,drop = FALSE]
rownames(hemorrhagic_fever_2022) <- c(rep(202201:(202200 + nrow(hemorrhagic_fever_2022))))
hemorrhagic_fever_2022 <- rownames_to_column(hemorrhagic_fever_2022, var = "year")

hemorrhagic_fever <- rbind(hemorrhagic_fever_2010, hemorrhagic_fever_2011, hemorrhagic_fever_2012, hemorrhagic_fever_2013, hemorrhagic_fever_2014, hemorrhagic_fever_2015, hemorrhagic_fever_2016,
                           hemorrhagic_fever_2017, hemorrhagic_fever_2018, hemorrhagic_fever_2019, hemorrhagic_fever_2020, hemorrhagic_fever_2021, hemorrhagic_fever_2022)

hemorrhagic_fever <- na.omit(hemorrhagic_fever)
colnames(hemorrhagic_fever) <- c("year", "cases")
write.csv(hemorrhagic_fever, "D:\\Modelling_KDMIN\\Data\\hemorrhagic_fever\\hemorrhagic_fever.csv")


########### malaria
malaria_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2010.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2010 <- malaria_2010[-1, ,drop = FALSE]
rownames(malaria_2010) <- c(rep(201001:(201000 + nrow(malaria_2010))))
malaria_2010 <- rownames_to_column(malaria_2010, var = "year") 

malaria_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2011.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2011 <- malaria_2011[-1, ,drop = FALSE]
rownames(malaria_2011) <- c(rep(201101:(201100 + nrow(malaria_2011))))
malaria_2011 <- rownames_to_column(malaria_2011, var = "year") 

malaria_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2012.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2012 <- malaria_2012[-1, ,drop = FALSE]
rownames(malaria_2012) <- c(rep(201201:(201200 + nrow(malaria_2012))))
malaria_2012 <- rownames_to_column(malaria_2012, var = "year") 

malaria_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2013.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2013 <- malaria_2013[-1, ,drop = FALSE]
rownames(malaria_2013) <- c(rep(201301:(201300 + nrow(malaria_2013))))
malaria_2013 <- rownames_to_column(malaria_2013, var = "year") 

malaria_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2014.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2014 <- malaria_2014[-1, ,drop = FALSE]
rownames(malaria_2014) <- c(rep(201401:(201400 + nrow(malaria_2014))))
malaria_2014 <- rownames_to_column(malaria_2014, var = "year")

malaria_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2015.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2015 <- malaria_2015[-1, ,drop = FALSE]
rownames(malaria_2015) <- c(rep(201501:(201500 + nrow(malaria_2015))))
malaria_2015 <- rownames_to_column(malaria_2015, var = "year")

malaria_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2016.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2016 <- malaria_2016[-1, ,drop = FALSE]
rownames(malaria_2016) <- c(rep(201601:(201600 + nrow(malaria_2016))))
malaria_2016 <- rownames_to_column(malaria_2016, var = "year")

malaria_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2017.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2017 <- malaria_2017[-1, ,drop = FALSE]
rownames(malaria_2017) <- c(rep(201701:(201700 + nrow(malaria_2017))))
malaria_2017 <- rownames_to_column(malaria_2017, var = "year")

malaria_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2018.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2018 <- malaria_2018[-1, ,drop = FALSE]
rownames(malaria_2018) <- c(rep(201801:(201800 + nrow(malaria_2018))))
malaria_2018 <- rownames_to_column(malaria_2018, var = "year")

malaria_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2019.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2019 <- malaria_2019[-1, ,drop = FALSE]
rownames(malaria_2019) <- c(rep(201901:(201900 + nrow(malaria_2019))))
malaria_2019 <- rownames_to_column(malaria_2019, var = "year")

malaria_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2020.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2020 <- malaria_2020[-1, ,drop = FALSE]
rownames(malaria_2020) <- c(rep(202001:(202000 + nrow(malaria_2020))))
malaria_2020 <- rownames_to_column(malaria_2020, var = "year")

malaria_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2021.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2021 <- malaria_2021[-1, ,drop = FALSE]
rownames(malaria_2021) <- c(rep(202101:(202100 + nrow(malaria_2021))))
malaria_2021 <- rownames_to_column(malaria_2021, var = "year")

malaria_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/malaria/malaria_2022.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
malaria_2022 <- malaria_2022[-1, ,drop = FALSE]
rownames(malaria_2022) <- c(rep(202201:(202200 + nrow(malaria_2022))))
malaria_2022 <- rownames_to_column(malaria_2022, var = "year")

malaria <- rbind(malaria_2010, malaria_2011, malaria_2012, malaria_2013, malaria_2014, malaria_2015, malaria_2016,
                     malaria_2017, malaria_2018, malaria_2019, malaria_2020, malaria_2021, malaria_2022)

malaria <- na.omit(malaria)
colnames(malaria) <- c("year", "cases")
write.csv(malaria, "D:\\Modelling_KDMIN\\Data\\malaria\\malaria.csv")


########### legionella
legionella_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2010.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2010 <- legionella_2010[-1, ,drop = FALSE]
rownames(legionella_2010) <- c(rep(201001:(201000 + nrow(legionella_2010))))
legionella_2010 <- rownames_to_column(legionella_2010, var = "year") 

legionella_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2011.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2011 <- legionella_2011[-1, ,drop = FALSE]
rownames(legionella_2011) <- c(rep(201101:(201100 + nrow(legionella_2011))))
legionella_2011 <- rownames_to_column(legionella_2011, var = "year") 

legionella_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2012.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2012 <- legionella_2012[-1, ,drop = FALSE]
rownames(legionella_2012) <- c(rep(201201:(201200 + nrow(legionella_2012))))
legionella_2012 <- rownames_to_column(legionella_2012, var = "year") 

legionella_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2013.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2013 <- legionella_2013[-1, ,drop = FALSE]
rownames(legionella_2013) <- c(rep(201301:(201300 + nrow(legionella_2013))))
legionella_2013 <- rownames_to_column(legionella_2013, var = "year") 

legionella_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2014.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2014 <- legionella_2014[-1, ,drop = FALSE]
rownames(legionella_2014) <- c(rep(201401:(201400 + nrow(legionella_2014))))
legionella_2014 <- rownames_to_column(legionella_2014, var = "year")

legionella_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2015.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2015 <- legionella_2015[-1, ,drop = FALSE]
rownames(legionella_2015) <- c(rep(201501:(201500 + nrow(legionella_2015))))
legionella_2015 <- rownames_to_column(legionella_2015, var = "year")

legionella_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2016.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2016 <- legionella_2016[-1, ,drop = FALSE]
rownames(legionella_2016) <- c(rep(201601:(201600 + nrow(legionella_2016))))
legionella_2016 <- rownames_to_column(legionella_2016, var = "year")

legionella_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2017.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2017 <- legionella_2017[-1, ,drop = FALSE]
rownames(legionella_2017) <- c(rep(201701:(201700 + nrow(legionella_2017))))
legionella_2017 <- rownames_to_column(legionella_2017, var = "year")

legionella_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2018.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2018 <- legionella_2018[-1, ,drop = FALSE]
rownames(legionella_2018) <- c(rep(201801:(201800 + nrow(legionella_2018))))
legionella_2018 <- rownames_to_column(legionella_2018, var = "year")

legionella_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2019.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2019 <- legionella_2019[-1, ,drop = FALSE]
rownames(legionella_2019) <- c(rep(201901:(201900 + nrow(legionella_2019))))
legionella_2019 <- rownames_to_column(legionella_2019, var = "year")

legionella_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2020.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2020 <- legionella_2020[-1, ,drop = FALSE]
rownames(legionella_2020) <- c(rep(202001:(202000 + nrow(legionella_2020))))
legionella_2020 <- rownames_to_column(legionella_2020, var = "year")

legionella_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2021.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2021 <- legionella_2021[-1, ,drop = FALSE]
rownames(legionella_2021) <- c(rep(202101:(202100 + nrow(legionella_2021))))
legionella_2021 <- rownames_to_column(legionella_2021, var = "year")

legionella_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/legionella/legionella_2022.csv", 
                                            col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
legionella_2022 <- legionella_2022[-1, ,drop = FALSE]
rownames(legionella_2022) <- c(rep(202201:(202200 + nrow(legionella_2022))))
legionella_2022 <- rownames_to_column(legionella_2022, var = "year")

legionella <- rbind(legionella_2010, legionella_2011, legionella_2012, legionella_2013, legionella_2014, legionella_2015, legionella_2016,
                    legionella_2017, legionella_2018, legionella_2019, legionella_2020, legionella_2021, legionella_2022)

legionella <- na.omit(legionella)
colnames(legionella) <- c("year", "cases")
write.csv(legionella, "D:\\Modelling_KDMIN\\Data\\legionella\\legionella.csv")



########### measles
measles_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2010.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2010 <- measles_2010[-1, ,drop = FALSE]
rownames(measles_2010) <- c(rep(201001:(201000 + nrow(measles_2010))))
measles_2010 <- rownames_to_column(measles_2010, var = "year") 

measles_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2011.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2011 <- measles_2011[-1, ,drop = FALSE]
rownames(measles_2011) <- c(rep(201101:(201100 + nrow(measles_2011))))
measles_2011 <- rownames_to_column(measles_2011, var = "year") 

measles_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2012.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2012 <- measles_2012[-1, ,drop = FALSE]
rownames(measles_2012) <- c(rep(201201:(201200 + nrow(measles_2012))))
measles_2012 <- rownames_to_column(measles_2012, var = "year") 

measles_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2013.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2013 <- measles_2013[-1, ,drop = FALSE]
rownames(measles_2013) <- c(rep(201301:(201300 + nrow(measles_2013))))
measles_2013 <- rownames_to_column(measles_2013, var = "year") 

measles_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2014.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2014 <- measles_2014[-1, ,drop = FALSE]
rownames(measles_2014) <- c(rep(201401:(201400 + nrow(measles_2014))))
measles_2014 <- rownames_to_column(measles_2014, var = "year")

measles_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2015.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2015 <- measles_2015[-1, ,drop = FALSE]
rownames(measles_2015) <- c(rep(201501:(201500 + nrow(measles_2015))))
measles_2015 <- rownames_to_column(measles_2015, var = "year")

measles_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2016.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2016 <- measles_2016[-1, ,drop = FALSE]
rownames(measles_2016) <- c(rep(201601:(201600 + nrow(measles_2016))))
measles_2016 <- rownames_to_column(measles_2016, var = "year")

measles_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2017.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2017 <- measles_2017[-1, ,drop = FALSE]
rownames(measles_2017) <- c(rep(201701:(201700 + nrow(measles_2017))))
measles_2017 <- rownames_to_column(measles_2017, var = "year")

measles_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2018.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2018 <- measles_2018[-1, ,drop = FALSE]
rownames(measles_2018) <- c(rep(201801:(201800 + nrow(measles_2018))))
measles_2018 <- rownames_to_column(measles_2018, var = "year")

measles_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2019.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2019 <- measles_2019[-1, ,drop = FALSE]
rownames(measles_2019) <- c(rep(201901:(201900 + nrow(measles_2019))))
measles_2019 <- rownames_to_column(measles_2019, var = "year")

measles_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2020.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2020 <- measles_2020[-1, ,drop = FALSE]
rownames(measles_2020) <- c(rep(202001:(202000 + nrow(measles_2020))))
measles_2020 <- rownames_to_column(measles_2020, var = "year")

measles_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2021.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2021 <- measles_2021[-1, ,drop = FALSE]
rownames(measles_2021) <- c(rep(202101:(202100 + nrow(measles_2021))))
measles_2021 <- rownames_to_column(measles_2021, var = "year")

measles_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2022.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2022 <- measles_2022[-1, ,drop = FALSE]
rownames(measles_2022) <- c(rep(202201:(202200 + nrow(measles_2022))))
measles_2022 <- rownames_to_column(measles_2022, var = "year")

measles <- rbind(measles_2010, measles_2011, measles_2012, measles_2013, measles_2014, measles_2015, measles_2016,
                 measles_2017, measles_2018, measles_2019, measles_2020, measles_2021, measles_2022)

measles <- na.omit(measles)
colnames(measles) <- c("year", "cases")
write.csv(measles, "D:\\Modelling_KDMIN\\Data\\measles\\measles.csv")


########### measles
measles_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2010.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2010 <- measles_2010[-1, ,drop = FALSE]
rownames(measles_2010) <- c(rep(201001:(201000 + nrow(measles_2010))))
measles_2010 <- rownames_to_column(measles_2010, var = "year") 

measles_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2011.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2011 <- measles_2011[-1, ,drop = FALSE]
rownames(measles_2011) <- c(rep(201101:(201100 + nrow(measles_2011))))
measles_2011 <- rownames_to_column(measles_2011, var = "year") 

measles_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2012.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2012 <- measles_2012[-1, ,drop = FALSE]
rownames(measles_2012) <- c(rep(201201:(201200 + nrow(measles_2012))))
measles_2012 <- rownames_to_column(measles_2012, var = "year") 

measles_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2013.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2013 <- measles_2013[-1, ,drop = FALSE]
rownames(measles_2013) <- c(rep(201301:(201300 + nrow(measles_2013))))
measles_2013 <- rownames_to_column(measles_2013, var = "year") 

measles_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2014.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2014 <- measles_2014[-1, ,drop = FALSE]
rownames(measles_2014) <- c(rep(201401:(201400 + nrow(measles_2014))))
measles_2014 <- rownames_to_column(measles_2014, var = "year")

measles_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2015.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2015 <- measles_2015[-1, ,drop = FALSE]
rownames(measles_2015) <- c(rep(201501:(201500 + nrow(measles_2015))))
measles_2015 <- rownames_to_column(measles_2015, var = "year")

measles_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2016.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2016 <- measles_2016[-1, ,drop = FALSE]
rownames(measles_2016) <- c(rep(201601:(201600 + nrow(measles_2016))))
measles_2016 <- rownames_to_column(measles_2016, var = "year")

measles_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2017.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2017 <- measles_2017[-1, ,drop = FALSE]
rownames(measles_2017) <- c(rep(201701:(201700 + nrow(measles_2017))))
measles_2017 <- rownames_to_column(measles_2017, var = "year")

measles_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2018.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2018 <- measles_2018[-1, ,drop = FALSE]
rownames(measles_2018) <- c(rep(201801:(201800 + nrow(measles_2018))))
measles_2018 <- rownames_to_column(measles_2018, var = "year")

measles_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2019.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2019 <- measles_2019[-1, ,drop = FALSE]
rownames(measles_2019) <- c(rep(201901:(201900 + nrow(measles_2019))))
measles_2019 <- rownames_to_column(measles_2019, var = "year")

measles_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2020.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2020 <- measles_2020[-1, ,drop = FALSE]
rownames(measles_2020) <- c(rep(202001:(202000 + nrow(measles_2020))))
measles_2020 <- rownames_to_column(measles_2020, var = "year")

measles_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2021.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2021 <- measles_2021[-1, ,drop = FALSE]
rownames(measles_2021) <- c(rep(202101:(202100 + nrow(measles_2021))))
measles_2021 <- rownames_to_column(measles_2021, var = "year")

measles_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/measles/measles_2022.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
measles_2022 <- measles_2022[-1, ,drop = FALSE]
rownames(measles_2022) <- c(rep(202201:(202200 + nrow(measles_2022))))
measles_2022 <- rownames_to_column(measles_2022, var = "year")

measles <- rbind(measles_2010, measles_2011, measles_2012, measles_2013, measles_2014, measles_2015, measles_2016,
                 measles_2017, measles_2018, measles_2019, measles_2020, measles_2021, measles_2022)

measles <- na.omit(measles)
colnames(measles) <- c("year", "cases")
write.csv(measles, "D:\\Modelling_KDMIN\\Data\\measles\\measles.csv")


########### mumps
mumps_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2010.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2010 <- mumps_2010[-1, ,drop = FALSE]
rownames(mumps_2010) <- c(rep(201001:(201000 + nrow(mumps_2010))))
mumps_2010 <- rownames_to_column(mumps_2010, var = "year") 

mumps_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2011.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2011 <- mumps_2011[-1, ,drop = FALSE]
rownames(mumps_2011) <- c(rep(201101:(201100 + nrow(mumps_2011))))
mumps_2011 <- rownames_to_column(mumps_2011, var = "year") 

mumps_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2012.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2012 <- mumps_2012[-1, ,drop = FALSE]
rownames(mumps_2012) <- c(rep(201201:(201200 + nrow(mumps_2012))))
mumps_2012 <- rownames_to_column(mumps_2012, var = "year") 

mumps_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2013.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2013 <- mumps_2013[-1, ,drop = FALSE]
rownames(mumps_2013) <- c(rep(201301:(201300 + nrow(mumps_2013))))
mumps_2013 <- rownames_to_column(mumps_2013, var = "year") 

mumps_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2014.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2014 <- mumps_2014[-1, ,drop = FALSE]
rownames(mumps_2014) <- c(rep(201401:(201400 + nrow(mumps_2014))))
mumps_2014 <- rownames_to_column(mumps_2014, var = "year")

mumps_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2015.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2015 <- mumps_2015[-1, ,drop = FALSE]
rownames(mumps_2015) <- c(rep(201501:(201500 + nrow(mumps_2015))))
mumps_2015 <- rownames_to_column(mumps_2015, var = "year")

mumps_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2016.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2016 <- mumps_2016[-1, ,drop = FALSE]
rownames(mumps_2016) <- c(rep(201601:(201600 + nrow(mumps_2016))))
mumps_2016 <- rownames_to_column(mumps_2016, var = "year")

mumps_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2017.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2017 <- mumps_2017[-1, ,drop = FALSE]
rownames(mumps_2017) <- c(rep(201701:(201700 + nrow(mumps_2017))))
mumps_2017 <- rownames_to_column(mumps_2017, var = "year")

mumps_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2018.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2018 <- mumps_2018[-1, ,drop = FALSE]
rownames(mumps_2018) <- c(rep(201801:(201800 + nrow(mumps_2018))))
mumps_2018 <- rownames_to_column(mumps_2018, var = "year")

mumps_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2019.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2019 <- mumps_2019[-1, ,drop = FALSE]
rownames(mumps_2019) <- c(rep(201901:(201900 + nrow(mumps_2019))))
mumps_2019 <- rownames_to_column(mumps_2019, var = "year")

mumps_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2020.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2020 <- mumps_2020[-1, ,drop = FALSE]
rownames(mumps_2020) <- c(rep(202001:(202000 + nrow(mumps_2020))))
mumps_2020 <- rownames_to_column(mumps_2020, var = "year")

mumps_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2021.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2021 <- mumps_2021[-1, ,drop = FALSE]
rownames(mumps_2021) <- c(rep(202101:(202100 + nrow(mumps_2021))))
mumps_2021 <- rownames_to_column(mumps_2021, var = "year")

mumps_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/mumps/mumps_2022.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
mumps_2022 <- mumps_2022[-1, ,drop = FALSE]
rownames(mumps_2022) <- c(rep(202201:(202200 + nrow(mumps_2022))))
mumps_2022 <- rownames_to_column(mumps_2022, var = "year")

mumps <- rbind(mumps_2010, mumps_2011, mumps_2012, mumps_2013, mumps_2014, mumps_2015, mumps_2016,
                 mumps_2017, mumps_2018, mumps_2019, mumps_2020, mumps_2021, mumps_2022)

mumps <- na.omit(mumps)
colnames(mumps) <- c("year", "cases")
write.csv(mumps, "D:\\Modelling_KDMIN\\Data\\mumps\\mumps.csv")


########### pneumococcal
pneumococcal_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2014.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2014 <- pneumococcal_2014[-1, ,drop = FALSE]
rownames(pneumococcal_2014) <- c(rep(201401:(201400 + nrow(pneumococcal_2014))))
pneumococcal_2014 <- rownames_to_column(pneumococcal_2014, var = "year")

pneumococcal_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2015.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2015 <- pneumococcal_2015[-1, ,drop = FALSE]
rownames(pneumococcal_2015) <- c(rep(201501:(201500 + nrow(pneumococcal_2015))))
pneumococcal_2015 <- rownames_to_column(pneumococcal_2015, var = "year")

pneumococcal_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2016.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2016 <- pneumococcal_2016[-1, ,drop = FALSE]
rownames(pneumococcal_2016) <- c(rep(201601:(201600 + nrow(pneumococcal_2016))))
pneumococcal_2016 <- rownames_to_column(pneumococcal_2016, var = "year")

pneumococcal_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2017.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2017 <- pneumococcal_2017[-1, ,drop = FALSE]
rownames(pneumococcal_2017) <- c(rep(201701:(201700 + nrow(pneumococcal_2017))))
pneumococcal_2017 <- rownames_to_column(pneumococcal_2017, var = "year")

pneumococcal_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2018.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2018 <- pneumococcal_2018[-1, ,drop = FALSE]
rownames(pneumococcal_2018) <- c(rep(201801:(201800 + nrow(pneumococcal_2018))))
pneumococcal_2018 <- rownames_to_column(pneumococcal_2018, var = "year")

pneumococcal_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2019.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2019 <- pneumococcal_2019[-1, ,drop = FALSE]
rownames(pneumococcal_2019) <- c(rep(201901:(201900 + nrow(pneumococcal_2019))))
pneumococcal_2019 <- rownames_to_column(pneumococcal_2019, var = "year")

pneumococcal_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2020.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2020 <- pneumococcal_2020[-1, ,drop = FALSE]
rownames(pneumococcal_2020) <- c(rep(202001:(202000 + nrow(pneumococcal_2020))))
pneumococcal_2020 <- rownames_to_column(pneumococcal_2020, var = "year")

pneumococcal_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2021.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2021 <- pneumococcal_2021[-1, ,drop = FALSE]
rownames(pneumococcal_2021) <- c(rep(202101:(202100 + nrow(pneumococcal_2021))))
pneumococcal_2021 <- rownames_to_column(pneumococcal_2021, var = "year")

pneumococcal_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/pneumococcal/pneumococcal_2022.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
pneumococcal_2022 <- pneumococcal_2022[-1, ,drop = FALSE]
rownames(pneumococcal_2022) <- c(rep(202201:(202200 + nrow(pneumococcal_2022))))
pneumococcal_2022 <- rownames_to_column(pneumococcal_2022, var = "year")

pneumococcal <- rbind(pneumococcal_2014, pneumococcal_2015, pneumococcal_2016,
               pneumococcal_2017, pneumococcal_2018, pneumococcal_2019, pneumococcal_2020, pneumococcal_2021, pneumococcal_2022)

pneumococcal <- na.omit(pneumococcal)
colnames(pneumococcal) <- c("year", "cases")
write.csv(pneumococcal, "D:\\Modelling_KDMIN\\Data\\pneumococcal\\pneumococcal.csv")


########### scarlet_fever
scarlet_fever_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2010.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2010 <- scarlet_fever_2010[-1, ,drop = FALSE]
rownames(scarlet_fever_2010) <- c(rep(201001:(201000 + nrow(scarlet_fever_2010))))
scarlet_fever_2010 <- rownames_to_column(scarlet_fever_2010, var = "year") 

scarlet_fever_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2011.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2011 <- scarlet_fever_2011[-1, ,drop = FALSE]
rownames(scarlet_fever_2011) <- c(rep(201101:(201100 + nrow(scarlet_fever_2011))))
scarlet_fever_2011 <- rownames_to_column(scarlet_fever_2011, var = "year") 

scarlet_fever_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2012.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2012 <- scarlet_fever_2012[-1, ,drop = FALSE]
rownames(scarlet_fever_2012) <- c(rep(201201:(201200 + nrow(scarlet_fever_2012))))
scarlet_fever_2012 <- rownames_to_column(scarlet_fever_2012, var = "year") 

scarlet_fever_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2013.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2013 <- scarlet_fever_2013[-1, ,drop = FALSE]
rownames(scarlet_fever_2013) <- c(rep(201301:(201300 + nrow(scarlet_fever_2013))))
scarlet_fever_2013 <- rownames_to_column(scarlet_fever_2013, var = "year") 

scarlet_fever_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2014.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2014 <- scarlet_fever_2014[-1, ,drop = FALSE]
rownames(scarlet_fever_2014) <- c(rep(201401:(201400 + nrow(scarlet_fever_2014))))
scarlet_fever_2014 <- rownames_to_column(scarlet_fever_2014, var = "year")

scarlet_fever_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2015.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2015 <- scarlet_fever_2015[-1, ,drop = FALSE]
rownames(scarlet_fever_2015) <- c(rep(201501:(201500 + nrow(scarlet_fever_2015))))
scarlet_fever_2015 <- rownames_to_column(scarlet_fever_2015, var = "year")

scarlet_fever_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2016.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2016 <- scarlet_fever_2016[-1, ,drop = FALSE]
rownames(scarlet_fever_2016) <- c(rep(201601:(201600 + nrow(scarlet_fever_2016))))
scarlet_fever_2016 <- rownames_to_column(scarlet_fever_2016, var = "year")

scarlet_fever_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2017.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2017 <- scarlet_fever_2017[-1, ,drop = FALSE]
rownames(scarlet_fever_2017) <- c(rep(201701:(201700 + nrow(scarlet_fever_2017))))
scarlet_fever_2017 <- rownames_to_column(scarlet_fever_2017, var = "year")

scarlet_fever_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2018.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2018 <- scarlet_fever_2018[-1, ,drop = FALSE]
rownames(scarlet_fever_2018) <- c(rep(201801:(201800 + nrow(scarlet_fever_2018))))
scarlet_fever_2018 <- rownames_to_column(scarlet_fever_2018, var = "year")

scarlet_fever_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2019.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2019 <- scarlet_fever_2019[-1, ,drop = FALSE]
rownames(scarlet_fever_2019) <- c(rep(201901:(201900 + nrow(scarlet_fever_2019))))
scarlet_fever_2019 <- rownames_to_column(scarlet_fever_2019, var = "year")

scarlet_fever_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2020.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2020 <- scarlet_fever_2020[-1, ,drop = FALSE]
rownames(scarlet_fever_2020) <- c(rep(202001:(202000 + nrow(scarlet_fever_2020))))
scarlet_fever_2020 <- rownames_to_column(scarlet_fever_2020, var = "year")

scarlet_fever_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2021.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2021 <- scarlet_fever_2021[-1, ,drop = FALSE]
rownames(scarlet_fever_2021) <- c(rep(202101:(202100 + nrow(scarlet_fever_2021))))
scarlet_fever_2021 <- rownames_to_column(scarlet_fever_2021, var = "year")

scarlet_fever_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/scarlet_fever/scarlet_fever_2022.csv", 
                                       col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
scarlet_fever_2022 <- scarlet_fever_2022[-1, ,drop = FALSE]
rownames(scarlet_fever_2022) <- c(rep(202201:(202200 + nrow(scarlet_fever_2022))))
scarlet_fever_2022 <- rownames_to_column(scarlet_fever_2022, var = "year")

scarlet_fever <- rbind(scarlet_fever_2010, scarlet_fever_2011, scarlet_fever_2012, scarlet_fever_2013, scarlet_fever_2014, scarlet_fever_2015, scarlet_fever_2016,
               scarlet_fever_2017, scarlet_fever_2018, scarlet_fever_2019, scarlet_fever_2020, scarlet_fever_2021, scarlet_fever_2022)

scarlet_fever <- na.omit(scarlet_fever)
colnames(scarlet_fever) <- c("year", "cases")
write.csv(scarlet_fever, "D:\\Modelling_KDMIN\\Data\\scarlet_fever\\scarlet_fever.csv")


########### SFTS
SFTS_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2013.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2013 <- SFTS_2013[-1, ,drop = FALSE]
rownames(SFTS_2013) <- c(rep(201301:(201300 + nrow(SFTS_2013))))
SFTS_2013 <- rownames_to_column(SFTS_2013, var = "year") 

SFTS_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2014.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2014 <- SFTS_2014[-1, ,drop = FALSE]
rownames(SFTS_2014) <- c(rep(201401:(201400 + nrow(SFTS_2014))))
SFTS_2014 <- rownames_to_column(SFTS_2014, var = "year")

SFTS_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2015.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2015 <- SFTS_2015[-1, ,drop = FALSE]
rownames(SFTS_2015) <- c(rep(201501:(201500 + nrow(SFTS_2015))))
SFTS_2015 <- rownames_to_column(SFTS_2015, var = "year")

SFTS_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2016.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2016 <- SFTS_2016[-1, ,drop = FALSE]
rownames(SFTS_2016) <- c(rep(201601:(201600 + nrow(SFTS_2016))))
SFTS_2016 <- rownames_to_column(SFTS_2016, var = "year")

SFTS_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2017.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2017 <- SFTS_2017[-1, ,drop = FALSE]
rownames(SFTS_2017) <- c(rep(201701:(201700 + nrow(SFTS_2017))))
SFTS_2017 <- rownames_to_column(SFTS_2017, var = "year")

SFTS_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2018.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2018 <- SFTS_2018[-1, ,drop = FALSE]
rownames(SFTS_2018) <- c(rep(201801:(201800 + nrow(SFTS_2018))))
SFTS_2018 <- rownames_to_column(SFTS_2018, var = "year")

SFTS_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2019.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2019 <- SFTS_2019[-1, ,drop = FALSE]
rownames(SFTS_2019) <- c(rep(201901:(201900 + nrow(SFTS_2019))))
SFTS_2019 <- rownames_to_column(SFTS_2019, var = "year")

SFTS_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2020.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2020 <- SFTS_2020[-1, ,drop = FALSE]
rownames(SFTS_2020) <- c(rep(202001:(202000 + nrow(SFTS_2020))))
SFTS_2020 <- rownames_to_column(SFTS_2020, var = "year")

SFTS_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2021.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2021 <- SFTS_2021[-1, ,drop = FALSE]
rownames(SFTS_2021) <- c(rep(202101:(202100 + nrow(SFTS_2021))))
SFTS_2021 <- rownames_to_column(SFTS_2021, var = "year")

SFTS_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/SFTS/SFTS_2022.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
SFTS_2022 <- SFTS_2022[-1, ,drop = FALSE]
rownames(SFTS_2022) <- c(rep(202201:(202200 + nrow(SFTS_2022))))
SFTS_2022 <- rownames_to_column(SFTS_2022, var = "year")

SFTS <- rbind(SFTS_2013, SFTS_2014, SFTS_2015, SFTS_2016,
                       SFTS_2017, SFTS_2018, SFTS_2019, SFTS_2020, SFTS_2021, SFTS_2022)

SFTS <- na.omit(SFTS)
colnames(SFTS) <- c("year", "cases")
write.csv(SFTS, "D:\\Modelling_KDMIN\\Data\\SFTS\\SFTS.csv")


########### shigellosis
shigellosis_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2010.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2010 <- shigellosis_2010[-1, ,drop = FALSE]
rownames(shigellosis_2010) <- c(rep(201001:(201000 + nrow(shigellosis_2010))))
shigellosis_2010 <- rownames_to_column(shigellosis_2010, var = "year") 

shigellosis_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2011.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2011 <- shigellosis_2011[-1, ,drop = FALSE]
rownames(shigellosis_2011) <- c(rep(201101:(201100 + nrow(shigellosis_2011))))
shigellosis_2011 <- rownames_to_column(shigellosis_2011, var = "year") 

shigellosis_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2012.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2012 <- shigellosis_2012[-1, ,drop = FALSE]
rownames(shigellosis_2012) <- c(rep(201201:(201200 + nrow(shigellosis_2012))))
shigellosis_2012 <- rownames_to_column(shigellosis_2012, var = "year") 

shigellosis_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2013.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2013 <- shigellosis_2013[-1, ,drop = FALSE]
rownames(shigellosis_2013) <- c(rep(201301:(201300 + nrow(shigellosis_2013))))
shigellosis_2013 <- rownames_to_column(shigellosis_2013, var = "year") 

shigellosis_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2014.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2014 <- shigellosis_2014[-1, ,drop = FALSE]
rownames(shigellosis_2014) <- c(rep(201401:(201400 + nrow(shigellosis_2014))))
shigellosis_2014 <- rownames_to_column(shigellosis_2014, var = "year")

shigellosis_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2015.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2015 <- shigellosis_2015[-1, ,drop = FALSE]
rownames(shigellosis_2015) <- c(rep(201501:(201500 + nrow(shigellosis_2015))))
shigellosis_2015 <- rownames_to_column(shigellosis_2015, var = "year")

shigellosis_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2016.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2016 <- shigellosis_2016[-1, ,drop = FALSE]
rownames(shigellosis_2016) <- c(rep(201601:(201600 + nrow(shigellosis_2016))))
shigellosis_2016 <- rownames_to_column(shigellosis_2016, var = "year")

shigellosis_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2017.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2017 <- shigellosis_2017[-1, ,drop = FALSE]
rownames(shigellosis_2017) <- c(rep(201701:(201700 + nrow(shigellosis_2017))))
shigellosis_2017 <- rownames_to_column(shigellosis_2017, var = "year")

shigellosis_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2018.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2018 <- shigellosis_2018[-1, ,drop = FALSE]
rownames(shigellosis_2018) <- c(rep(201801:(201800 + nrow(shigellosis_2018))))
shigellosis_2018 <- rownames_to_column(shigellosis_2018, var = "year")

shigellosis_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2019.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2019 <- shigellosis_2019[-1, ,drop = FALSE]
rownames(shigellosis_2019) <- c(rep(201901:(201900 + nrow(shigellosis_2019))))
shigellosis_2019 <- rownames_to_column(shigellosis_2019, var = "year")

shigellosis_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2020.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2020 <- shigellosis_2020[-1, ,drop = FALSE]
rownames(shigellosis_2020) <- c(rep(202001:(202000 + nrow(shigellosis_2020))))
shigellosis_2020 <- rownames_to_column(shigellosis_2020, var = "year")

shigellosis_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2021.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2021 <- shigellosis_2021[-1, ,drop = FALSE]
rownames(shigellosis_2021) <- c(rep(202101:(202100 + nrow(shigellosis_2021))))
shigellosis_2021 <- rownames_to_column(shigellosis_2021, var = "year")

shigellosis_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/shigellosis/shigellosis_2022.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
shigellosis_2022 <- shigellosis_2022[-1, ,drop = FALSE]
rownames(shigellosis_2022) <- c(rep(202201:(202200 + nrow(shigellosis_2022))))
shigellosis_2022 <- rownames_to_column(shigellosis_2022, var = "year")

shigellosis <- rbind(shigellosis_2010, shigellosis_2011, shigellosis_2012, shigellosis_2013, shigellosis_2014, shigellosis_2015, shigellosis_2016,
                       shigellosis_2017, shigellosis_2018, shigellosis_2019, shigellosis_2020, shigellosis_2021, shigellosis_2022)

shigellosis <- na.omit(shigellosis)
colnames(shigellosis) <- c("year", "cases")
write.csv(shigellosis, "D:\\Modelling_KDMIN\\Data\\shigellosis\\shigellosis.csv")


########### tsutsugamushi
tsutsugamushi_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2010.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2010 <- tsutsugamushi_2010[-1, ,drop = FALSE]
rownames(tsutsugamushi_2010) <- c(rep(201001:(201000 + nrow(tsutsugamushi_2010))))
tsutsugamushi_2010 <- rownames_to_column(tsutsugamushi_2010, var = "year") 

tsutsugamushi_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2011.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2011 <- tsutsugamushi_2011[-1, ,drop = FALSE]
rownames(tsutsugamushi_2011) <- c(rep(201101:(201100 + nrow(tsutsugamushi_2011))))
tsutsugamushi_2011 <- rownames_to_column(tsutsugamushi_2011, var = "year") 

tsutsugamushi_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2012.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2012 <- tsutsugamushi_2012[-1, ,drop = FALSE]
rownames(tsutsugamushi_2012) <- c(rep(201201:(201200 + nrow(tsutsugamushi_2012))))
tsutsugamushi_2012 <- rownames_to_column(tsutsugamushi_2012, var = "year") 

tsutsugamushi_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2013.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2013 <- tsutsugamushi_2013[-1, ,drop = FALSE]
rownames(tsutsugamushi_2013) <- c(rep(201301:(201300 + nrow(tsutsugamushi_2013))))
tsutsugamushi_2013 <- rownames_to_column(tsutsugamushi_2013, var = "year") 

tsutsugamushi_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2014.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2014 <- tsutsugamushi_2014[-1, ,drop = FALSE]
rownames(tsutsugamushi_2014) <- c(rep(201401:(201400 + nrow(tsutsugamushi_2014))))
tsutsugamushi_2014 <- rownames_to_column(tsutsugamushi_2014, var = "year")

tsutsugamushi_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2015.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2015 <- tsutsugamushi_2015[-1, ,drop = FALSE]
rownames(tsutsugamushi_2015) <- c(rep(201501:(201500 + nrow(tsutsugamushi_2015))))
tsutsugamushi_2015 <- rownames_to_column(tsutsugamushi_2015, var = "year")

tsutsugamushi_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2016.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2016 <- tsutsugamushi_2016[-1, ,drop = FALSE]
rownames(tsutsugamushi_2016) <- c(rep(201601:(201600 + nrow(tsutsugamushi_2016))))
tsutsugamushi_2016 <- rownames_to_column(tsutsugamushi_2016, var = "year")

tsutsugamushi_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2017.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2017 <- tsutsugamushi_2017[-1, ,drop = FALSE]
rownames(tsutsugamushi_2017) <- c(rep(201701:(201700 + nrow(tsutsugamushi_2017))))
tsutsugamushi_2017 <- rownames_to_column(tsutsugamushi_2017, var = "year")

tsutsugamushi_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2018.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2018 <- tsutsugamushi_2018[-1, ,drop = FALSE]
rownames(tsutsugamushi_2018) <- c(rep(201801:(201800 + nrow(tsutsugamushi_2018))))
tsutsugamushi_2018 <- rownames_to_column(tsutsugamushi_2018, var = "year")

tsutsugamushi_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2019.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2019 <- tsutsugamushi_2019[-1, ,drop = FALSE]
rownames(tsutsugamushi_2019) <- c(rep(201901:(201900 + nrow(tsutsugamushi_2019))))
tsutsugamushi_2019 <- rownames_to_column(tsutsugamushi_2019, var = "year")

tsutsugamushi_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2020.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2020 <- tsutsugamushi_2020[-1, ,drop = FALSE]
rownames(tsutsugamushi_2020) <- c(rep(202001:(202000 + nrow(tsutsugamushi_2020))))
tsutsugamushi_2020 <- rownames_to_column(tsutsugamushi_2020, var = "year")

tsutsugamushi_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2021.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2021 <- tsutsugamushi_2021[-1, ,drop = FALSE]
rownames(tsutsugamushi_2021) <- c(rep(202101:(202100 + nrow(tsutsugamushi_2021))))
tsutsugamushi_2021 <- rownames_to_column(tsutsugamushi_2021, var = "year")

tsutsugamushi_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/tsutsugamushi/tsutsugamushi_2022.csv", 
                                             col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
tsutsugamushi_2022 <- tsutsugamushi_2022[-1, ,drop = FALSE]
rownames(tsutsugamushi_2022) <- c(rep(202201:(202200 + nrow(tsutsugamushi_2022))))
tsutsugamushi_2022 <- rownames_to_column(tsutsugamushi_2022, var = "year")

tsutsugamushi <- rbind(tsutsugamushi_2010, tsutsugamushi_2011, tsutsugamushi_2012, tsutsugamushi_2013, tsutsugamushi_2014, tsutsugamushi_2015, tsutsugamushi_2016,
                     tsutsugamushi_2017, tsutsugamushi_2018, tsutsugamushi_2019, tsutsugamushi_2020, tsutsugamushi_2021, tsutsugamushi_2022)

tsutsugamushi <- na.omit(tsutsugamushi)
colnames(tsutsugamushi) <- c("year", "cases")
write.csv(tsutsugamushi, "D:\\Modelling_KDMIN\\Data\\tsutsugamushi\\tsutsugamushi.csv")


########### typhoid
typhoid_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2010.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2010 <- typhoid_2010[-1, ,drop = FALSE]
rownames(typhoid_2010) <- c(rep(201001:(201000 + nrow(typhoid_2010))))
typhoid_2010 <- rownames_to_column(typhoid_2010, var = "year") 

typhoid_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2011.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2011 <- typhoid_2011[-1, ,drop = FALSE]
rownames(typhoid_2011) <- c(rep(201101:(201100 + nrow(typhoid_2011))))
typhoid_2011 <- rownames_to_column(typhoid_2011, var = "year") 

typhoid_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2012.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2012 <- typhoid_2012[-1, ,drop = FALSE]
rownames(typhoid_2012) <- c(rep(201201:(201200 + nrow(typhoid_2012))))
typhoid_2012 <- rownames_to_column(typhoid_2012, var = "year") 

typhoid_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2013.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2013 <- typhoid_2013[-1, ,drop = FALSE]
rownames(typhoid_2013) <- c(rep(201301:(201300 + nrow(typhoid_2013))))
typhoid_2013 <- rownames_to_column(typhoid_2013, var = "year") 

typhoid_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2014.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2014 <- typhoid_2014[-1, ,drop = FALSE]
rownames(typhoid_2014) <- c(rep(201401:(201400 + nrow(typhoid_2014))))
typhoid_2014 <- rownames_to_column(typhoid_2014, var = "year")

typhoid_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2015.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2015 <- typhoid_2015[-1, ,drop = FALSE]
rownames(typhoid_2015) <- c(rep(201501:(201500 + nrow(typhoid_2015))))
typhoid_2015 <- rownames_to_column(typhoid_2015, var = "year")

typhoid_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2016.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2016 <- typhoid_2016[-1, ,drop = FALSE]
rownames(typhoid_2016) <- c(rep(201601:(201600 + nrow(typhoid_2016))))
typhoid_2016 <- rownames_to_column(typhoid_2016, var = "year")

typhoid_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2017.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2017 <- typhoid_2017[-1, ,drop = FALSE]
rownames(typhoid_2017) <- c(rep(201701:(201700 + nrow(typhoid_2017))))
typhoid_2017 <- rownames_to_column(typhoid_2017, var = "year")

typhoid_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2018.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2018 <- typhoid_2018[-1, ,drop = FALSE]
rownames(typhoid_2018) <- c(rep(201801:(201800 + nrow(typhoid_2018))))
typhoid_2018 <- rownames_to_column(typhoid_2018, var = "year")

typhoid_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2019.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2019 <- typhoid_2019[-1, ,drop = FALSE]
rownames(typhoid_2019) <- c(rep(201901:(201900 + nrow(typhoid_2019))))
typhoid_2019 <- rownames_to_column(typhoid_2019, var = "year")

typhoid_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2020.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2020 <- typhoid_2020[-1, ,drop = FALSE]
rownames(typhoid_2020) <- c(rep(202001:(202000 + nrow(typhoid_2020))))
typhoid_2020 <- rownames_to_column(typhoid_2020, var = "year")

typhoid_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2021.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2021 <- typhoid_2021[-1, ,drop = FALSE]
rownames(typhoid_2021) <- c(rep(202101:(202100 + nrow(typhoid_2021))))
typhoid_2021 <- rownames_to_column(typhoid_2021, var = "year")

typhoid_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/typhoid/typhoid_2022.csv", 
                                               col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
typhoid_2022 <- typhoid_2022[-1, ,drop = FALSE]
rownames(typhoid_2022) <- c(rep(202201:(202200 + nrow(typhoid_2022))))
typhoid_2022 <- rownames_to_column(typhoid_2022, var = "year")

typhoid <- rbind(typhoid_2010, typhoid_2011, typhoid_2012, typhoid_2013, typhoid_2014, typhoid_2015, typhoid_2016,
                       typhoid_2017, typhoid_2018, typhoid_2019, typhoid_2020, typhoid_2021, typhoid_2022)

typhoid <- na.omit(typhoid)
colnames(typhoid) <- c("year", "cases")
write.csv(typhoid, "D:\\Modelling_KDMIN\\Data\\typhoid\\typhoid.csv")



########### varicella
varicella_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2010.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2010 <- varicella_2010[-1, ,drop = FALSE]
rownames(varicella_2010) <- c(rep(201001:(201000 + nrow(varicella_2010))))
varicella_2010 <- rownames_to_column(varicella_2010, var = "year") 

varicella_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2011.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2011 <- varicella_2011[-1, ,drop = FALSE]
rownames(varicella_2011) <- c(rep(201101:(201100 + nrow(varicella_2011))))
varicella_2011 <- rownames_to_column(varicella_2011, var = "year") 

varicella_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2012.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2012 <- varicella_2012[-1, ,drop = FALSE]
rownames(varicella_2012) <- c(rep(201201:(201200 + nrow(varicella_2012))))
varicella_2012 <- rownames_to_column(varicella_2012, var = "year") 

varicella_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2013.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2013 <- varicella_2013[-1, ,drop = FALSE]
rownames(varicella_2013) <- c(rep(201301:(201300 + nrow(varicella_2013))))
varicella_2013 <- rownames_to_column(varicella_2013, var = "year") 

varicella_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2014.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2014 <- varicella_2014[-1, ,drop = FALSE]
rownames(varicella_2014) <- c(rep(201401:(201400 + nrow(varicella_2014))))
varicella_2014 <- rownames_to_column(varicella_2014, var = "year")

varicella_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2015.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2015 <- varicella_2015[-1, ,drop = FALSE]
rownames(varicella_2015) <- c(rep(201501:(201500 + nrow(varicella_2015))))
varicella_2015 <- rownames_to_column(varicella_2015, var = "year")

varicella_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2016.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2016 <- varicella_2016[-1, ,drop = FALSE]
rownames(varicella_2016) <- c(rep(201601:(201600 + nrow(varicella_2016))))
varicella_2016 <- rownames_to_column(varicella_2016, var = "year")

varicella_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2017.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2017 <- varicella_2017[-1, ,drop = FALSE]
rownames(varicella_2017) <- c(rep(201701:(201700 + nrow(varicella_2017))))
varicella_2017 <- rownames_to_column(varicella_2017, var = "year")

varicella_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2018.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2018 <- varicella_2018[-1, ,drop = FALSE]
rownames(varicella_2018) <- c(rep(201801:(201800 + nrow(varicella_2018))))
varicella_2018 <- rownames_to_column(varicella_2018, var = "year")

varicella_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2019.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2019 <- varicella_2019[-1, ,drop = FALSE]
rownames(varicella_2019) <- c(rep(201901:(201900 + nrow(varicella_2019))))
varicella_2019 <- rownames_to_column(varicella_2019, var = "year")

varicella_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2020.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2020 <- varicella_2020[-1, ,drop = FALSE]
rownames(varicella_2020) <- c(rep(202001:(202000 + nrow(varicella_2020))))
varicella_2020 <- rownames_to_column(varicella_2020, var = "year")

varicella_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2021.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2021 <- varicella_2021[-1, ,drop = FALSE]
rownames(varicella_2021) <- c(rep(202101:(202100 + nrow(varicella_2021))))
varicella_2021 <- rownames_to_column(varicella_2021, var = "year")

varicella_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/varicella/varicella_2022.csv", 
                                         col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
varicella_2022 <- varicella_2022[-1, ,drop = FALSE]
rownames(varicella_2022) <- c(rep(202201:(202200 + nrow(varicella_2022))))
varicella_2022 <- rownames_to_column(varicella_2022, var = "year")

varicella <- rbind(varicella_2010, varicella_2011, varicella_2012, varicella_2013, varicella_2014, varicella_2015, varicella_2016,
                 varicella_2017, varicella_2018, varicella_2019, varicella_2020, varicella_2021, varicella_2022)

varicella <- na.omit(varicella)
colnames(varicella) <- c("year", "cases")
write.csv(varicella, "D:\\Modelling_KDMIN\\Data\\varicella\\varicella.csv")



########### whooping_cough
whooping_cough_2010 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2010.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2010 <- whooping_cough_2010[-1, ,drop = FALSE]
rownames(whooping_cough_2010) <- c(rep(201001:(201000 + nrow(whooping_cough_2010))))
whooping_cough_2010 <- rownames_to_column(whooping_cough_2010, var = "year") 

whooping_cough_2011 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2011.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2011 <- whooping_cough_2011[-1, ,drop = FALSE]
rownames(whooping_cough_2011) <- c(rep(201101:(201100 + nrow(whooping_cough_2011))))
whooping_cough_2011 <- rownames_to_column(whooping_cough_2011, var = "year") 

whooping_cough_2012 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2012.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2012 <- whooping_cough_2012[-1, ,drop = FALSE]
rownames(whooping_cough_2012) <- c(rep(201201:(201200 + nrow(whooping_cough_2012))))
whooping_cough_2012 <- rownames_to_column(whooping_cough_2012, var = "year") 

whooping_cough_2013 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2013.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2013 <- whooping_cough_2013[-1, ,drop = FALSE]
rownames(whooping_cough_2013) <- c(rep(201301:(201300 + nrow(whooping_cough_2013))))
whooping_cough_2013 <- rownames_to_column(whooping_cough_2013, var = "year") 

whooping_cough_2014 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2014.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2014 <- whooping_cough_2014[-1, ,drop = FALSE]
rownames(whooping_cough_2014) <- c(rep(201401:(201400 + nrow(whooping_cough_2014))))
whooping_cough_2014 <- rownames_to_column(whooping_cough_2014, var = "year")

whooping_cough_2015 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2015.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2015 <- whooping_cough_2015[-1, ,drop = FALSE]
rownames(whooping_cough_2015) <- c(rep(201501:(201500 + nrow(whooping_cough_2015))))
whooping_cough_2015 <- rownames_to_column(whooping_cough_2015, var = "year")

whooping_cough_2016 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2016.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2016 <- whooping_cough_2016[-1, ,drop = FALSE]
rownames(whooping_cough_2016) <- c(rep(201601:(201600 + nrow(whooping_cough_2016))))
whooping_cough_2016 <- rownames_to_column(whooping_cough_2016, var = "year")

whooping_cough_2017 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2017.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2017 <- whooping_cough_2017[-1, ,drop = FALSE]
rownames(whooping_cough_2017) <- c(rep(201701:(201700 + nrow(whooping_cough_2017))))
whooping_cough_2017 <- rownames_to_column(whooping_cough_2017, var = "year")

whooping_cough_2018 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2018.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2018 <- whooping_cough_2018[-1, ,drop = FALSE]
rownames(whooping_cough_2018) <- c(rep(201801:(201800 + nrow(whooping_cough_2018))))
whooping_cough_2018 <- rownames_to_column(whooping_cough_2018, var = "year")

whooping_cough_2019 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2019.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2019 <- whooping_cough_2019[-1, ,drop = FALSE]
rownames(whooping_cough_2019) <- c(rep(201901:(201900 + nrow(whooping_cough_2019))))
whooping_cough_2019 <- rownames_to_column(whooping_cough_2019, var = "year")

whooping_cough_2020 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2020.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2020 <- whooping_cough_2020[-1, ,drop = FALSE]
rownames(whooping_cough_2020) <- c(rep(202001:(202000 + nrow(whooping_cough_2020))))
whooping_cough_2020 <- rownames_to_column(whooping_cough_2020, var = "year")

whooping_cough_2021 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2021.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2021 <- whooping_cough_2021[-1, ,drop = FALSE]
rownames(whooping_cough_2021) <- c(rep(202101:(202100 + nrow(whooping_cough_2021))))
whooping_cough_2021 <- rownames_to_column(whooping_cough_2021, var = "year")

whooping_cough_2022 <- as.data.frame(t(read_csv("D:/Modelling_KDMIN/Data/whooping_cough/whooping_cough_2022.csv", 
                                           col_names = FALSE, col_types = cols(X1 = col_skip())))) %>% dplyr::select(1)
whooping_cough_2022 <- whooping_cough_2022[-1, ,drop = FALSE]
rownames(whooping_cough_2022) <- c(rep(202201:(202200 + nrow(whooping_cough_2022))))
whooping_cough_2022 <- rownames_to_column(whooping_cough_2022, var = "year")

whooping_cough <- rbind(whooping_cough_2010, whooping_cough_2011, whooping_cough_2012, whooping_cough_2013, whooping_cough_2014, whooping_cough_2015, whooping_cough_2016,
                   whooping_cough_2017, whooping_cough_2018, whooping_cough_2019, whooping_cough_2020, whooping_cough_2021, whooping_cough_2022)

whooping_cough <- na.omit(whooping_cough)
colnames(whooping_cough) <- c("year", "cases")
write.csv(whooping_cough, "D:\\Modelling_KDMIN\\Data\\whooping_cough\\whooping_cough.csv")


