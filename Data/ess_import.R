#Laden der Daten
daten_ess <- read.csv(file = "Data/ESS1-8e01_HS20.csv")
daten_ess$zv <- rm()
daten_ess$agea_l <- rm()
daten_ess$x <- rm()

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
#gndr
daten_ess$gndr <- factor(daten_ess$gndr)
levels(daten_ess$gndr) <- c("male", "female")

#chldhm
daten_ess$chldhm[daten_ess$chldhm==9] <- NA
daten_ess$chldhm <- factor(daten_ess$chldhm)
levels(daten_ess$chldhm) <- c("Respondent lives with children at household grid", "Does not")

#pdwrk
daten_ess$pdwrk <- factor(daten_ess$pdwrk)
levels(daten_ess$pdwrk) <- c("not marked", "paid work (in the last 7 days)")

#edctn
daten_ess$edctn <- factor(daten_ess$edctn)
levels(daten_ess$edctn) <- c("not marked", "education (in the last 7 days)")

#uemp3m
daten_ess$uemp3m <- factor(daten_ess$uemp3m)
levels(daten_ess$uemp3m) <- c("Has been unemployed", "Has never been unemployed", "Refusal", "Don't know", "No answer")

#polintr
daten_ess$polintr <- factor(daten_ess$polintr, ordered = T)
levels(daten_ess$polintr) <- c("Very interested",
                               "Quite interested",
                               "Hardly interested",
                               "Not at all interested")
##Änderung der Reihenfolge der Levels
daten_ess$polintr <- ordered(daten_ess$polintr,
                             levels = c("Not at all interested",
                                        "Hardly interested",
                                        "Quite interested", "Very interested"))

#edulvla
daten_ess$edulvla <- factor(daten_ess$edulvla, ordered = T)
levels(daten_ess$edulvla) <- c("ISCED 0-1",
                               "ISCED 2",
                               "ISCED 3",
                               "ISCED 4",
                               "ISCED 5-6")

#eisced
daten_ess$eisced <- factor(daten_ess$eisced, ordered = T)
levels(daten_ess$eisced) <- c("ES-ISCED I",
                              "ES-ISCED II",
                              "ES-ISCED IIIb",
                              "ES-ISCED IIIa",
                              "ES-ISCED IV",
                              "ES-ISCED V1",
                              "ES-ISCED V2")
