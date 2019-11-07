#' Create a widget object
#'
#' @param script JavaScript file conatining the vizualisation function
#' @param data data passed to the vizualisation function in the JavaScript file
#' @param width width of the widget
#' @param height height of the widget
#' @param element_id unique id of the widget
#' @param mapbox_properties ...
#' @param ... ...
#'
#' @import htmlwidgets
#'
#' @export
rdeck <- function(script, data, width = NULL, height = NULL, element_id = NULL, mapbox_properties = NULL, ...) {

  # forward options using x
  x = list(
    script = readr::read_file(script),
    data = data,
    deckGLProperties = utils::modifyList(
      list(
        mapboxAccessToken = "",
        mapStyle = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
        longitude = -122.45,
        latitude = 37.8,
        zoom = 8
      ),
      list(...)
    ),
    mapboxGLProperties = mapbox_properties,
    props = list(
      df = inherits(data, "data.frame")
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
