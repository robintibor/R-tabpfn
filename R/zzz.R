.onLoad <- function(libname, pkgname) {
  reticulate::use_virtualenv("r-tabpfn", required = FALSE)
}