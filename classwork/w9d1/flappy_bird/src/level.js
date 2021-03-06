const CONSTANTS = {
  PIPE_SPEED: 2,
  GAP_SIZE: 150,
  PIPE_THICKNESS: 40,
  MARGIN: 50,
  PIPE_DISTANCE: 220,
  PIPE_1_DELAY: 1
};

export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;

    const firstPipeDistance = 
      this.dimensions.width + 
      (CONSTANTS.PIPE_1_DELAY * 60 * CONSTANTS.PIPE_SPEED);

    this.pipes = [
      this.randomPipe(firstPipeDistance),
      this.randomPipe(firstPipeDistance + CONSTANTS.PIPE_DISTANCE),
      this.randomPipe(firstPipeDistance + (CONSTANTS.PIPE_DISTANCE * 2)),
    ];
  }

  randomPipe(x) {
    const possibleGapHeight = this.dimensions.height - (2 * CONSTANTS.MARGIN) - CONSTANTS.GAP_SIZE;
    const topOfGap = (Math.random() * possibleGapHeight) + CONSTANTS.MARGIN;
    const pipe = {
      topPipe: {
        left: x,
        right: CONSTANTS.PIPE_THICKNESS + x,
        top: 0,
        bottom: topOfGap
      },
      bottomPipe: {
        left: x,
        right: CONSTANTS.PIPE_THICKNESS + x,
        top: topOfGap + CONSTANTS.GAP_SIZE,
        bottom: this.dimensions.height
      },
      passed: false
    };
    return pipe
  }

  animate(ctx) {
    this.drawBackground(ctx);
    this.movePipes();
    this.drawPipes(ctx);
  }

  drawBackground(ctx) {
    // ctx.fillStyle = "skyblue";
    // ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
    const gradientSun = ctx.createRadialGradient(250, 150, 30, 250, 150, 90);
    gradientSun.addColorStop(0, "rgb(255, 218, 184)");
    gradientSun.addColorStop(.75, "rgb(255, 245, 168)");
    gradientSun.addColorStop(1, "rgb(255, 253, 184)");

    const gradientSky = ctx.createRadialGradient(250, 150, 130, 250, 150, 500);
    gradientSky.addColorStop(0, "rgb(143, 181, 235)");
    gradientSky.addColorStop(.5, "rgb(21, 21, 214)");
    gradientSky.addColorStop(1, "rgb(0, 0, 128)");

    ctx.fillStyle = gradientSky;
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);

    ctx.beginPath();
    ctx.arc(250, 150, 100, 0, 2 * Math.PI);
    ctx.strokeStyle = "rgb(245, 222, 159)";
    ctx.lineWidth = 9;
    ctx.stroke();
    ctx.fillStyle = gradientSun;
    ctx.fill();
  }

  passedPipe(bird, callback) {
    this.eachPipe((pipe) => {
      if (pipe.topPipe.right < bird.left) {
        if (!pipe.passed) {
          pipe.passed = true;
          callback();
        }
      }
    });
  }

  movePipes() {
    this.eachPipe(function(pipe) {
      pipe.topPipe.left -= CONSTANTS.PIPE_SPEED;
      pipe.topPipe.right -= CONSTANTS.PIPE_SPEED;
      pipe.bottomPipe.left -= CONSTANTS.PIPE_SPEED;
      pipe.bottomPipe.right -= CONSTANTS.PIPE_SPEED;
    });

    if (this.pipes[0].topPipe.right <= 0) {
      this.pipes.shift();
      const newX = this.pipes[1].topPipe.left + CONSTANTS.PIPE_DISTANCE;
      this.pipes.push(this.randomPipe(newX));
    }
  }

  drawPipes(ctx) {
    this.eachPipe(function(pipe) {
      ctx.fillStyle = "white";
      ctx.fillRect(
        pipe.topPipe.left,
        pipe.topPipe.top,
        CONSTANTS.PIPE_THICKNESS,
        pipe.topPipe.bottom - pipe.topPipe.top
      );
      ctx.fillRect(
        pipe.bottomPipe.left,
        pipe.bottomPipe.top,
        CONSTANTS.PIPE_THICKNESS,
        pipe.bottomPipe.bottom - pipe.bottomPipe.top
      );
    });
  }
  
  eachPipe(callback) {
    this.pipes.forEach(callback.bind(this));
  }

  collidesWith(bird) {
    const _overlap = (rect1, rect2) => {
      if (rect1.left > rect2.right || rect1.right < rect2.left) {
        return false;
      }
      if (rect1.top > rect2.bottom || rect1.bottom < rect2.top) {
        return false;
      }
      return true;
    };
    let collision = false;
    this.eachPipe((pipe) => {
      if ( _overlap(pipe.topPipe, bird) || _overlap(pipe.bottomPipe, bird)) {
        collision = true;
      }
    });
    return collision;
  }
}