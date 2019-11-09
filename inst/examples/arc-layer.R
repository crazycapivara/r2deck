library(rdeck)

data_url <- paste0(
  "https://raw.githubusercontent.com/plotly/datasets/master/",
  "2011_february_aa_flight_paths.csv"
)
flights <- data.table::fread(data_url)

# viewport parameters that are passed to the map object
deck_props <- make_deck_properties(
  longitude = -87.6500523,
  latitude = 41.850033,
  zoom = 3,
  pitch = 45,
  style = get_carto_style("dark-matter")
)

rdeck(
  script = system.file("scripts/arc.js", package = "rdeck"),
  data = flights,
  deck_properties = deck_props
)
