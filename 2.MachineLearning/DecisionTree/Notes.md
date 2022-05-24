Decision Trees (DTs) are a non-parametric* supervised learning method used for classification and regression. The goal is to create a model that predicts the value of a target variable by learning simple decision rules inferred from the data features.

*The nonparametric method refers to a type of statistic that does not make any assumptions about the characteristics of the sample (its parameters) or whether the observed data is quantitative or qualitative.

- Top-down
- Greedy: The Decision Tree is a high-variance model i.e. any small change in the data will result in a big change in the decision tree

- In decision trees, you do not have to treat missing values, outliers and multicollinearity before proceeding with model building.

Decision tree construction would be done by splitting the data set such that the homogeneity of the resultant partitions is maximum. Try to split the nodes such that the resulting nodes are as homogenous as possible. Remember: Homogeneity is always referred to response (target) variable's homogeneity.
- For classification purposes, a data set is completely homogeneous if it contains only a single class label. 
- For regression purposes, a data set is completely homogeneous if its variance is as small as possible. You will understand regression trees better in the upcoming segments.
 
pick an **attribute**
pick a **rule** to split data into
multiple partitions to 
increase the homogenity of the dataset. 

Discretization is a process of quantizing continuous attributes

Methods to quantify homogeneity
- Classification error E = 1 −max(pi)
- Gini index/impurity: Gini index is the degree of a randomly chosen datapoint being classified incorrectly. 
    - pi(1-pi)
    - Higher the homogeneity, the lower the Gini index.
    - Gini index of 0 indicates that all the data points belong to a single class. 
    - Gini index of 0.5 indicates that the data points are equally distributed among the different classes.
- Entropy: Degree of disorder in the given data, its value varies from 0 to 1
    - Higher the homogeneity, the lower the entropy
    - If a data set is completely homogenous i.e., there is no disorder in the data then the entropy of such a data set will be 0
    - If a data set contains an equal distribution of both the classes i.e., there is complete disorder in the data. then the entropy of that data set will be 1, 

Information Gain: Reduction in entropy
Gain = D - Da 
- D   - Entropy of the parent set (data before splitting),
- DA  - Entropy of the partitions obtained after splitting on attribute A

CART