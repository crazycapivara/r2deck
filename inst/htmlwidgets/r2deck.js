!function(t){var e={};function n(o){if(e[o])return e[o].exports;var r=e[o]={i:o,l:!1,exports:{}};return t[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=t,n.c=e,n.d=function(t,e,o){n.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:o})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,e){if(1&e&&(t=n(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var r in t)n.d(o,r,function(e){return t[e]}.bind(null,r));return o},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="",n(n.s=1)}([function(t,e,n){"use strict";(function(t){const n="_r2deckViz";e.a=function(e,o,r){const c={};let i=null;return c.renderValue=function(o){o.options=o.options||{},console.log(o),mapboxgl.accessToken=o.deckGLProperties.mapboxApiAccessToken=o.props.mapboxAccessToken||"no-token";const r=function(t){const e=function(){const t="abcdefghijklmnopqrstuvwxyz";return Array(8).fill().map(e=>t.charAt(Math.floor(Math.random()*t.length))).join("")}()+n;t=t.replace(n,e);const o=document.createElement("script");return o.type="text/javascript",o.text='"use strict";\n'+t,document.head.appendChild(o),e}(o.script);console.log(r),o.props.df&&(o.data=HTMLWidgets.dataframeToD3(o.data)),i="mapbox"===o.webGLContext?function(t,e){return e.container=t,new mapboxgl.Map(e)}(e.id,o.deckGLProperties):function(t,e){return e.container=t,new deck.DeckGL(e)}(e.id,o.deckGLProperties),(0,t[r])(i,o.data,o.options)},c.resize=function(t,e){},c}}).call(this,n(2))},function(t,e,n){"use strict";n.r(e);var o=n(0);HTMLWidgets.widget({name:"r2deck",type:"output",factory:o.a})},function(t,e){var n;n=function(){return this}();try{n=n||Function("return this")()||(0,eval)("this")}catch(t){"object"==typeof window&&(n=window)}t.exports=n}]);