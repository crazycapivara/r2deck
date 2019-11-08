#' Create a widget object
#'
#' @param script The name of the JavaScript file containing the vizualisation function.
#' @param data The data passed to the vizualisation function.
#' @param options (optional) Additional options that are passed to the vizualisation function.
#' @param width (optional) The width of the widget.
#' @param height (optional) The height of the widget.
#' @param element_id (optional) The unique id of the widget.
#' @param mapbox_properties (optional) The Properties passed to the mapbox map object.
#'   Only needed if the layers should be drawn into the same WebGL context that the Mapbox map is rendered in.
#'   In this case you need to add your layers via \code{deck.MapboxLayer} to the \code{mapboxgl.Map} object.
#'   This is useful if you want to combine Deck and Mapbox layers with each other in a smooth way.
#' @param ... The properties (viewport settings, picking radius, ...) that are passed to the Deck class.
#'
#' @import htmlwidgets
#'
#' @export
rdeck <- function(script, data, options = NULL, width = NULL, height = NULL, element_id = NULL, mapbox_properties = NULL, ...) {

  # forward options using x
  x = list(
    script = readr::read_file(script),
    data = data,
    options = options,
    deckGLProperties = utils::modifyList(
      list(
        mapStyle = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
        longitude = -122.45,
        latitude = 37.8,
        zoom = 8
      ),
      list(...)
    ),
    mapboxGLProperties = mapbox_properties,
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

#' Shiny bindings for rdeck
#'
#' Output and render functions for using rdeck within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rdeck
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rdeck-shiny
#'
#' @export
rdeckOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'rdeck', width, height, package = 'rdeck')
}

#' @rdname rdeck-shiny
#' @export
renderRdeck <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rdeckOutput, env, quoted = TRUE)
}
