make_widget <- function(script, data, web_gl_context = "deck", options = NULL,
                        width = NULL, height = NULL, element_id = NULL, ...) {
  widgetData <- list(
    script = readr::read_file(script),
    data = data,
    webGLContext = web_gl_context,
    options = options,
    deckGLProperties = keys_to_camel_case(list(...)),
    props = list(
      df = inherits(data, "data.frame"),
      mapboxAccessToken = Sys.getenv("MAPBOX_ACCESS_TOKEN")
    )
  )
  htmlwidgets::createWidget(
    "rdeck",
    widgetData,
    width = width,
    height = height,
    package = "rdeck",
    elementId = element_id
  )

}

#' @export
r2deck <- function(script, data, longitude = -122.45, latitude = 37.8, zoom = 8, map_style = get_carto_style(),
                   options = NULL, width = NULL, height = NULL, element_id = NULL, ...) {
  make_widget(
    script,
    data,
    web_gl_context = "deck",
    options = options,
    width = width,
    height = height,
    element_id = element_id,
    longitude = longitude,
    latitude = latitude,
    zoom = zoom,
    mapStyle = map_style,
    ...
  )
}

#' @export
r2mapbox <- function(script, data, center = c(-122.45, 37.8), zoom = 8, style = get_carto_style("dark-matter"),
                     options = NULL, width = NULL, height = NULL, element_id = NULL, ...) {
  make_widget(
    script,
    data,
    web_gl_context = "mapbox",
    options = options,
    width = width,
    height = height,
    element_id = element_id,
    center = center,
    zoom = zoom,
    style = style,
    ...
  )
}
