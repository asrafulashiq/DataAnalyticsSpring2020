# In-Class Work: Validation set example with
# Auto dataset

library(tidyverse)
library(ISLR)

set.seed(1)

train = sample(392,196)

Auto <- as_tibble(Auto)
attach(Auto)


lm.fit <- lm(mpg~horsepower, data = Auto, subset = train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)



lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train) # Quadratic 
mean((mpg-predict(lm.fit2,Auto))[-train]^2) 

# Cubic regression line
lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train) # Cubic
mean((mpg-predict(lm.fit3,Auto))[-train]^2)


# on the validation set.
set.seed(2)
train = sample(392,196)
lm.fit <- lm(mpg~horsepower, data = Auto, subset = train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
# the error rate is 23.29
lm.fit2 <- lm(mpg~poly(horsepower,2), data = Auto, subset = train) # Quadratic
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
# the error rate is 18.90
lm.fit3 <- lm(mpg~poly(horsepower,3), data = Auto, subset = train) # Cubic
mean((mpg-predict(lm.fit3,Auto))[-train]^2)






# k-Fold Cross Validation
# The cv.glm() function can also be used to implement k-fold CV.
# We once again, set a random seed and initialize a vector in which,
# we will store the CV errors corresponding to the polynomial fits of orders on to ten.
# here the K =10
library(boot)

set.seed(17)
cv.error.10 = rep(0,10)
for(i in 1:10){
  glm.fit = glm(mpg ~ poly(horsepower, i), data = Auto)
  cv.error.10[i] = cv.glm(Auto,glm.fit, K=10) $delta[1]
}
cv.error.10
# Notice the computation time is much shorter than LOOCV! :),
# This depends on your laptop performance :)
# We still see little evidence that using cubic or higher-order polynomials terms,
# leads to lower test error than simply using a quadratics fit


# Random forest

library(randomForest)
library(mlbench)
library(caret)

data(Titanic)

Titanic <- as_tibble(Titanic)

Titanic

trainSet <- createDataPartition(Titanic$Survived, p=0.6, times=1, list=FALSE)

traindata <- Titanic[trainSet, ]
testdata <- Titanic[-trainSet, ]

# First random forest
#control <- trainControl(method="repeatedcv", number=10, repeats=3)

model_dt <- train(Survived ~ ., data=traindata, method="rf", ntree=10)
pred_test <- predict(model_dt, testdata)
confusionMatrix(data=pred_test, factor(testdata$Survived))

