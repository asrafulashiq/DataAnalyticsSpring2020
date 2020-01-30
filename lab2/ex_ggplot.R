library(ggplot2)
ggplot(data=mtcars, mapping = aes(x=wt, y=mpg)) + geom_point() + geom_smooth()

ggplot(data=mtcars, aes(x=factor(cyl))) + geom_bar()
