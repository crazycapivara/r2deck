
<!-- README.md is generated from README.Rmd. Please edit that file -->
*rdeck* - An R Interface to deck.gl and Mapbox GL Visualizations
================================================================

The *rdeck* package makes it possible to visualize your R data in [deck.gl](https://deck.gl/) and [Mapbox GL](https://github.com/mapbox/mapbox-gl-js). It was inspired by the [r2d3](https://rstudio.github.io/r2d3/) package. In contrast to other existing packages, it is a low-level interface giving you a high degree of flexibility regarding the customization of your visualization.

Installation
------------

You can install the latest version of *rdeck* from [GiHub](https://github.com) with:

``` r
remotes::install_github("crazycapivara/rdeck")
```

Getting Started
---------------

To visualize your data you have to create a JavaScript file containing your visualization function called `_rdeckViz`. The JavaScript visualization function takes 3 parameters:

-   `map` - The map object on which the layers will be rendered, either of type `deck.DeckGL` or `mapboxgl.Map`. This object is automatically created.
-   `data` - The data that is passed from R to the vizualisation function.
-   `options` - Additional options that can passed from R to the vizualisation function.

Furthermore, the libraries/variables `deck` and `mapboxgl` are available through the global context.

The JavaScript file is then passed to the `rdeck` function in R together with the data and some other parameters styling the map object.

So let's take a look at a basic example.

First fetch some flight data:

``` r
data_url <- paste0(
  "https://raw.githubusercontent.com/plotly/datasets/master/",
  "2011_february_aa_flight_paths.csv"
)
flights <- data.table::fread(data_url)
head(flights)
#>    start_lat start_lon  end_lat    end_lon airline airport1 airport2 cnt
#> 1:  32.89595 -97.03720 35.04022 -106.60919      AA      DFW      ABQ 444
#> 2:  41.97960 -87.90446 30.19453  -97.66987      AA      ORD      AUS 166
#> 3:  32.89595 -97.03720 41.93887  -72.68323      AA      DFW      BDL 162
#> 4:  18.43942 -66.00183 41.93887  -72.68323      AA      SJU      BDL  56
#> 5:  32.89595 -97.03720 33.56294  -86.75355      AA      DFW      BHM 168
#> 6:  25.79325 -80.29056 36.12448  -86.67818      AA      MIA      BNA  56
```

Then create your visualization function to render an arc layer like this:

``` javascript
/* arc.js */
function _rdeckViz(map, data, options) {
  // Create an arc layer
  const arcLayer = new deck.ArcLayer({
    id: "arc-layer",
    data: data,
    getSourcePosition: data => [data.start_lon, data.start_lat],
    getTargetPosition: data => [data.end_lon, data.end_lat],
    getSourceColor: data => [64, 255, 0],
    getTargetColor: data => [0, 128, 200]
  });

  // Add the layer to the map
  map.setProps({
    layers: [ arcLayer ]
  });
}
```

Finally, send the data to your visualization function:

``` r
library(rdeck)

rdeck(
  script = "arc.js",
  data = flights,
  # viewport parameters that are passed to the deck/map object
  longitude = -87.6500523,
  latitude = 41.850033,
  zoom = 2,
  pitch = 45
)
```
