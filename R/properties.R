#CARTO_BASEMAPS = list(
#  "dark-matter" = "darkmatter"
#)

#' Carto style
#'
#' @param theme The theme of the style, \code{dark-matter}, \code{positron} or \code{voyager}.
#'
#' @export
get_carto_style <- function(theme = "dark-matter") {
  if (!theme %in% c("dark-matter", "voyager", "positron")) {
    stop("Unknown theme.")
  }

  sprintf("https://basemaps.cartocdn.com/gl/%s-gl-style/style.json", theme)
}

#' Deck properties
#'
#' @param map_style The style definition of the map conforming to the Mapbox Style Specification.
#' @param longitude The longitude of the initial geographical center point of the map.
#' @param latitude The latitude of the initial geographical center point of the map.
#' @param zoom The initial zoom level of the map.
#' @param ... Further options that are passed to the Map class.
#'
#' @export
make_deck_properties <- function(
  map_style = get_carto_style("dark-matter"),
  longitude = -122.45,
  latitude = 37.8,
  zoom = 10,
  ...
) {
  list(
    mapStyle = map_style,
    longitude = longitude,
    latitude = latitude,
    zoom = zoom,
    ...
  ) %>% keys_to_camel_case()
}

#' Mapbox properties
#'
#' @param center The initial geographical center point of the map.
#' @param zoom The initial zoom level of the map.
#' @param style The style definition of the map conforming to the Mapbox Style Specification.
#' @param ... Further options that are passed to the Map class.
#'
#' @export
make_mapbox_properties <- function(
  style = get_carto_style("dark-matter"),
  center = c(-122.45, 37.8),
  zoom = 6,
  ...
) {
  list(
    center = center,
    zoom = zoom,
    style = style,
    ...
  ) %>% keys_to_camel_case()
}
