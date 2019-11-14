// https://blog.mapbox.com/launching-custom-layers-with-uber-2a235841a125

/* # r2deck start
r2mapbox:
  data: https://raw.githubusercontent.com/uber/deck.gl/master/examples/layer-browser/data/sfmta.routes.json
  lng: -122.398
  lat: 37.788
  zoom: 12
  pitch: 60
  map_style: !expr get_carto_style("dark-matter")
# r2deck end */
function _r2deckViz(map, data, options) {
  const arcLayer = new MapboxLayer({
    id: "arc",
    type: ArcLayer,
    data: data,
    getSourcePosition: d => d.START,
    getTargetPosition: d => d.END,
    getSourceColor: [64, 255, 0],
    getTargetColor: [0, 128, 200]
  });

  map.on("load", () => {
    map.addLayer(arcLayer);
  });
}
