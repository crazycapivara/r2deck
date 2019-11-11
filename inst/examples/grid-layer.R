library(r2deck)

data_url <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"

sf_bike_parking <- jsonlite::read_json(data_url, simplifyVector = TRUE) %>%
  tibble::as.tibble()

r2deck(script = "inst/scripts/grid-layer.js", data = sf_bike_parking, zoom = 11, pitch = 45)
