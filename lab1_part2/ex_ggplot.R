library(ggplot2)
ggplot(data=mtcars, mapping = aes(x=wt, y=mpg)) + geom_point() + geom_smooth()

ggplot(data=mtcars, aes(x=factor(cyl))) + geom_bar()

ggplot(data=mtcars, aes(x=mpg)) + geom_histogram(binwidth = 1)

ggplot(data=ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
