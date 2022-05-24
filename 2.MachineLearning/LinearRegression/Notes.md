# Simple Linear Regression (SLR) Model
Statistical relationship between 2 continuous quantitative variables
- x: predictor, 
- y: response

SLR establishes existence of an association relationship between 2 variables and not a causal relationship.

## Equation for the Best Fitting line

We use the equation to predict the actual response yi

ŷi = b0 + b1 xi, where
- ŷi predicted response
- yi actual response 
- b0, b1 are estimated regression coefficients. b0 is the intercept. b1 is the slope.

We make a prediction error/residual error: ei = yi−ŷ i

A line that fits the data "best" will be one for which the n prediction errors are as small as possible.

We need to find the values b0 and b1 that make the sum of the squared prediction errors the smallest or get the "least squares estimates" for b0 and b1
- **RSS**: Residual Sum of Squares =  ∑ (yi−ŷ i)2

- **What does b0 tell us?** In general, if the "scope of the model" includes x = 0, then b0 is the predicted mean response when x = 0. Otherwise, b0 is not meaningful. 
For example, if we have a equation between height and weight, this would give us the height when weight = 0, which is not meaningful as 0 weight is not in the scope of the model.
- **What does b1 tell us?** We can expect the mean response to increase or decrease by b1 units for every one unit increase in x.

For linear regression, RSS is the cost function. Ways to minimize the cost function to reach the optimal solution
- Differentiation
- Gradient descent is an optimisation algorithm that optimises

## Coefficient of Determination, r-squared
- **RSS - Residual Sum of Squares | SSE - Error sum of squares**: Quantifies how much the data points, yi, vary around the estimated regression line, ŷ 
    - ∑ (yi−ŷi)2
- **TSS | SSTO - Total Sum of Squares**: Quantifies how much the data points, yi, vary around their mean, y¯
- **SSR - Regression sum of squares**: Quantifies how far the estimated sloped regression line, ŷi, is from the horizontal "no relationship line," the sample mean or  y
- **MSE** = 1/𝑛 ∑𝑛𝑖=1(𝑦𝑖−𝑦̂ 𝑖)2   𝑅𝑀𝑆𝐸=√ 𝑀𝑆𝐸‾‾‾‾‾‾
- **𝑆𝑆𝐸** = 𝑛 × 𝑀𝑆𝐸

r2 = SSR/SSTO = 1−SSE/SSTO = 1 - RSS/TSS

where SSTO = SSR + SSE

- Since r2 is a proportion, it is always a number between 0 and 1.
- r2 × 100 percent of the variation in y is "explained by/ accounted for by" the variation in predictor x."
- If r2 = 1, all of the data points fall perfectly on the regression line. The predictor x accounts for all of the variation in y!
- If r2 = 0, the estimated regression line is perfectly horizontal. The predictor x accounts for none of the variation in y!

- TSS is total variation in Y
- RSS is the variation in y that is not explained
- TSS - RSS is the variation in Y that is explained by the model

## (Pearson) Correlation Coefficient r
r = ±√‾‾r2
- The sign of r depends on the sign of the estimated slope coefficient b1
- The closer r is to 0, the weaker the linear relationship. 
- The closer r is to -1, the stronger the negative linear relationship. 
- The closer r is to 1, the stronger the positive linear relationship.

Cautions of r2
- Caution # 1: The coefficient of determination r2 and the correlation coefficient r quantify the strength of a "linear" relationship. It is possible that r2 = 0% and r = 0, suggesting there is no linear relation between x and y, and yet a perfect curved (or "curvilinear" relationship) exists.
- Caution # 2: A large r2 value should not be interpreted as meaning that the estimated regression line fits the data well. Another function might better describe the trend in the data.
- Caution # 3: The coefficient of determination r2 and the correlation coefficient r can both be greatly affected by just one data point (or a few data points).
- Caution # 4: Correlation (or association) does not imply causation.

- Caution # 5: Ecological correlations — correlations that are based on rates or averages — tend to overstate the strength of an association.
- Caution # 6: A "statistically significant" r2 value does not imply that the slope β1 is meaningfully different from 0.
- Caution # 7: A large r2 value does not necessarily mean that a useful prediction of the response ynew, or estimation of the mean response µY, can be made. It is still possible to get prediction intervals or confidence intervals that are too wide to be useful.

## Assumptions of Simple Linear Regression
    - There is a linear relationship between X and Y:
    - Error terms are normally distributed with mean zero(not X, Y):
    - Error terms are independent of each other:
    - Error terms have constant variance (homoscedasticity)


## Hypothesis testing
Every time you perform a linear regression, you need to test whether the fitted line or β1 is a significant one or not i.e. Hypothesis Testing on β1 

- Start by saying that β1 is not significant, i.e. there is no relationship between X and y.

| Hypothesis |  p-value of co-eff | Result of the hypothesis testing | β1 | Model |
|---|---|---|---|---|
| Null Hypothesis (H0): β1=0 | > 0.05  | Fail to reject the H(0) | β1 is not statistically significant | Overall model fit is by chance. No use in the model | 
| Alternate Hypothesis (HA): β1≠0 | < 0.05 | Reject the H(0) | β1 is statistically significant | Overall model fit is significant. Line fitted is a significant one | 

F-statistic and Prob(F-statistic)
- R-squared : How much variance in the data is explained by the model?
- Coefficients and p-values: Is the coefficient significant (Low p-value) or not. 

