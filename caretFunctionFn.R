library(mlbench)
library(caret)
data(Sonar)
str(Sonar[, 1:10])
set.seed(998)
inTraining <- createDataPartition(Sonar$Class, p = 0.75, list = FALSE) 	# Decision Point
training <- Sonar[ inTraining,]
testing  <- Sonar[-inTraining,]
dset1 = list(training, testing, training); length(dset1)
targetVar <- 'Class';                                            # Decicion Point

fitControl <- trainControl(## 10-fold CV
                           method = "repeatedcv", 	             # Decision Point
                           number = 10,
                           ## repeated ten times
                           repeats = 2
)

tv <- as.formula(paste(targetVar, "~", ".")); 

set.seed(825)
for(i in 1:length(dset1)) {
 gbmFit1 <- train(as.formula(tv), data = as.data.frame(dset1[i]),
                 method = "lda", 				              # Decision Point
                 trControl = fitControl,
                 verbose = FALSE)
 print(gbmFit1)
}
predict(gbmFit1, newdata= training)
sum(predict(gbmFit1, newdata= training) == training$Class) 

