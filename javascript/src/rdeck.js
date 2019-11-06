export default function(widgetElement, width, height) {
  const widget = {};

  let deckGL = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);

    deckGL = makeDeck(widgetData.id, widgetData.deckGLProperties);
    const scriptElement = document.createElement("script");
    scriptElement.type = "text/javascript";
    scriptElement.text = widgetData.script;
    document.head.appendChild(scriptElement);
    if (widgetData.props.df) {
      widgetData.data = HTMLWidgets.dataframeToD3(widgetData.data);
    }

    deckScript(deckGL, widgetData.data);
  };

  widget.resize = function(width, height) {
  };

  return widget;
}

function makeDeck(elementId, props) {
  props.container = elementId;
  return new deck.DeckGL(props);
}
