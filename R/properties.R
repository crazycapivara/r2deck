deck_properties <- function(
  map_style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
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
  )
}

#' Mapbox properties
#'
#' @param center The initial geographical center point of the map.
#' @param zoom The initial zoom level of the map
#' @param style The style definition of the map conforming to the Mapbox Style Specification.
#' @param ... Further options that are passed to the Map class.
#'
#' @export
mapbox_properties <- function(
  center = c(-122.45, 37.8),
  zoom = 6,
  style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
  ...
) {
  list(
    center = center,
    zoom = zoom,
    style = style,
    ...
  )
}
