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
