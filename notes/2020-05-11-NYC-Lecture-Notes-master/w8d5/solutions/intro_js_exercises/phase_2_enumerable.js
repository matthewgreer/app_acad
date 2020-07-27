const NUMS = [1, 2, 3, 4, 5];

// Array#myEach
Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    let el = this[i];
    callback(el);
  }
};


NUMS.myEach((num) => {
  console.log(`square of ${num} is ${num * num}`);
});

// Array#.myMap
Array.prototype.myMap = function (myMapCb) {
  const mappedArray = [];
  
  // this => NUMS => [1, 2, 3, 4, 5]
  // this inner callback function closes over the mappedArray
  this.myEach(element => mappedArray.push(myMapCb(element)) );

  return mappedArray;
};

// const NUMS = [1, 2, 3, 4, 5]; 
NUMS.myMap( function(num) {
  return num * num; 
} );

NUMS.myMap( num => num * num ) ;

// Array#myInject
Array.prototype.myReduce = function (func, initialValue) {

  let arr = this;

  if (initialValue === undefined) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let result = initialValue;

  arr.myEach(el => result = func(result, el));

  return result;
};

console.log(NUMS.myReduce( (total, item) => total + item ));
