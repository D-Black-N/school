jQuery(function(){
  setInterval(function(){
    time = new Date()
    if (time.getMinutes() % 5 == 0){
      console.log(time)
      $.ajax({
        url: '/',
        type: 'GET',
        success: function(data){
          $("table").html($(data).find("div#table").html())
        }
      }) 
    }
  }, 1000);
})