
# TabPFN for R

## Installation


```R
devtools::install_github("robintibor/R-tabpfn")
library(tabpfn)
install_tabpfn()
```


## Usage


```R
# Load library, set access token, create classifier
library(tabpfn)
access_token = "YOUR_ACCESS_TOKEN"
classifier <- TabPFNClassifier$new(access_token = access_token)

# Prepare your data (here random example data)
X <- data.frame(feature1 = rnorm(100), feature2 = rnorm(100))
num_classes <- 3
y <- sample(0:(num_classes-1), 100, replace = TRUE)

# Fit the model
classifier$fit(X, y)

# Make predictions
predictions <- classifier$predict(X)

# Print results
print(predictions)
```
