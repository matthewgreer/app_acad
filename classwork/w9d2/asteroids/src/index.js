const Game = require('./game.js');
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const GameView = require('./game_view.js');

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;

document.addEventListener('DOMContentLoaded', () => {
    const canvasEl = document.getElementById('game-canvas'); // need to grab element from DOM
    canvasEl.height = 500;
    canvasEl.width = 500;
    const ctx = canvasEl.getContext('2d'); // need to get ctx from canvasEl
    ctx.fillRect(0, 0, 500, 500)
    window.ctx = ctx;

    const gameView = new GameView(ctx);
    gameView.start();
});