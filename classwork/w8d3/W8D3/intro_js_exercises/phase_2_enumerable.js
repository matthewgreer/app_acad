Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

arr = [1,2,2,4,5,1]

arr.myEach(function (element) {return element * 2})
arr.myEach(function (element) {mult2(element)})

function mult2(n) {
    console.log(n * 2);
}

let a = ['a', 'b', 'c']
a.forEach(function (element) { console.log(element) })
// logs each item in turn

// const array1 = ['a', 'b', 'c'];

// array1.forEach(element => console.log(element));


Array.prototype.myMap = function(callback) {
    let mapped = []

    this.myEach(function(ele) {
        mapped.push(callback(ele))
    })
    return mapped
}


Array.prototype.myReduce = function(callback, initial) {
    let arr = this;

    if (initial === undefined) {
        initial = this[0];
        arr = this.slice(1);
        debugger
    }
        

    arr.myEach(function(ele) {
        initial = callback(initial,ele);
    })
    debugger
    return initial;
}

// this = [2,1,4,5]