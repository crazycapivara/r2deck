"use strict";

// Pass template via options

/**
 * r2deck:
 *  data: https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json
 *  zoom: 12
 *  pitch: 45
 *  map_style: !expr get_carto_style("voyager")
 */
function _r2deckViz(map, data, options) {
  const DEFAULT_CELL_SIZE = 150;

  let slider;

  // Make it work even if no template is supplied
  if (options.template) {
    const ctrl = document.getElementsByClassName("mapboxgl-ctrl-top-left")[0];
    const template = document.createElement("template");
    template.innerHTML = options.template;
    ctrl.appendChild(template.content);
    slider = document.getElementById("slider");
    slider.onchange = () => render(slider.value);
  }

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

    try {
      document.getElementById("cell-size").innerText = `cell size: ${cellSize}`;
    } catch(e) { }

  }

  render(typeof slider === "undefined" ? DEFAULT_CELL_SIZE : slider.value);
}
