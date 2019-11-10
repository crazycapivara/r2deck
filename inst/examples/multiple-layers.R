library("rdeck")

r2deck(
  script = system.file("scripts/multiple-layers.js", package = "rdeck"),
  data = geojsonio::us_cities,
  longitude = -96.97,
  latitude = 32.86,
  zoom = 9
)
