
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


