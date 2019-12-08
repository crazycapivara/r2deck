read_deps <- function() {
  system.file("htmlwidgets/deps.yaml", package = "r2deck") %>%
    yaml::yaml.load_file()
}

use_deps <- function(dep_names) {
  deps <- read_deps()
  if (!all(dep_names %in% names(deps))) {
    stop("available deps [", paste(names(deps), collapse = ", "), "]")
  }

  lapply(deps[dep_names], function(dep) {
    if (is.na(dep$src["href"])) {
      dep$package <- "r2deck"
    }

    do.call(htmltools::htmlDependency, dep)
  })
}

#' Show available deps
#'
#' @export
available_deps <- function() {
  deps <- read_deps()
  lapply(deps, function(dep) c(version = dep$version))
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
