function deckScript(map, data) {
  console.log("map:", map, "data:", data);

  const scatterplot = new ScatterplotLayer({
    data: data,
    getPosition: d => [d.long, d.lat],
    getRadius: 1000,
    getFillColor: [250, 140, 10],
    filled: true
  });

  map.setProps({ layers: [ scatterplot ] });
}
