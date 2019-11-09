#' Create a widget object
#'
#' @param script The name of the JavaScript file containing the vizualisation function.
#' @param data The data that is passed to the vizualisation function.
#' @param deck_properties The properties (viewport settings, picking radius, ...) that are passed to the Deck class.
#'   Ignored if parameter \code{mapbox_properties} is set.
#' @param width (optional) The width of the widget.
#' @param height (optional) The height of the widget.
#' @param element_id (optional) The unique id of the widget.
#' @param mapbox_properties (optional) The properties that are passed to the Mapbox map object.
#'   Only needed if the layers should be drawn into the same WebGL context that the Mapbox map is rendered in.
#'   In this case you need to add your layers via \code{deck.MapboxLayer} to the \code{mapboxgl.Map} object.
#'   This is useful if you want to combine Deck and Mapbox layers with each other in a smooth way.
#' @param ... (optional) Additional options that are passed to the vizualisation function as parameter \code{options}.
#'
#' @import htmlwidgets
#' @export
rdeck <- function(script, data, deck_properties = make_deck_properties(), width = NULL, height = NULL, element_id = NULL, mapbox_properties = NULL, ...) {

  # forward options using x
  x = list(
    script = readr::read_file(script),
    data = data,
    deckGLProperties = deck_properties,
    mapboxGLProperties = mapbox_properties,
    # options = list(...),
    props = list(
      df = inherits(data, "data.frame"),
      mapboxAccessToken = Sys.getenv("MAPBOX_ACCESS_TOKEN")
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rdeck',
    x,
    width = width,
    height = height,
    package = 'rdeck',
    elementId = element_id
  )
}
