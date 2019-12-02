/**
 * r2deck:
 *  data: https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json
 *  zoom: 12
 *  pitch: 45
 *  map_style: !expr get_carto_style("voyager")
 */
function r2deckViz(map, data) {
  const ctrl = document.getElementsByClassName("mapboxgl-ctrl-top-left")[0];
  const slider = document.createElement("input");
  Object.assign(slider, {
    className: "mapboxgl-ctrl",
    type: "range",
    min: 100,
    max: 400,
    step: 25,
    onchange: () => render(slider.value)
  });
  ctrl.appendChild(slider);

  function render(cellSize) {
    const gridLayer = new GridLayer({
      id: "grid-layer",
      data: data,
      extruded: true,
      cellSize: cellSize,
      elevationScale: 4,
      getPosition: data => data.COORDINATES
    });

    map.setProps({
      layers: [ gridLayer ]
    });
  }

  render(slider.value);
}
