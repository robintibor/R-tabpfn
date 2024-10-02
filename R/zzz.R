np <- NULL
.onLoad <- function(libname, pkgname) {
  reticulate::use_virtualenv("r-tabpfn", required = FALSE)
  np <<- reticulate::import("numpy", delay_load = TRUE)
}