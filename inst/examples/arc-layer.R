data_url <- paste0(
  "https://raw.githubusercontent.com/plotly/datasets/master/",
  "2011_february_aa_flight_paths.csv"
)
flights <- data.table::fread(data_url)

rdeck(
  script = system.file("scripts/arc.js", package = "rdeck"),
  data = flights,
  # viewport parameters that are passed to the map object
  longitude = -87.6500523,
  latitude = 41.850033,
  zoom = 2,
  pitch = 45
)
