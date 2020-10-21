# Skript zu Simulation des Standardfehlers

#Ebene der Grundgesamtheit

variable_population <- runif(10000,
                             min = 0,
                             max = 20)
mean(variable_population)
sd(variable_population)
hist(variable_population,
     breaks = 30,
     col="orange",
     main="Unsere Grundgesamtheit",
     xlim = c(0,20)
     )

#Ebene der einzelnen Stichprobe

sample1 <- sample(variable_population, 100)
mean(sample1)
mean(variable_population)
hist(variable_population,
     breaks = 30,
     col="orange",
     main="Unsere Grundgesamtheit",
     xlim = c(0,20)
     )
points(rep(mean(sample1), 2),
       c(0, 100),
       type = "l",
       col = 2,
       lwd = 5)

# Ebene der einzelnen Stichprobe als *Loop*

hist(variable_population,
     breaks = 30,
     col = "orange",
     main="Unsere Grundgesamtheit",
     xlim = c(0,20)
     )

for (i in 1:100) {
sample1 <- sample(variable_population, 100)
points(rep(mean(sample1), 2),
       c(0, 300),
       type = "l",
       col = i,
       lwd = 1)
}


# Stichprobenziehung als *Funktion*

meine_samples <- function(x, n, trials) {
variable_sample <- sample(x, n)
for (i in 1:(trials - 1)){
variable_sample <- cbind(variable_sample, sample(x, n))
}
return(variable_sample)
}

stichproben_200 <- meine_samples(variable_population, 30, 200)


# Ebene der Stichprobenverteilung

mittelwerte <- apply(stichproben_200, 2, mean)
hist(mittelwerte,
     breaks = 10,
     col = "blue",
     main = "Unsere Stichprobenmittelwerte",
     xlim=c(3,17)
     )


# *Gemeinsame Darstellung* der Stichprobenverteilung in der Grundgesamtheit anhand der Histogramme

hist(variable_population,
     breaks = 30,
     col = "orange",
     main = "Grundgesamtheit mit Stichprobenverteilung",
     xlim = c(0, 20),
     )

mittelwerte_samples <- apply(meine_samples(variable_population,
                                           50,
                                           1000),
                             2,
                             mean)

hist(mittelwerte_samples,
     breaks = 10,
     col = "blue",
     add = T)
