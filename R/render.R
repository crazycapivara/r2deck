render_comments <- c("/* # r2deck start", "# r2deck end */")

#' Render r2deck using header def in JavaScript file
#'
#' @export
render_r2deck <- function() {
  ctx <- rstudioapi::getSourceEditorContext()
  idx <- which(ctx$contents %in% render_comments)
  if (length(idx) != 2) {
    return(message("nothing to render"))
  }

  r2deck_def <- ctx$contents[(idx[1] + 1):(idx[2] - 1)] %>%
    yaml::yaml.load(eval.expr = TRUE)
  args <- r2deck_def[[1]]
  args$script <- ctx$path
  func <- get(names(r2deck_def)[1])
  do.call(func, args)
}
