document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  const ctx = canvas.getContext('2d');

  //rectangle
  ctx.fillStyle = 'red';
  ctx.fillRect(50, 150, 100, 100);

  //circle
  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 1;
  ctx.stroke();

  ctx.fillStyle = 'pink';
  ctx.fill();


  ctx.beginPath();
  ctx.moveTo(90, 90);
  ctx.quadraticCurveTo(40, 50, 200, 300);
  ctx.quadraticCurveTo(10, 0, 500, 100);
  ctx.quadraticCurveTo(25, 100, 500, 100);
  // ctx.quadraticCurveTo(50, 120, 30, 125);
  // ctx.quadraticCurveTo(60, 120, 65, 100);
  // ctx.quadraticCurveTo(125, 100, 125, 62.5);
  // ctx.quadraticCurveTo(125, 25, 75, 25);
  ctx.fillStyle = 'pink';
  ctx.stroke();
});
