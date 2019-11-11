function _r2deckViz(map, data, options) {
  const polygonLayer = new PolygonLayer({
    id: "nc",
    data: data,
    getPolygon: data => data.geometry,
    filled: true,
    getFillColor: data => [250, Math.sqrt(data.BIR74), 20, 200],
    lineWidthMinPixels: 1,
    getLineColor: [250, 80, 80],
    getLineWidth: 1,
    pickable: true,
    onHover: ({object, x, y}) => {
      console.log(object);
      const tooltip = document.getElementsByClassName("deck-tooltip")[0];
      if (object) {
        tooltip.style.display = "block";
        tooltip.style.top = y + "px";
        tooltip.style.left = x + "px";
        tooltip.innerText = object.NAME;
      } else {
        tooltip.style.display = "none";
      }
    }
  });

  map.setProps({
    layers: [ polygonLayer ]
  });
}
