library(rdeck)

data_url <- paste0(
  "https://raw.githubusercontent.com/plotly/datasets/master/",
  "2011_february_aa_flight_paths.csv"
)
flights <- data.table::fread(data_url)

r2deck(
  script = system.file("scripts/arc.js", package = "rdeck"),
  data = flights,
  # viewport parameters that are passed to the deck/map class
  lng = -87.6500523,
  lat = 41.850033,
  zoom = 3,
  pitch = 45
)
