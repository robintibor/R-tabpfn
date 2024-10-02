
# TabPFN for R

## Installation


```R
devtools::install_github("robintibor/R-tabpfn")
library(tabpfn)
install_tabpfn()
```


## Usage


```R
access_token = "YOUR_ACCESS_TOKEN"

classifier <- TabPFNClassifier$new(access_token = access_token)
# 
# Prepare your data (example)
X <- data.frame(feature1 = rnorm(100), feature2 = rnorm(100))
C <- 3
y <- sample(0:(C-1), 100, replace = TRUE)

# Fit the model
classifier$fit(X, y)

# Make predictions

predictions <- classifier$predict(X)

# Print results
print(predictions)
```
