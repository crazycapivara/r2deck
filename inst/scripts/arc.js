function _rdeckViz(map, data, options) {
  const arcLayer = new deck.ArcLayer({
    id: "arc-layer",
    data: data,
    getSourcePosition: data => [data.start_lon, data.start_lat],
    getTargetPosition: data => [data.end_lon, data.end_lat],
    getSourceColor: data => [64, 255, 0],
    getTargetColor: data => [0, 128, 200]
  });

  map.setProps({
    layers: [ arcLayer ]
  });
}
