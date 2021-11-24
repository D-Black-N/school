// асинхронная функция обновления расписаниния на странице
jQuery(function(){
  setInterval(function(){
    time = new Date()
    if (time.getMinutes() % 5 == 0){ // обновление данных каждые 5 минут
      // асинхронный запрос
      $.ajax({
        url: '/',    // URL запроса
        type: 'GET', // метод обращения к URL для получения данных 
        success: function(data){
          $("table").html($(data).find("div#table").html()) // генерация данных на странице
        }
      }) 
    }
  }, 1000);
})