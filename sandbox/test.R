library(sf)
library(r2deck)

data_url <- url <- "https://raw.githubusercontent.com/djouallah/interactivie_map/master/data.csv"
dataset <- data.table::fread(data_url)
dataset_sf <- st_as_sf(dataset, coords = c( "pile_lng","pile_lat"), crs = 4326)

r2deck(
  script = "sandbox/test.js",
  data = dataset_sf,
  lng = 5.2,
  lat = 35.5,
  zoom = 13,
  pitch = 45,
  options = list(radius = 10)
)
