/* Render a Deck.gl layer in the Mapbox WebGL context  */
function _r2deckViz(map, data, options) {
  const scatterplotLayer = new MapboxLayer({
    id: "scatterplot",
    type: ScatterplotLayer,
    data: data,
    getPosition: d => [d.long, d.lat],
    getRadius: 1000,
    getFillColor: [0, 0, 140],
    filled: true
  });

  map.on("load", () => {
    map.addLayer(scatterplotLayer);
  });
}
