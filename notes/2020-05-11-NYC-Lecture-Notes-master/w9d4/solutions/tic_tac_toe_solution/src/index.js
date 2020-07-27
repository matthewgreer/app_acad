const View = require('./ttt-view');
const Game = require('./game');

debugger;
$(() => {
  debugger;
  const rootEl = $('.ttt');
  const game = new Game();
  new View(game, rootEl);
});
