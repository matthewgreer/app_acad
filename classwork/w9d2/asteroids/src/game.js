const Asteroid = require("./asteroid");


const CONSTANTS = {
    DIM_X: 500,
    DIM_Y: 500,
    NUM_ASTEROIDS: 5
};

function Game() {
    this.asteroids = [];

    this.addAsteroids();
};


Game.prototype.addAsteroids = function addAsteroids() {
    for (let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++) {
        this.asteroids.push(new Asteroid({pos: this.randomPosition()}));
    }

};

Game.prototype.randomPosition = function() {    
    const randomPos = [];
    const randomX = Math.floor(Math.random() * CONSTANTS.DIM_X);
    const randomY = Math.floor(Math.random() * CONSTANTS.DIM_Y);

    
    randomPos.push(randomX, randomY);
    return randomPos
};

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, 500, 500);


    this.asteroids.forEach ((asteroid) => {
        asteroid.draw(ctx);
    });
};

Game.prototype.moveObjects = function() {
    this.asteroids.forEach((asteroid) => {
        asteroid.move();
    });
};


module.exports = Game;