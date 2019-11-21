function _r2deckViz(map, data, options) {
  console.log(data);

  const scatterplotLayer = new deck.ScatterplotLayer({
    id: "scatterplot-layer",
    data: data,
    getPosition: d => d.geometry,
    // getFillColor: d => [250, 140, 10],
    filled: true,
    getRadius: options.radius,
    getFillColor: [240, 140, 10],
    radiusMinPixels: 1,
  });

  map.setProps({
    layers: [ scatterplotLayer ]
  });
}
