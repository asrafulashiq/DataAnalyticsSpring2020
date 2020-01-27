EPI_data <- read.csv("./data/2010EPI_data.csv", skip=1)

plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
qqnorm(EPI); qqline(EPI)

DALY
DALY_var = DALY[!is.na(DALY)]
plot(ecdf(DALY_var), do.points=FALSE, verticals=TRUE)
qqnorm(DALY_var); qqline(DALY_var)

WATER_H
WATER_H_var = WATER_H[!is.na(WATER_H)]
plot(ecdf(WATER_H_var), do.points=FALSE, verticals=TRUE)
qqnorm(WATER_H_var); qqline(WATER_H_var)

boxplot(EPI,DALY_var)
qqplot(EPI,DALY)

boxplot(EPI,ENVHEALTH)
qqplot(EPI,ENVHEALTH)





