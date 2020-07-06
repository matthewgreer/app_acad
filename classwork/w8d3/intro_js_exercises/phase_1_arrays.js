Array.prototype.uniq = function () {
    let uniqs = [];
    this.forEach(ele => {
        if(!uniqs.includes(ele)) {
            uniqs.push(ele)
        }
    })
    return uniqs
}

Array.prototype.twoSum = function() {
    let pairs = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i+1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                pairs.push([i,j])
            }
        }
    }
    return pairs;
}

Array.prototype.transpose = function() {
    let transposed = [];
    debugger
    for (let i = 0; i < this.length; i++) {
        let subRow = [];
        for (let j = 0; j < this[i].length; j++) {
            subRow.push(this[j][i])
        }
      transposed.push(subRow);
    }
    return transposed
}

// [ [2,1] [3,4] ] ==> [ [2,3], [1,4] ]