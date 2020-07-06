function mysteryScoping1() {  // logs 'in block' twice
  var x = 'out of block';     // because variables declared with keyword var 
  if (true) {                 // can be redeclared or reassigned
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {  // logs 'in block' 'out of block'
  const x = 'out of block';   // because variable declared with keyword const
  if (true) {                 // may be redclared within a new block scope 
    const x = 'in block';     
    console.log(x);           
  }
  console.log(x);
}

function mysteryScoping3() {  // SyntaxError Identifier 'x' has already been declared
  const x = 'out of block';   // because const cannot be re-assigned, which, because
  if (true) {                 // var is function-scoped, line 22 attempts to do
    var x = 'in block';       
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {  // logs 'in block' 'out of block'
  let x = 'out of block';     // because variable declared with keyword let is 
  if (true) {                 // block scoped
    let x = 'in block';       
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {  // SyntaxError Identifier 'x' has already been declared
  let x = 'out of block';     // let can only be declared once but line 43 attempts
  if (true) {                 // to re-declare it
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

//===============================
//
//       madLib

function madLib (verb, adj, noun) {
  console.log(`We shall ${verb} the ${adj} ${noun}.`);
}

// madLib('make', 'best', 'guac');

//===============================
//
//       isSubstring


function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// isSubstring("time to program", "time");
// isSubstring("Jump for joy", "joys");

//===============================
//
//       fizzBuzz

function fizzBuzz(array) {
  let newArr = [];
  array.forEach(element => {
    if((element % 3 === 0 && element % 5 !== 0) || (element % 3 !== 0 && element % 5 === 0)) {
      newArr.push(element)
    }
  });
  return newArr
}

// fizzBuzz([2, 3, 4, 5, 6, 7, 15, 18, 22, 34])

//===============================
//
//       isPrime

function isPrime(number) {
  if (number < 2) {
    return false;
  }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}


// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));


//===============================
//
//       sumOfNPrimes



function sumOfNPrimes(n) {
  let sum = 0;
  let i = 2;
  let primesCount = 0;

  while(primesCount < n) {
    if (isPrime(i)) {
      sum += i;
      primesCount += 1;
    }
    i++;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));

