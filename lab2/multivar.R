multivariate <- read.csv("./data/multivariate.csv")
attach(multivariate)
head(multivariate)

mm<-lm(Homeowners~Immigrant)
mm
summary(mm)
plot(Homeowners~Immigrant)
abline(mm)
attributes(mm)
