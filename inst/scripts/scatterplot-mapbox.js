/* Render a Deck.gl layer in the Mapbox WebGL context  */
function _r2deckViz(map, data, options) {
  const popup = new mapboxgl.Popup({
    closeButton: false
  });

  const scatterplotLayer = new MapboxLayer({
    id: "scatterplot",
    type: ScatterplotLayer,
    data: data,
    getPosition: d => [d.long, d.lat],
    getRadius: 1000,
    getFillColor: [0, 0, 140],
    filled: true,
    pickable: true,
    onHover: ({object, coordinate}) => {
      if (object) {
        console.log(object);
        popup.setLngLat([coordinate[0], coordinate[1]])
          .setHTML(object.name)
          .addTo(map);
      } else {
        popup.remove();
      }
    }
  });

  map.on("load", () => {
    map.addLayer(scatterplotLayer);
  });
}
