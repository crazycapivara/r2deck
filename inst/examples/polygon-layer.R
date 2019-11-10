library(sf)
library(rdeck)

nc <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE) %>%
  st_cast("POLYGON") %>%
  st_transform(4326)

r2deck(
  script = system.file("scripts/polygon.js", package = "rdeck"),
  data = nc,
  lng = -79.89018,
  lat = 35.23597,
  zoom = 6
)
