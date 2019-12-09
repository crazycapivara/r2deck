.onAttach <- function(libname, pkgname) {
  if (requireNamespace("knitr", quietly = TRUE)) {
    knitr::knit_engines$set(r2deck = knit_r2deck)
  }
}
