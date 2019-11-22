// global._r2deckWidget = global._r2deckWidget || { };

const DEFAULT_FUNC_NAME = "_r2deckViz";

export default function(widgetElement, width, height) {
  const widget = { };

  let deckGL = null;

  widget.renderValue = function(widgetData) {
    widgetData.options = widgetData.options || { };
    console.log(widgetData);
    mapboxgl.accessToken = widgetData.deckGLProperties.mapboxApiAccessToken = widgetData.props.mapboxAccessToken || "no-token";

    const funcName = appendScript2Head(widgetData.script);
    console.log(funcName);
    if (widgetData.props.df) {
      widgetData.data = HTMLWidgets.dataframeToD3(widgetData.data);
    }

    deckGL = widgetData.webGLContext === "mapbox" ?
      makeMapboxMap(widgetElement.id, widgetData.deckGLProperties) :
      makeDeck(widgetElement.id, widgetData.deckGLProperties);
    const _render = global[funcName]; // global._r2deckViz;
    _render(deckGL, widgetData.data, widgetData.options);
  };

  widget.resize = function(width, height) {
  };

  return widget;
}

function appendScript2Head(script) {
  const funcName = makeRandomName() + DEFAULT_FUNC_NAME;
  script = script.replace(DEFAULT_FUNC_NAME, funcName);
  const scriptElement = document.createElement("script");
  scriptElement.type = "text/javascript";
  scriptElement.text = '"use strict";\n' + script;
  document.head.appendChild(scriptElement);
  return funcName;
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
