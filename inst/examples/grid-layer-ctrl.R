library(htmltools)
library(r2deck)

template <- tags$div(
  id = "menu",
  class = "mapboxgl-ctrl",
  style = css(
    "background-color" = "white",
    padding = "10px",
    position = "absolute",
    top = "10px",
    left = "10px"
    )
  ) %>%
  tagAppendChild(
    tagList(
      tags$label("cell size", id = "cell-size"),
      tags$input(
        id = "slider",
        type = "range",
        min = 100,
        max = 400,
        step = 25,
        value = 100
      )
    )
  ) %>% as.character()


r2deck(
  script = "inst/scripts/grid-layer-ctrl-options.js",
  data = "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json",
  zoom = 12,
  pitch = 45,
  map_style = get_carto_style("voyager"),
  options = list(template = template)
)
