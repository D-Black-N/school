jQuery(function(){
  counter = 0
  setInterval(() => {
    console.log($("body").scrollTop)
    $("body").scrollTop = $("body").scrollTop + 10
    $("body").scrollTop($("body").scrollTop)    
  }, 1000);
})