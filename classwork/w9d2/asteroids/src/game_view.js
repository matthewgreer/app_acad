const Game = require("./game.js")

function GameView (ctx) {
    this.game = new Game;
    this.ctx = ctx;
}

// GameView.prototype.start = function() {
//     ourGame = this.game;
//     ourCtx = this.ctx;
//     function moveAndDraw() {
//         ourGame.moveObjects();
//         ourGame.draw(ourCtx);
//     }
//     setInterval(moveAndDraw(), 1000);
// }

GameView.prototype.start = function () {
    ourGame = this.game;
    ourCtx = this.ctx;
    setInterval(function () {
        ourGame.moveObjects();
        ourGame.draw(ourCtx);
    }, 1000);
}



module.exports = GameView;