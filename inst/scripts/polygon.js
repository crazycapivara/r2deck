function _r2deckViz(deck, data, options) {
  const polygonLayer = new PolygonLayer({
    id: "nc",
    data: data,
    getPolygon: data => data.geometry,
    filled: true,
    getFillColor: data => [250, Math.sqrt(data.BIR74), 20, 200],
    lineWidthMinPixels: 1,
    getLineColor: [250, 80, 80],
    getLineWidth: 1
  });

  deck.setProps({
    layers: [ polygonLayer ]
  });
}
