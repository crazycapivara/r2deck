library(sf)
library(r2deck)

data_url <- "https://docs.mapbox.com/mapbox-gl-js/assets/significant-earthquakes-2015.geojson"

earthquakes <- st_read(data_url, quiet = TRUE)

r2mapbox(
  script = "inst/scripts/earthquakes-mapbox.js",
  data = geojsonsf::sf_geojson(earthquakes),
  options = list(months = month.name),
  longitude = 31.4606,
  latitude = 20.7927,
  zoom = 0.5
)
