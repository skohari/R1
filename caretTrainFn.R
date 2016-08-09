
library(mlbench)
library(caret)
data(Sonar)
str(Sonar[, 1:10])
set.seed(998)
inTraining <- createDataPartition(Sonar$Class, p = 0.75, list = FALSE)
training <- Sonar[ inTraining,]
testing  <- Sonar[-inTraining,]

targetVar <- eval(quote(Class ~ .)); 

fitControl <- trainControl(## 10-fold CV
                           method = "repeatedcv",
                           number = 10,
                           ## repeated ten times
                           repeats = 10)

set.seed(825)
gbmFit1 <- train(targetVar, data = training,
                 method = "gbm",
                 trControl = fitControl,
                 verbose = FALSE
)


gbmFit1


