class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    this.printTime();

    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    if (this.seconds === 60) {
      this.minutes++;
      this.seconds = 0;
    }
    if (this.minutes === 60) {
      this.hours++;
      this.minutes = 0;
    }
    if (this.hours === 24) {
      this.hours = 0;
    }
    this.seconds++;
    this.printTime();
  }
}

const clock = new Clock();