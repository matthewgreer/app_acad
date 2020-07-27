// focus on: 
// learning a new library
// how to read documentation
// how to look for how to achieve certain behavior

// What is canvas?
// canvas is built into html
// allows us to make 2D animations in the browser using JS and canvas API (ex. flash games, newgrounds games)
// need a canvas element in html skeleton
// everything will be inside the canvas element

// because script is in head, need to wait for all DOM to load before grabbing the canvas element and manipulating it
document.addEventListener('DOMContentLoaded', () => {
    const canvasEl = document.getElementById('canvas'); // need to grab element from DOM
    canvasEl.height = 500;
    canvasEl.width = 500;
    const ctx = canvasEl.getContext('2d'); // need to get ctx from canvasEl
    
    // draw black rectangle that takes up entire canvasEl
    ctx.fillRect(0, 0, 500, 500);

    // draw red circle
    ctx.beginPath();
    ctx.arc(250, 250, 20, 0, 2*Math.PI);
    ctx.strokeStyle = 'red'; 
    ctx.stroke();
})

// At this point in course, if you have a question or stuck
// "can I solve this on my own?"
// google first!
// look at documentation, stackoverflow, lecture notes with pair
// explain what you have tried already if calling a TA over
// do not take this as discouragement to asking questions
// practice the skill of googling by self / independently figuring out