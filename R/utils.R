to_camel_case <- function(x) {
  gsub("_(\\w?)", "\\U\\1", x, perl = TRUE)
}

keys_to_camel_case <- function(x) {
  stats::setNames(x, to_camel_case(names(x)))
}

compact <- function(x) {
  x[!sapply(x, is.null)]
}

get_random_str <- function(len = 8) {
  replicate(len, letters[sample(1:26, 1)]) %>%
    paste0(collapse = "")
}
