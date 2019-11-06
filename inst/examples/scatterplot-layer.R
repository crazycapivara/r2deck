library("rdeck")

rdeck(
  script = system.file("scripts/test.js", package = "rdeck"),
  data = geojsonio::us_cities,
  longitude = -96.97,
  latitude = 32.86,
  zoom = 9
)
