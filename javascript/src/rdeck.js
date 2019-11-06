export default function(widgetElement, width, height) {
  const widget = {};

  let deckGL = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    widgetElement.innerHTML = widgetData.message;
  };

  widget.resize = function(width, height) {
  };

  return widget;
}
