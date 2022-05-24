## Overview

‘the models should not be so simple as to not identify even the important patterns present in the data on one hand and on the other hand, they should not be so complex so as to even learn the noise present in the dataset’.

Model has high variance: The model changes a lot even with slight changes in the data

## Model Evaluation - Classification Metrics

ROC curve is used to understand the strength of the model by


## Hyper parameter tuning

```Hyperparameters```: Parameters that are passed to the learning algorithm to control the training of the model and estimate the model parameters. 

```Model parameters``` are the parameters that are determined using the training set on which the model is built. T

2 Methods:
- RandomiszedSearchCV:
- GridSearchCV:

``Grid Search`` is a method to perform hyper-parameter optimisation, that is, to find the best combination of hyper-parameters (e.g. learning rate) for a given model and test dataset.  

```Cross validation```: Helps us find how well it generalizes (how well it performs on new data)
```k-fold cross-validation ```splits data into k bins, use each bin as testing data and use rest of the data as training data and validate against testing data. Repeat the process k times. And Get the average performance. k-fold cross validation especially useful for small dataset since it maximizes both the test and training data.

Set up a grid of the hyperparameter values, and for each parameter combination, we train a model and get a score on the test data.
cv: number of cross-validation you have to try for each selected set of hyperparameters.
- Coarse tuning: identify a narrow range of hyperparameter values
- Fine-tuning: Fine-tune your model within this limited range of hyperparameter values and improve the model performance further.
