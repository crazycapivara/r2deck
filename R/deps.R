read_deps <- function() {
  system.file("htmlwidgets/deps.yaml", package = "r2deck") %>%
    yaml::read_yaml() %>%
    utils::modifyList(getOption("r2deck_deps", list()))
}

use_deps <- function(dep_names) {
  deps <- read_deps()
  if (!all(dep_names %in% names(deps))) {
    stop("available deps [", paste(names(deps), collapse = ", "), "]")
  }

  lapply(deps[dep_names], function(dep) {
    do.call(htmltools::htmlDependency, dep)
  })
}

#' Append dependencies
#'
#' Append further dependencies to the list of available dependencies, so that they can
#'   be used by \code{\link{r2deck}} or \code{\link{r2mapbox}}.
#'
#' @param filename The name of the file containing the dependency definitions.
#'
#' @export
append_deps <- function(filename) {
  options(r2deck_deps = yaml::read_yaml(filename))
  names(available_deps())
}

#' Show available dependencies
#'
#' @export
available_deps <- function() {
  lapply(read_deps(), function(dep) c(version = dep$version))
}

#' Use default dependencies
#'
#' @export
use_default_deps <- function() {
  c("deck.gl", "mapbox-gl")
}

#' Add h3 lib to the default denpendencies
#'
#' @export
use_h3 <- function() {
  c("h3-js", use_default_deps())
}
