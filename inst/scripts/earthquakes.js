/**
 * r2deck:
 *  data: !expr >
 *    sf::st_read("https://docs.mapbox.com/mapbox-gl-js/assets/significant-earthquakes-2015.geojson")
 *  lng: 31.4606
 *  lat: 20.7927
 *  zoom: 0.5
 */
function _r2deckViz(map, data) {
  data.forEach(feature =>  {
    feature.month = new Date(feature.time).getMonth();
  });
  console.log(data);

  function render(month) {
    const scatterplotLayer = new deck.ScatterplotLayer({
      id: "scatterplot",
      data: data.filter(feature => feature.month === month),
      getPosition: d => d.geometry,
      getRadius: d => 10000 * Math.pow(d.mag, 2),
      getFillColor: d => [Math.pow(d.mag, 3), 140, 10, 160],
      radiusMinPixels: 1,
      radiusMaxPixels: 100,
      radiusScale: 1,
      filled: true
    });

    map.setProps( { layers: [ scatterplotLayer ] } );
  }

  render(0);

  const tags = `
    <div id="menu" style="background: white; position: absolute; top: 10px; left: 10px; padding: 10px;">
      <input id="slider" type="range" min="0" max="11" step="1" value="0">
    </div>
  `;
  const template = document.createElement("template");
  template.innerHTML = tags;
  const mapElement = document.getElementById(map.props.container);
  mapElement.appendChild(template.content);
  const slider = document.getElementById("slider");
  slider.onchange = () => render(parseInt(slider.value));
}
