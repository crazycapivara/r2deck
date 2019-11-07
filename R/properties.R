deck_properties <- function(
  mapbox_access_token = Sys.getenv("MAPBOX_ACCESS_TOKEN"),
  map_style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
  longitude = -122.45,
  latitude = 37.8,
  zoom = 10
) {
  list(
    mapboxAccessToken = mapbox_access_token,
    mapStyle = map_style,
    longitude = longitude,
    latitude = latitude,
    zoom = zoom
  )
}

#' @export
mapbox_properties <- function(
  center = c(0, 0),
  zoom = 6,
  style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
  ) {
  list(
    center = center,
    zoom = zoom,
    style = style
  )
}
