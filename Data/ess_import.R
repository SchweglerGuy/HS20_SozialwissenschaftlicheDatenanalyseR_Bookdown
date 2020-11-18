#Laden der Daten
daten_ess <- read.csv(file = "Data/ESS1-8e01_HS20.csv")
daten_ess$zv <- rm()
daten_ess$agea_l <- rm()


#Definieren von fehlenden Werten
daten_ess$yrbrn[daten_ess$yrbrn==7777 |
                  daten_ess$yrbrn==8888 |
                  daten_ess$yrbrn==9999] <- NA
daten_ess$agea[daten_ess$agea==999] <- NA
daten_ess$edulvla[daten_ess$edulvla>5] <- NA
daten_ess$eisced[daten_ess$eisced>7] <- NA
daten_ess$eduyrs[daten_ess$eduyrs>76] <- NA
daten_ess$polintr[daten_ess$polintr>4] <- NA


#Faktoren definieren.
