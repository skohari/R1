library(C50)
data(churn)
str(churnTrain)


predictors <- names(churnTrain)[names(churnTrain) != "churn"]
allData <- rbind(churnTrain, churnTest)
set.seed(1)
inTrainingSet <- createDataPartition(allData$churn,p = .75, list = FALSE)
churnTrain <- allData[ inTrainingSet,]
churnTest <- allData[-inTrainingSet,]


numerics <- c("account_length", "total_day_calls", "total_night_calls")
procValues <- preProcess(churnTrain[,numerics],method = c("center", "scale", "YeoJohnson"))
trainScaled <- predict(procValues, churnTrain[,numerics])
testScaled <- predict(procValues, churnTest[,numerics])


procValues
library(gbm)
forGBM <- churnTrain
forGBM$churn <- ifelse(forGBM$churn == "yes", 1, 0)
gbmFit <- gbm(formula = churn ~ ., # Use all predictors
 distribution = "bernoulli", # For classification
 data = forGBM,
 n.trees = 2000, # 2000 boosting iterations
 interaction.depth = 7, # How many splits in each tree
 shrinkage = 0.01, # learning rate
 verbose = FALSE) 


gbmTune <- train(x = churnTrain[,predictors],
 y= churnTrain$churn,
 method = "gbm")
gbmTune <- train(churn ~ ., data = churnTrain, method = "gbm")
gbmTune <- train(churn ~ ., data = churnTrain,
method = "gbm",
verbose = FALSE)


ctrl <- trainControl(method = "repeatedcv",
repeats = 5)
gbmTune <- train(churn ~ ., data = churnTrain,
method = "gbm",
verbose = FALSE,
trControl = ctrl)


ctrl <- trainControl(method = "repeatedcv", repeats = 5,
classProbs = TRUE,
summaryFunction = twoClassSummary)
gbmTune <- train(churn ~ ., data = churnTrain,
method = "gbm",
metric = "ROC",
verbose = FALSE,
trControl = ctrl)


ctrl <- trainControl(method = "repeatedcv", repeats = 5,
classProbs = TRUE,
summaryFunction = twoClassSummary)
grid <- expand.grid(interaction.depth = seq(1, 7, by = 2),
n.trees = seq(100, 1000, by = 50),
shrinkage = c(0.01, 0.1))
gbmTune <- train(churn ~ ., data = churnTrain,
method = "gbm",
metric = "ROC",
tuneGrid = grid,
verbose = FALSE,
trControl = ctrl)



grid <- expand.grid(interaction.depth = seq(1, 7, by = 2),
 n.trees = seq(100, 1000, by = 50),
 shrinkage = c(0.01, 0.1))
ctrl <- trainControl(method = "repeatedcv", repeats = 5,
 summaryFunction = twoClassSummary,
 classProbs = TRUE)
set.seed(1)
gbmTune <- train(churn ~ ., data = churnTrain,
 method = "gbm",
 metric = "ROC",
 tuneGrid = grid,
 verbose = FALSE,
 trControl = ctrl)


ggplot(gbmTune) + theme(legend.position = "top")
gbmPred <- predict(gbmTune, churnTest)
str(gbmPred)
gbmProbs <- predict(gbmTune, churnTest, type = "prob")
str(gbmProbs)


confusionMatrix(gbmPred, churnTest$churn)
rocCurve <- roc(response = churnTest$churn,
 predictor = gbmProbs[, "yes"],
 levels = rev(levels(churnTest$churn)))
rocCurve
plot(rocCurve)




