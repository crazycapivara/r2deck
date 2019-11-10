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

#' Create a widget object
#'
#' @param script The name of the JavaScript file containing the vizualisation function.
#' @param data The data that is passed to the vizualisation function.
#' @param longitude ...
#' @param latitude ...
#' @param zoom ...
#' @param map_style ...
#' @param options (optional) Additional options that are passed to the vizualisation function as parameter \code{options}.
#' @param width (optional) The width of the widget.
#' @param height (optional) The height of the widget.
#' @param element_id (optional) The unique id of the widget.
#' @param ... Additional properties (picking radius, ...) that are passed to the Deck class.
#'
#' @import htmlwidgets
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

#' Create a widget object using the Mapbox WebGL context
#'
#' @inheritParams r2deck
#' @param center ...
#' @param style The style definition of the map conforming to the Mapbox Style Specification.
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
