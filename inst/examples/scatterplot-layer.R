library("rdeck")

rdeck(
  script = system.file("scripts/test.js", package = "rdeck"),
  data = geojsonio::us_cities,
  longitude = -99.74,
  latitude = 32.45,
  zoom = 7
)
