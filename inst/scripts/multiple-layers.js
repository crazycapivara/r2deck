/* Multiple layers */
function _r2deckViz(map, data, options) {
  console.log({ map: map, data: data, options: options });

  const scatterplotLayer = new ScatterplotLayer({
    data: data,
    getPosition: d => [d.long, d.lat],
    getRadius: 1000,
    getFillColor: [0, 0, 140],
    filled: true
  });

  const textLayer = new TextLayer({
    data: data,
    getPosition: d => [d.long, d.lat],
    getText: d => d.name,
    getSize: 25,
    getColor: [255, 150, 30]
  });

  map.setProps({
    layers: [ scatterplotLayer, textLayer ]
  });
}
