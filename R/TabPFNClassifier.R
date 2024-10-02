# Load necessary namespaces
library(R6)
library(reticulate)

np <- reticulate::import("numpy")

#' TabPFN Classifier
#'
#' An R6 class to interface with the Python TabPFNClassifier.
#'
#' @docType class
#' @import R6
#' @import reticulate
#' @export
TabPFNClassifier <- R6Class("TabPFNClassifier",
  public = list(
    service_client = NULL,
    train_set_uid = NULL,  # Define train_set_uid as a modifiable field
    
    #' 
    #'
    #' @param access_token Access token for authentication.
    initialize = function(access_token = Sys.getenv("TABPFN_ACCESS_TOKEN")) {
      if (access_token == "") {
        stop("Access token not provided. Please set the TABPFN_ACCESS_TOKEN environment variable or pass it directly.")
      }
      
      # Import Python modules
      tabpfn <- reticulate::import("tabpfn_client", convert = FALSE)
      ServiceClient <- tabpfn$client$ServiceClient
      
      
      # Initialize the Python ServiceClient
      self$service_client <- ServiceClient()
      self$service_client$authorize(access_token)
    },
    
    #' 
    #'
    #' @param X A data frame or matrix of features.
    #' @param y A vector of target values.
    #' @export
    fit = function(X, y) {
      if (!is.data.frame(X) && !is.matrix(X)) {
        stop("X must be a data frame or matrix.")
      }
      if (!is.vector(y)) {
        stop("y must be a vector.")
      }
      
      # Convert R data to Python objects
      X_py <- np$array(reticulate::r_to_py(as.matrix(X)))
      y_py <- np$array(reticulate::r_to_py(as.vector(y)))
      
      tryCatch({
        self$train_set_uid <- self$service_client$upload_train_set(X_py, y_py)
      }, error = function(e) {
        stop("Error during fitting: ", e$message)
      })
    },
    
    #' 
    #'
    #' @param X A data frame or matrix of features.
    #' @return A vector of predictions.
    #' @export
    predict = function(X) {
      if (!is.data.frame(X) && !is.matrix(X)) {
        stop("X must be a data frame or matrix.")
      }
      
      # Convert R data to Python objects
      X_py <- np$array(reticulate::r_to_py(as.matrix(X)))
      
      tryCatch({
        predictions <- self$service_client$predict(self$train_set_uid, X_py, task = 'classification')
        return(reticulate::py_to_r(predictions))
      }, error = function(e) {
        stop("Error during prediction: ", e$message)
      })
    }
  )
)
