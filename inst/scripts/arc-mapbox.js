/* https://blog.mapbox.com/launching-custom-layers-with-uber-2a235841a125 */
function _rdeckViz(map, data, options) {
  const arcLayer = new MapboxLayer({
    id: "arc",
    type: ArcLayer,
    data: data,
    getSourcePosition: d => d.START,
    getTargetPosition: d => d.END,
    getSourceColor: d => [64, 255, 0],
    getTargetColor: d => [0, 128, 200]
  });

  map.on("load", () => {
    map.addLayer(arcLayer);
  });
}
