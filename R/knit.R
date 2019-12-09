knit_r2deck <- function(options) {
  args <- list(
    script = options$code,
    data = options$data,
    lng = options$lng,
    lat = options$lat,
    zoom = options$zoom,
    pitch = options$pitch,
    map_style = options$map_style,
    options = options$options,
    width = options$width,
    height = options$height
  )
  #widget <- r2deck(
  #  script = options$code,
  #  data = options$data
  #)
  widget <- do.call(r2deck, compact(args))
  widget_output <- knitr::knit_print(widget, options = options)
  knitr::engine_output(
    options,
    out = list(
      structure(list(src = options$code), class = "source"),
      widget_output
    )
  )
}
