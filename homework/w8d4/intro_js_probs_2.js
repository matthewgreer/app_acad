titleize = function(names, callback) {
  const namesWithTitles = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  return callback(namesWithTitles);
}

printCallback = function(namesArray) {
  namesArray.forEach(element => {
    console.log(element);
  });
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes "phrRRRRRRRRRRR!!!!!!!!!`);
}

Elephant.prototype.grow = function() {
  this.height = (this.height + 12);
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  let max = (this.tricks.length - 1);
  let trick = this.tricks[random(0, max)];
  console.log(`${this.name} is ${trick}`);
}

function random(min, max) {
  const num = Math.floor(Math.random() * (max - min + 1)) + min;
  return num;
}

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trundling by!`);
}