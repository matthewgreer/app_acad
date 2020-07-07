const MovingObject = require("./moving_object");
const Util = require("./utils");

const CONSTANTS = {
    COLOR: "red",
    RADIUS: 20
};

function Asteroid(options) {
    // { pos, Util.randomVec(4), CONSTANTS.COLOR, CONSTANTS.RADIUS }
    options.vel = Util.randomVec(4);
    options.radius = CONSTANTS.RADIUS;
    options.color = CONSTANTS.COLOR;

    MovingObject.call(this, options);

};

Util.inherits(Asteroid, MovingObject);



module.exports = Asteroid;