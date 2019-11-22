export default function(widgetElement, width, height) {
  const widget = { };

  let deckGL = null;

  widget.renderValue = function(widgetData) {
    widgetData.options = widgetData.options || { };
    console.log(widgetData);
    mapboxgl.accessToken = widgetData.deckGLProperties.mapboxApiAccessToken = widgetData.props.mapboxAccessToken || "no-token";

    const funcName = makeRandomName();
    console.log(funcName);
    appendScript2Head(widgetData.script);
    if (widgetData.props.df) {
      widgetData.data = HTMLWidgets.dataframeToD3(widgetData.data);
    }

    deckGL = widgetData.webGLContext === "mapbox" ?
      makeMapboxMap(widgetElement.id, widgetData.deckGLProperties) :
      makeDeck(widgetElement.id, widgetData.deckGLProperties);
    const _render = global._r2deckViz;
    _render(deckGL, widgetData.data, widgetData.options);
  };

  widget.resize = function(width, height) {
  };

  return widget;
}

function appendScript2Head(script) {
  const scriptElement = document.createElement("script");
  scriptElement.type = "text/javascript";
  scriptElement.text = script;
  document.head.appendChild(scriptElement);
}

function makeDeck(elementId, props) {
  props.container = elementId;
  return new deck.DeckGL(props);
}

function makeMapboxMap(elementId, props) {
  props.container = elementId;
  return new mapboxgl.Map(props);
}

function makeRandomName() {
  const letters = "abcdefghijklmnopqrstuvwxyz";
  return Array(8).fill()
    .map(i => letters.charAt(Math.floor(Math.random() * letters.length))).join("");
}
