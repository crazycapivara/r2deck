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
#' @param lng The longitude of the initial geographical center point of the map.
#' @param lat The latitude of the initial geographical center point of the map.
#' @param zoom The initial zoom level of the map.
#' @param map_style The style definition of the map conforming to the Mapbox Style Specification.
#' @param options (optional) Additional options that are passed to the vizualisation function as parameter \code{options}.
#' @param width (optional) The width of the widget.
#' @param height (optional) The height of the widget.
#' @param element_id (optional) The unique id of the widget.
#' @param ... Additional properties (picking radius, ...) that are passed to the Deck class.
#'
#' @import htmlwidgets
#' @export
r2deck <- function(script, data, lng = -122.45, lat = 37.8, zoom = 8, map_style = get_carto_style(),
                   options = NULL, width = NULL, height = NULL, element_id = NULL, ...) {
  make_widget(
    script,
    data,
    web_gl_context = "deck",
    options = options,
    width = width,
    height = height,
    element_id = element_id,
    longitude = lng,
    latitude = lat,
    zoom = zoom,
    mapStyle = map_style,
    ...
  )
}

#' Create a widget object using the Mapbox WebGL context
#'
#' @inheritParams r2deck
#' @export
r2mapbox <- function(script, data, lng = -122.45, lat = 37.8, zoom = 8, map_style = get_carto_style("dark-matter"),
                     options = NULL, width = NULL, height = NULL, element_id = NULL, ...) {
  make_widget(
    script,
    data,
    web_gl_context = "mapbox",
    options = options,
    width = width,
    height = height,
    element_id = element_id,
    center = c(lng, lat),
    zoom = zoom,
    style = map_style,
    ...
  )
}
