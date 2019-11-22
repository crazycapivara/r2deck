// https://docs.mapbox.com/mapbox-gl-js/example/timeline-animation/

/**
 * r2mapbox:
 *  # data: !expr geojsonsf::sf_geojson(earthquakes)
 *  data: !expr >
 *    jsonlite::read_json(
 *      "https://docs.mapbox.com/mapbox-gl-js/assets/significant-earthquakes-2015.geojson"
 *    )
 *  lng: 31.4606
 *  lat: 20.7927
 *  zoom: 0.5
 *  options: !expr list(months = month.name)
 */
function _r2deckViz(map, data, options) {
  // Create a month property value based on time, could also be done on R side
  data.features.forEach(feature =>  {
    feature.properties.month = new Date(feature.properties.time).getMonth();
  });

  // Create a data source
  const earthquakes = { type: "geojson", data: data };

  // Create the layer definition
  const circleLayer = {
    'id': 'earthquake-circles',
    'type': 'circle',
    'source': earthquakes,
    'paint': {
      'circle-color': [
        'interpolate',
        ['linear'],
        ['get', 'mag'],
        6, '#FCA107',
        8, '#7F3121'
      ],
      'circle-opacity': 0.75,
      'circle-radius': [
        'interpolate',
        ['linear'],
        ['get', 'mag'],
        6, 20,
        8, 40
      ]
    }
  };

  function filterBy(month) {
    const filters = ['==', 'month', month];
    map.setFilter('earthquake-circles', filters);
    document.getElementById("month").innerText = options.months[month];
  }

  // Create the controls
  const tags = `
    <div id="menu" style="background: white; position: absolute; top: 10px; left: 10px; padding: 10px;">
      <label id ="month"></label><br>
      <input id="slider" type="range" min="0" max="11" step="1" value="0">
    </div>
  `;
  const fragement = document.createRange().createContextualFragment(tags);
  const mapElement = map.getContainer();
  mapElement.appendChild(fragement);
  const slider = document.getElementById("slider");
  slider.onchange = () => filterBy(parseInt(slider.value));

  // Add the layer to the map
  map.on("load", () => {
    map.addLayer(circleLayer);
    filterBy(parseInt(slider.value));
  });
}
