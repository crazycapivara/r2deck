
<!-- README.md is generated from README.Rmd. Please edit that file -->
*r2deck* - An R Interface to deck.gl and Mapbox GL Visualizations
=================================================================

[![Travis build status](https://travis-ci.org/crazycapivara/r2deck.svg?branch=master)](https://travis-ci.org/crazycapivara/r2deck) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) [![CRAN status](https://www.r-pkg.org/badges/version/r2deck)](https://cran.r-project.org/package=r2deck)

The *r2deck* package makes it possible to visualize your R data in [deck.gl](https://deck.gl/) and [Mapbox GL](https://github.com/mapbox/mapbox-gl-js). It was inspired by the [r2d3](https://rstudio.github.io/r2d3/) package. In contrast to other existing packages, it is a low-level interface giving you a high degree of flexibility regarding the customization of your visualization.

Installation
------------

You can install the latest version of *r2deck* from [GiHub](https://github.com) with:

``` r
remotes::install_github("crazycapivara/r2deck")
```

Getting Started
---------------

To visualize your data you have to create a JavaScript file containing your visualization function called `_r2deckViz`. The JavaScript visualization function takes 3 parameters:

-   `map` - The map object on which the layers will be rendered, either of type `deck.DeckGL` or `mapboxgl.Map`. This object is automatically created.
-   `data` - The data that is passed from R to the vizualisation function.
-   `options` - Additional options that can be passed from R to the vizualisation function.

Furthermore, the libraries/variables `deck` and `mapboxgl` are available through the global context.

The JavaScript file is then passed to the `r2deck` or `r2mapbox` function in R together with the data and some other parameters styling the map object.

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
function _r2deckViz(map, data, options) {
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
library(r2deck)

r2deck(
  script = "arc.js",
  data = flights,
  # viewport parameters that are passed to the deck/map object
  lng = -87.6500523,
  lat = 41.850033,
  zoom = 2,
  pitch = 45
)
```

For further examples take a look at the [example scripts](inst/examples) of the package.

Mapbox Access Token
-------------------

In order to use mapbox styles you need to put your access token in an environment variable called `MAPBOX_ACCESS_TOKEN`. If not set globally, you can run:

``` r
Sys.setenv(MAPBOX_ACCESS_TOKEN = "your-token")
```

*sf* data objects
-----------------

It is straight forward to pass [sf](https://github.com/r-spatial/sf) data objects to your visualization function. Just tell the data accessor to get the geometries from the *geometry* column:

``` javascript
const polygonLayer = new PolygonLayer({
  id: "nc",
  data: data,
  getPolygon: data => data.geometry,
  ...
}
```

See also the [polygon layer example](inst/examples/polygon-layer.R).

Documentation
-------------

The documentation is still work in progress as this package is in an early state.

As a good starting point check the [deck.gl api documentation](https://deck.gl/#/documentation/deckgl-api-reference/) where you have a lot of examples on how your JavaScript visualization function should look like.

Basically you just need to define one or more layers using your data object that is passed via `r2deck` to your function and then add it to the map:

``` javascript
function _r2deckViz(map, data, options) {
  const gridLayer = new deck.GridLayer({
    id: "grid-layer",
    data: data,
    ...
  });
  
  map.setProps({
    layers: [ gridLayer ]
  });
}

// Columns from your data are accessed like this:
data.column_name

// If you have the columns 'lat' and 'lng' in your data.frame
// a data accessor would be:
getPosition: data => [data.lng, data.lat]
```
