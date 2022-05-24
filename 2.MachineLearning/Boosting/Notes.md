# Ensemble

## Bagging

## Boosting

A sequence of weak learners to form the final model. 

### Adaptive Boosting

For this, each model is trained to correct the errors made by the previous one. This sequential model does this by adding more weight to cases with incorrect predictions. By this approach, the ensemble model will correct itself while learning by focusing on cases/data points that are hard to predict correctly. 

### Gradient Boosting

 Newly added trees are trained to reduce the errors (loss function) of earlier models. Optimizing the performance of the model by bringing down the loss one small step at a time. 

1. Make first Predictions
2. Calculate pseudo-residuals
3. Make new predictions
4. Repeat Setps 2 & 3 M times
Make final predcitions

Gradient boosting reduces the error with each iteration
Take a step towards the negative gradient of the loss function.

At each iteration we add an incremental model, which fits on the negative gradients of the loss function evaluated at current target values. This incremental model can be a linear regression model or a decision tree or any other model. We stop when we see that the gradients/residuals are very close to zero.

Introducing step multiplier results in a small step in the right direction.

### xGBoost
Extreme Gradient Boosting (XGBoost) is extended version of gradient boosting, where it uses more accurate approximations to tune the model and find the best fit.
- Uses **regularization** to controls the overfitting and simplicity of the model which gives it better performance.
- Uses Parallel Computing
Hyperparameters:
- Learning Rate: lambda - Also known as shrinkage
- Number of Trees
- Subsampling: Training the model in each iteration on a fraction of data

Questions:
Relation between DTs, RFs & Bagging, Boosting - Regression & Classification