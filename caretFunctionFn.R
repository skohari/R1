library(mlbench)
library(caret)
data(Sonar)
str(Sonar[, 1:10])
set.seed(998)
inTraining <- createDataPartition(Sonar$Class, p = 0.75, list = FALSE) 	#Decision Point
training <- Sonar[ inTraining,]
testing  <- Sonar[-inTraining,]

fitControl <- trainControl(## 10-fold CV
                           method = "repeatedcv", 	# Decision Point
                           number = 10,
                           ## repeated ten times
                           repeats = 2)


dset1 = list(training, testing, training); length(dset1)
targetVar <- 'Class';
tv <- as.formula(paste(targetVar, "~", ".")); 
tv; str(tv)

set.seed(825)
for(i in 1:length(dset1)) {
 gbmFit1 <- train(as.formula(tv), data = as.data.frame(dset1[i]),
                 method = "lda", 				# Decision Point
                 trControl = fitControl,
                 verbose = FALSE)
 print(gbmFit1)
}


sum((predict(gbmFit1, newdata= training) == training$Class))

