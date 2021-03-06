import Bird from "./bird";
import Level from "./level";

export default class FlappyBird {
  constructor(canvas) {
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.registerEvents();
    this.restart();
  }

  play() {
    this.running = true;
    this.animate();
  }

  restart() {
    this.running = false;
    this.score = 0;
    this.bird = new Bird(this.dimensions);
    this.level = new Level(this.dimensions);
   
    this.animate();
  }

  registerEvents() {
    this.boundClickHandler = this.click.bind(this);
    this.ctx.canvas.addEventListener("mousedown", this.boundClickHandler);
  }

  click(e) {
    if (!this.running) {
      this.play();
    }
    this.bird.flap();
  }

  gameOver() {
    return (
      this.level.collidesWith(this.bird.birdHitbox()) || this.bird.offBoard(this.height)
    );
  }

  animate() {
    this.level.animate(this.ctx);
    this.bird.animate(this.ctx);

    if (this.gameOver()) {
      alert(this.score);
      this.restart();
    }

    this.level.passedPipe(this.bird.birdHitbox(), () => {
      this.score += 1;
      console.log(this.score);
    });

    this.drawScore();

    if (this.running) {
      requestAnimationFrame(this.animate.bind(this));
    }
  }

  drawScore() {
    const scoreboard = {x: (this.dimensions.width / 2) - 10, y: this.dimensions.height / 4}
    this.ctx.font = "bold 40pt sans-serif";
    this.ctx.fillStyle = "red";
    this.ctx.fillText(this.score, scoreboard.x, scoreboard.y);
    this.ctx.strokeStyle='black';
    this.ctx.lineWidth = 2;
    this.ctx.strokeText(this.score, scoreboard.x, scoreboard.y);
  }
}