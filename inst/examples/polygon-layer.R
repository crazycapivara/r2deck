library(sf)
library(rdeck)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE) %>%
  st_cast("POLYGON") %>%
  st_transform(4326)

rdeck(
  script = "inst/scripts/polygon.js",
  data = nc,
  longitude = -79.89018,
  latitude = 35.23597,
  zoom = 6
)
