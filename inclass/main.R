library(tidyverse)

install.packages('MASS')
data(Boston, package="MASS")

Boston <- as_tibble(Boston)
pca_out <- prcomp(Boston, scale. = T)

plot(pca_out)
biplot(pca_out, scale = 0)

boston_pc <- as_tibble(pca_out$x)
boston_pc
