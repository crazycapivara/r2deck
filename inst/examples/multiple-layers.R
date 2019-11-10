library(r2deck)

r2deck(
  script = system.file("scripts/multiple-layers.js", package = "r2deck"),
  data = geojsonio::us_cities,
  lng = -96.97,
  lat = 32.86,
  zoom = 9
)