# Multiple Linear Regression

Y = β0 + β1 X1 + β2 X2 + .... βpXp + ϵ
- The model now fits a hyperplane instead of a line.
- Coefficients are still obtained by minimising the sum of squared errors, the least squares criteria.
- For inference, the assumptions from simple linear regression still hold: zero mean, independent and normally distributed error terms with constant variance.

1. Overfitting: The model may end up memorising the training data and, consequently, fail to generalise. A model is generally said to overfit when the training accuracy is high while the test accuracy is very low.
2. Multicollinearity: This refers to associations between predictor variables.
3. Feature selection: Selecting an optimal set from a pool of given features, many of which might be redundant, becomes an important task.

##  Multicollinearity

Phenomenon of having related predictor (independent)  variables in the input data set. In a model some of the variables might be interrelated, due to which the presence of that variable in the model is redundant. 

Multicollinearity affects
- Interpretation: Does “change in Y when all others are held constant” apply?
- Inference: Coefficients swing wildly, signs can invert. Therefore, p-values are not reliable.

If the variable is being described well by the rest of the feature variables, it means that it has a high VIF, meaning it is redundant in the presence of the other variables. 

How to detect muli-collinearity?
- Looking at pairwise correlations - correlation between different pairs of independent variables
- Checking the variance inflation factor (VIF): An independent variable may depend upon a combination of other variables.
- VIF calculates how well one independent variable is explained by all the other independent variables combined.
- VIFi = 1 / 1 - Ri2

The common heuristic we follow for the VIF values is:
- > 10:  VIF value is definitely high, and the variable should be eliminated.
- > 5:  Can be okay, but it is worth inspecting.
- < 5: Good VIF value. No need to eliminate this variable.

How to deal with multicollinearity? 
- Dropping variables: 
    - Drop the variable that is highly correlated with others.
    - Pick the business interpretable variable.
- Creating a new variable using the interactions of the older variables. Add interaction features, i.e., features derived using some of the original features.
- Variable transformations: Principal component analysis (covered in a later module)

### Scaling 
just affects the coefficients and none of the other parameters, such as t-statistic, F-statistic, p-values and R-squared.

- Standardisation: Brings all the data into a standard normal distribution with mean 0 and standard deviation 1
    - x = [x-mean(x)]/sd(x)
- MinMaxScaling (Normalization): Brings all the data in the range of 0-1. 
    - x = [x - min(x)]/[max(x)-min(x)]


You need to maintain a balance between keeping the model simple and explaining the highest variance (which means that you would want to keep as many variables as possible). You can do this using the key idea that a model can be penalised for keeping a large number of predictor variables. 

Adjusted R2: The adjusted R2 adjusts the value of R2 such that a model with a larger number of variables is penalised.

Feature Selection: 
Get an optimal number of features for the model
- Build the model with all the features,
- Drop the features that are the least helpful in prediction (high p-value),
- Drop the features that are redundant (using correlations and VIF),
- Rebuild the model and repeat.
- Check if the residual terms are distributed normally
- Also check for visible patterns in the error terms in order to determine that these terms have a constant variance. The error terms should be randomly distributed and should not have any pattern.

- Automated elimination (coarse tuning)  when you have a small set of potential variables left to work with
- Manual elimination: Use your expertise and subjectivity to eliminate a few other features (fine tuning).

## 4. Train the model - Add all variables and drop one variable at a time
Algorithm
1. Build model
2. Look at p-values and VIF
    | | Desired/Retain| Remove |
    |---|---|---|
    | p-values | Low p-values/High significance < 0.05 | High p-values: p-value > 0.05|
    | VIF | Low VIF VIF < 5  | High VIF: VIF > 5 |
3. Iterate:  Drop variables one by one and repeat 1, 2 & 3
    ||||
    |---|---|---|
    | 1 | High p-value, High VIF | Remove |
    | 2 | Low p-value, low VIF | Retain |
    | 3 | High p-value, Low VIF | Remove one at a time, build model|
    | 4 | Low p-value, High VIF | |


Linear Regression only interpolates...does not extrapolate
 Vs Prediction Vs  Vs Estimation
| | Prediction | Forecasting/Projection |
|---|---|---|
| Focus | Causes/driver variables impacting the outcome | Projected result or forecasted value |
| Complexity/Accuracy of hte model | Simple/explainable models  | High accuracy | 
| Assumption | No specific assumption | Assumes everything remains the same | 

## How to build the model?

- Missing/invalid values handling
- Scaling, Convert categorical variables to dummy variables
- Split the dataset
- Feature Selection: Get an optimal number of features for the model
    - Automated elimination (coarse tuning) using RFE
    - Manual elimination (fine tuning) using your expertise and subjectivity to eliminate a few other features (fine tuning).
    - Build the model with the selected features
        - Check feature level metrics
            - p-value: Drop the features that are the least helpful in prediction (high p-value),
            - Correlations and VIF: Drop the features that are redundant
        - Check model level metrics
            - R2, Adjusted R2: How well the chosen predictor variables explain the variability in y
            - F-statistic: Significance of the model
        - Check with test dataset & check the model level statistics
    - Rebuild the model and repeat.
    - Check if the residual terms are distributed normally
    - Also check for visible patterns in the error terms in order to determine that these terms have a constant variance. The error terms should be randomly distributed and should not have any pattern.