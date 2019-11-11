function _r2deckViz(map, data) {
  function render(cellSize) {
    const gridLayer = new GridLayer({
      id: "grid-layer",
      data: data,
      extruded: true,
      cellSize: cellSize || 200,
      elevationScale: 4,
      getPosition: data => data.COORDINATES
    });

    map.setProps({
      layers: [ gridLayer ]
    });
  }

  render(200);
}
