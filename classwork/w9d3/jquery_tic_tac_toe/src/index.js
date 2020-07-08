const View = require('./ttt-view.js')
const Game = require('../../solution/game.js')

$(() => {
  const $el = $('.ttt')
  let newgame = new Game();
  let newview = new View(newgame, $el);

});
