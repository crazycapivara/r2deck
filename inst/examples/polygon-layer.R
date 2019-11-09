library(sf)
library(rdeck)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE) %>%
  st_cast("POLYGON") %>%
  st_transform(4326)

rdeck(
  script = system.file("scripts/polygon.js", package = "rdeck"),
  data = nc,
  deck_properties = make_deck_properties(
    longitude = -79.89018,
    latitude = 35.23597,
    zoom = 6
  )
)
