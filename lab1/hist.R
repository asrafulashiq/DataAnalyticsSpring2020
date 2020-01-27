EPI_data <- read.csv("./data/2010EPI_data.csv", skip=1)
attach(EPI_data)
tf <- is.na(EPI)
E <- EPI[!tf]

png(filename="hist_epi.png")

hist(EPI)
lines(density(EPI,na.rm=TRUE,bw=1.))
rug(EPI)

dev.off()
