// Multiple layers

/* # r2deck start
r2deck:
  data: !expr geojsonio::us_cities
  lng: -96.97
  lat: 32.86
  zoom: 9
# r2deck end */
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
