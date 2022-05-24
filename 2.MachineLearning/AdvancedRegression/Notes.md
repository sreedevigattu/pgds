## How to identify the presence of non-linearity in the data?
- For Simple Linear Regression (single predictor)
    - Plot the predictor against the response variable
- For Multiple Linear Regression (mulitple predictors)
    - Plot the residuals versus the predicted values. Expectation is that there is no observable pattern
        - Residuals should be randomly scattered around 0
        - Spread of residuals should be constant - homoscedastic
        - There should be no outliers in the data
    - If non-linearity is idenitfied, plot  each predictor against the residuals to identify which predictor is causing the non-linearity

## How to handle non-linearity?
1. Polynomial Regression: Convert the predictors to polynomial predictors adn use the linear regression model. Here the response variable should be linearly dependent on the **betas**
         y = b0 + b1 * x
         y = b0 + b1 * x1 + b2 * x2 + b3 * x3 where x2=x**2, x3=x**3 and so on
2. Data Transformation:Try different transformations [ log(x), sqrt(x), exp(x)] on the predictors or the response variable, or both
    - ln(y) = b0 + b1x
    - y = b0 + b1 * exp(-x)
    - If the relationship between the predictor and response variable was non-linear, transform the **predictor** variables
    - If in the residual plots, the error terms are not normal or they exhibit non-constant variance, transform the **response** variable
3. Nonlinear Regression is used for models in which the response variable is related nonlinearly with the **parameters or the model coefficients or the betas**

## Linear Regression Pitfalls
- Non-constant variance: 
    - How to detect? In the residual plots, the variances of the error terms may show a steady increase or decrease (heteroscedasticity).
    - Solution: Transform the response Y using a function such as log or the square root of the response value.
- Autocorrelation and time series issue: This happens when data is collected over time and the model fails to detect any time trends. Plot residual plots across time, errors in the model are correlated positively over time, such that each error point is more similar to the previous error. This is known as autocorrelation. Such correlations frequently occur in the context of time series data, which consists of observations for which measurements are obtained at discrete points in time.  
    - How to detect? Plot the residuals from our model as a function of time. If there is an observable pattern then the errors are autocorrelated.
    - How to handle? Autoregression model

- Multicollinearity: Two or more of the predictors are linearly related to each other when building a model. 
    - How to detect: 
        - Plot the correlation matrix of the predictors
        - Calculate the variance inflation factor (VIF)
    - How to handle?
        - Drop one of the problematic variables from the regression model
        - Combine the collinear variables together into a single predictor - Regularization 
- Overfitting: Model performs well on the training data but performs poorly on the unseen test data.
    - How to handle?
        - Increase the amount and diversity of the training data
        - Regularization
- Extrapolation: Extrapolation occurs when we use a linear regression model to make predictions for predictor values that are not present in the range of data used to build the model. 

