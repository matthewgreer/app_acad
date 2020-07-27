/* const */

// 1. can be declared and assigned ONLY once
//      aka it must be initialized at time of declaration
// 2. it is block scoped (scope?)

/* let */

// 1. can be declared and re assigned
// 2. it is block scoped (scope?)

/* var */

// Scope: "The scope of a variable is the region of a program where it can be accessed."

// each scope gets access to the variables defined within the same scope along with the variables defined inside the scope
function scopeExample() {
  // SCOPE A; variables: x
  const x = "x";

  // the code block is denoted by { and }
  // this is what the "block" in "block scoped" refers to
  if (true) {
    // SCOPE B; variables: x, y
    const y = "y";

    // You can also make a code block by just inserting { and }
    {
      // SCOPE C; variables: x, y, and z
      const z = "z";
    }
  }
}

// In JavaScript, "each variable is accessible in it's direct scope and all scopes nested within that scope"














/* const */

// 1. can be declared and assigned ONLY once
//      (reasignment prohibited, mutations allowed)
//      (it must be initialized at time of declaration)
// 2. it is block scoped (scope?)
// 3. use const when possible

// What will happen here?
function howToConst() {
  const username = 'Leo';

  if (true) { 
    const username = 'Url'; // can declare again because diff block scope
    // username variable in this scope is 'Url', lose access to outer block `username`
    console.log(username); // logs 'Url'
  }

  console.log(username); // exited inner block, logs "Leo"
}



















// What about here?
function howToConst2() {
  const username = 'Leo';

  if (true) { // this scope has access to variables declared in the same scope its defined
    console.log(username); // refers to 'Leo'
  }

  console.log(username); // refers to 'Leo'
}











// What about here?
function howToConst3() {
  if (true) { // true is always true so runs no matter what
    const username = 'Leo'; // declared in inner scope
    console.log(username); // has access to username
  }

  console.log(username); // no declaration of `username` in this block scope, throws ReferenceError because not declared
}











/* let */
// 1. Can be declared only once, but reassignment is allowed
  // let name = "andy";
  // name = "rich";
// 2. Block scoped

// What will happen here?
function howToLet() {
  let secret = "I'm secretly a cat.";

  if (true) {
    secret = "I'm secretly a banana"; // has access to `secret`, reassign that variable
    console.log(secret); 
  }

  console.log(secret); // b/c reassignment occurred, `secret` is "I'm secretly a banana"
}













// What about here?
function howToLet2() {
  let secret = "I'm secretly a cat.";

  if (true) {
    // debugger
    secret = "I'm secretly a banana"; // already has access to a let variable called `secret` so reassignment
    // temporal deadzone, trying to access `secret` before declaration but it throws ReferenceError. Because of hoisting, `secret` refers to own block scoped `secret` below regardless of it its declared lower in the code. 
    console.log(secret); 
    
    let secret = "Nope, definitely a cat.";
  }

  console.log(secret);
}




























/* var */
// 1. Function-scoped
// 2. AVOID USING THIS, use let and const
// 3. can be redeclared

// What happens here?
function howToVar() {
  var username = 'Leo'; // declaring `username` for this function

  if (true) {
    var username = 'Url'; // redeclaring same `username` variable, because it is function-scope

    console.log(username); // logs 'Url'
  }

  console.log(username); // logs 'Url' b/c redeclaration
}















// What about here?
function howToVar2() {
  console.log(username);
  
  if (true) {
    var username = 'Url';

    console.log(username);
  }

  console.log(username);
}


