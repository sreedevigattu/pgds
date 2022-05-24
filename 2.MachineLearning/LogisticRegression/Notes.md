## Logistic Regression
Statistical technique to find the relationship between a qualitative (discrete) dependent variable and multiple independent variables (either continuous or discrete). Objective of this to find the class probability i.e. the probability of an observation will belong to a particular class.


sigmoid function
P(robability) = 1 / 1 + e ^ −(β0+β1x)
The process of finding the best-fit sigmoid curve, by varying β0 and β1 until to get the combination of beta values that maximises the likelihood is called logistic regression.

linearised equation is much easier to interpret. This is also known as **logit**(**log**istic probability un**it**) function or link function.

ln(p/ (1-p)) = β0 + β1x

where
- Odds = p/ (1-p)
- Log Odds = ln(p/ (1-p))
 
With every linear increase in x, the increase in odds is multiplicative. 

These models are call Generalized Linear Models (GLM). In GLM the errors do not follow normal dsitribution. The error can take only 2 values 


| Actual/Predicted | 0 | 1 |
|---|---|---|
| 0 | TN | FP |
| 1 | FN | TP |


Accuracy = (TP + TN) / (TP + FN + TN + FP) : Total correct predictions out of all the predictions

Sensitivity - TPR (True Positive Rate) = TP / (TP + FN) : Number of actual Yeses correctly predicted out of the total number of actual Yeses

Specificity = TN / (TN + FP) : Number of actual Nos correctly predicted out of the total number of actual Nos

False Positive Rate = FP / (TN + FP) : The number of false positives (0s predicted as 1s) divided by the total number of actual negatives : 1 - Specificity

Precision/ Positive Predictive Value = TP / (TP + FP) : Number of predicted positive values out of total number of the predicted positve values. 
Probability that a predicted 'Yes' is actually a 'Yes'.

Negative Predictive Value = FP / (TP + FP)

# Tradeoffs

It can be more flexible to predict the probabilities for each class instead of predicting the class values directly. It provides the capability to choose and even calibrate the threshold for how to interpret the predicted probabilities. The threshold can be adjusted to tune the behavior of the model for a specific problem. An example would be to reduce more of one or another type of error.



## ROC & Precision-Recall curves
https://machinelearningmastery.com/roc-curves-and-precision-recall-curves-for-classification-in-python/

When to use ROC curves and precision-recall curves?
- ROC curves should be used when there are roughly equal numbers of observations for each class. The reason being ROC curves present an optimistic picture of the model on datasets with a class imbalance.
- Precision-Recall curves should be used when there is a moderate to large class imbalance.

### Receiver Operating Characteristic (ROC) Curve
Shows the tradeoff between the True Positive Rate and the False Positive Rate, or simply, a tradeoff between sensitivity and specificity
It is a plot of the false positive rate (x-axis) versus the true positive rate (y-axis) for a number of different threshold values between 0.0 and 1.0. Put another way, it plots the false alarm rate versus the hit rate.

### Precision and Recall - Tradeoff

Precision-recall curve is plotted against the thresholds (on the x-axis) - precision & recall values are on the y-axis. The optimal cutoff point is where the precision & recall curves meet and their values will be equal. 


Examples:
1. A smog prediction system, we may be far more concerned with having low false negatives than low false positives. A false negative would mean not warning about a smog day when in fact it is a high smog day, leading to health issues in the public that are unable to take precautions. A false positive means the public would take precautionary measures when they didn’t need to.

2. Cancer detection

3. Churn

4. Lead

Two multi classification techniques, i.e.,

| | One vs One | One vs Rest |
|---|---|---|
| Step1 | Create Subsets - nC2 | Create Datasets - n | 
| Step2 | Model Creation | Model Creation |
| Step3 - target class | Class with highest number of counts.In case the count is same, then consider the class with maximum probability  | Class with highest probability |