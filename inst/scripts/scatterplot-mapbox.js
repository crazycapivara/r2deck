/* Add a deck.gl-layer to the mapbox context  */
function deckScript(map, data) {
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
