jQuery(function(){
  let x0 = $("#canvas").width() / 2
  let y0 = $("#canvas").height() / 2
  let canvas = $("#canvas")
  console.log(canvas, canvas.nodeName)
  let ctx = canvas.getContext("2d")
  setInterval(() => {
    var now = new Date()
    var angle = now.getSeconds() * 6 
    console.log(angle)
    $("#sec").css('transform', 'rotate(' + angle + 'deg)')

    // var x = x0 + x0 * Math.sin(rad)
    // var y = y0/2 - y0 * Math.cos(rad)/2
    // ctx.beginPath()
    // ctx.moveTo(x0, y0/2)
    // ctx.lineTo(x, y)
    // ctx.strokeStyle = '#000000'
    // ctx.stroke()
  }, 1000);
})