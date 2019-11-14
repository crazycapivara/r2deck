/* # r2deck start
r2mapbox:
  data: !expr geojsonsf::geo_melbourne
  lng: 144.9671
  lat: -37.81211
  zoom: 11
  pitch: 35
# r2deck end */
function _r2deckViz(map, data) {
  const source = {
    type: "geojson",
    data: data
  };

  const polygonLayer = {
    id: "melbourne-polygons",
    type: "fill",
    source: source,
    layout: { },
    paint: {
      "fill-color": ["get", "fillColor"],
      "fill-opacity": 0.6
    }
  };

  const lineLayer = {
    id: "melbourne-lines",
    type: "line",
    source: source,
    layout: { },
    paint: {
      "line-color": ["get", "strokeColor"],
      "line-width": 2
    }
  };

  map.on("load", () => {
    map.addLayer(polygonLayer);
    map.addLayer(lineLayer);
  });

  map.on("click", "melbourne-polygons", (e) => {
    new mapboxgl.Popup()
      .setLngLat(e.lngLat)
      .setHTML(e.features[0].properties.SA2_NAME)
      .addTo(map);
  });
}
