// https://deck.gl/#/documentation/deckgl-api-reference/layers/h3-hexagon-layer

/**
 * r2deck:
 *  data: https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf.h3cells.json
 *  zoom: 10
 *  pitch: 35
 *  # Add h3 HTML dependency
 *  deps: !expr use_h3()
 */
function r2deckViz(map, data) {
  const h3HexagonLayer = new deck.H3HexagonLayer({
    id: 'h3-hexagon-layer',
    data: data,
    pickable: true,
    wireframe: false,
    filled: true,
    extruded: true,
    elevationScale: 20,
    getHexagon: d => d.hex,
    getFillColor: d => [255, (1 - d.count / 500) * 255, 0],
    getElevation: d => d.count
  });

  map.setProps({
    layers: [ h3HexagonLayer ]
  });
}
