jQuery(function(){
  time_array = ['09:00:00', '09:45:00', '09:55:00', '10:40:00', '10:']
  setInterval(() => {
    date = new Date()
    time = date.toLocaleTimeString()
    if (time >= _9_45 && time <= _9_55 )
    if (time <= _9_45 && time >= '09:00:00' ){
      $("#lesson_info").html("Первый урок")    
    }
  }, 2000);
})