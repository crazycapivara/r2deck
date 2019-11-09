library(jsonlite)
library(rdeck)

# SFMTA origin/destination routes
data_url <- "https://raw.githubusercontent.com/uber/deck.gl/master/examples/layer-browser/data/sfmta.routes.json"
data <- fromJSON(data_url)

rdeck(
  script = system.file("scripts/arc-mapbox.js", package = "rdeck"),
  data = data,
  mapbox_properties = make_mapbox_properties(
    center = c(-122.398, 37.788),
    zoom = 12,
    pitch = 60,
    style = get_carto_style("dark-matter")
  )
)
