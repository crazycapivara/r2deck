render_comments <- c("/* # r2deck start", "# r2deck end */")

#' Render r2deck using header def in JavaScript file
#'
#' @inheritParams r2deck
#'
#' @export
make_r2deck_viz <- function(script = NULL) {
  if (!is.null(script)) {
    contents <- readr::read_lines(script)
  } else if (rstudioapi::isAvailable()) {
    ctx <- rstudioapi::getSourceEditorContext()
    script <- ctx$path
    contents <- ctx$contents
  } else {
    return(message("rstudioapi is not available"))
  }

  idx <- which(contents %in% render_comments)
  if (length(idx) != 2) {
    return(message("nothing to render"))
  }

  r2deck_def <- contents[(idx[1] + 1):(idx[2] - 1)] %>%
    yaml::yaml.load(eval.expr = TRUE)
  args <- r2deck_def[[1]]
  args$script <- script
  func <- get(names(r2deck_def)[1])
  do.call(func, args)
}
