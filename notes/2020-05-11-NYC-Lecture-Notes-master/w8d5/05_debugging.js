Array.prototype.healthyMap = function (callback) {
  const arr = [];
  this.forEach((el) => {
    arr.push(callback(el));
  });
  return arr;
};

const newArr = [1, 2, 3].healthyMap((el) => {
  return el * 2;
});

console.log(newArr); // should log [2,4,6]
