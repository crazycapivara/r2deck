library(r2deck)

# Use 'Sys.setenv(MAPBOX_ACCESS_TOKEN = "<your-token>")' to use maps from mapbox
r2mapbox(
  script = system.file("scripts/scatterplot-mapbox.js", package = "r2deck"),
  data = geojsonio::us_cities,
  lng = -96.97,
  lat = 32.86,
  zoom = 9,
  style = get_carto_style("voyager")
  # style = "mapbox://styles/mapbox/light-v9"
)
