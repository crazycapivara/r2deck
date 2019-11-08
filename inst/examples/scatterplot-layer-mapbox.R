library("rdeck")

# Use 'Sys.setenv(MAPBOX_ACCESS_TOKEN = "<your-token>")' to use maps from mapbox
rdeck(
  script = system.file("scripts/scatterplot-mapbox.js", package = "rdeck"),
  data = geojsonio::us_cities,
  mapbox_properties = list(
    center = c(-96.97, 32.86),
    zoom = 9,
    # style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
    style = "mapbox://styles/mapbox/light-v9"
  )
)
