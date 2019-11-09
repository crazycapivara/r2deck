library("rdeck")

rdeck(
  script = system.file("scripts/multiple-layers.js", package = "rdeck"),
  data = geojsonio::us_cities,
  deck_properties = make_deck_properties(
    longitude = -96.97,
    latitude = 32.86,
    zoom = 9
    )
)
