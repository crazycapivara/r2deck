library(jsonlite)
library(r2deck)

data_url <- "https://raw.githubusercontent.com/uber/deck.gl/master/examples/layer-browser/data/sfmta.routes.json"
sfmta_routes <- fromJSON(data_url)

r2mapbox(
  script = system.file("scripts/arc-mapbox.js", package = "r2deck"),
  data = sfmta_routes,
  lng = -122.398,
  lat = 37.788,
  zoom = 12,
  pitch = 60,
  map_style = get_carto_style("dark-matter")
)
