library(jsonlite)
library(rdeck)

# SFMTA origin/destination routes
data_url <- "https://raw.githubusercontent.com/uber/deck.gl/master/examples/layer-browser/data/sfmta.routes.json"
data <- fromJSON(data_url)

rdeck(
  script = "inst/scripts/arc-mapbox.js",
  data = data,
  mapbox_properties = list(
    center = c(-122.398, 37.788),
    zoom = 12,
    pitch = 60,
    style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
  )
)
