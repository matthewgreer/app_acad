document.addEventListener("DOMContentLoaded", function(){
  const bullshit = document.getElementById("mycanvas");
  bullshit.width = 500;
  bullshit.height = 500;

  const ctx = bullshit.getContext("2d");
  
  const gradientSun = ctx.createRadialGradient(250, 150, 30, 250, 150, 90);
  gradientSun.addColorStop(0, "rgb(255, 218, 184)");
  gradientSun.addColorStop(.75, "rgb(255, 245, 168)");
  gradientSun.addColorStop(1, "rgb(255, 253, 184)");

  const gradientSky = ctx.createRadialGradient(250, 150, 130, 250, 150, 500);
  gradientSky.addColorStop(0, "rgb(143, 181, 235)");
  gradientSky.addColorStop(.5, "rgb(21, 21, 214)");
  gradientSky.addColorStop(1, "rgb(0, 0, 128)");
  
  ctx.fillStyle = gradientSky;
  ctx.fillRect(0, 0, 500, 500);
  
  ctx.beginPath();
  ctx.arc(250, 150, 100, 0, 2 * Math.PI);
  ctx.strokeStyle = "rgb(245, 222, 159)";
  ctx.lineWidth = 9;
  ctx.stroke();
  ctx.fillStyle = gradientSun;
  ctx.fill();
});

