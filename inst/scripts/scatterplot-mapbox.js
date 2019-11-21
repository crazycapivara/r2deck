// Render a deck.gl layer in the Mapbox WebGL context

/**
 * r2mapbox:
 *  data: !expr geojsonio::us_cities
 *  lng: -96.97
 *  lat: 32.86
 *  zoom: 4
 *  map_style: !expr get_carto_style("voyager")
 *  # map_style: mapbox://styles/mapbox/light-v9
 */
function _r2deckViz(map, data, options) {
  const popup = new mapboxgl.Popup({
    closeButton: false
  });

  const scatterplotLayer = new deck.MapboxLayer({
    id: "scatterplot",
    type: deck.ScatterplotLayer,
    data: data,
    getPosition: d => [d.long, d.lat],
    radiusMinPixels: 1,
    radiusScale: 6,
    getRadius: 1000,
    getFillColor: d => d.capital === 2 ? [0, 0, 140] : [230, 130, 20],
    filled: true,
    pickable: true,
    onHover: ({object, lngLat}) => {
      if (object) {
        // console.log(object);
        popup.setLngLat(lngLat)
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
