const CONSTANTS = {
  GRAVITY: 0.5,
  FLAP_SPEED: 8,
  TERMINAL_VEL: 12,
  BIRD_WIDTH: 40,
  BIRD_HEIGHT: 30,
};

export default class Bird {

  constructor(dimensions) {
    this.dimensions = dimensions;
    this.x = this.dimensions.width / 3;
    this.y = this.dimensions.height /2;
    this.vel = 0;
  }

  flap() {
    this.vel = -1 * CONSTANTS.FLAP_SPEED;
  }

  moveBird() {
    this.y += this.vel;
    this.vel += CONSTANTS.GRAVITY;
    // terminal velocity
    if (Math.abs(this.vel) > CONSTANTS.TERMINAL_VEL) {
      if (this.vel > 0) {
        this.vel = CONSTANTS.TERMINAL_VEL;
      } else {
        this.vel = CONSTANTS.TERMINAL_VEL * -1;
      }
    }
  }

  animate(ctx) {
    this.moveBird();
    this.drawBird(ctx);
  }

  drawBird(ctx) {
    ctx.fillStyle = 'orange';
    ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }

  birdHitbox() {
    return {
      left: this.x,
      right: this.x + CONSTANTS.BIRD_WIDTH,
      top: this.y,
      bottom: this.y + CONSTANTS.BIRD_HEIGHT
    };
  }

  offBoard() {
    const pastTop = this.y < 0;
    const pastBottom = this.y + CONSTANTS.BIRD_HEIGHT > this.dimensions.height;
    return pastTop || pastBottom;
  }
}