jQuery(function(){
    month_array = ["Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", 
                    "Июля", "Августа", "Сентября", "Октября", "Ноября", "Декабря"]
    wday = ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    var date = new Date()
    string_date = String(date.getDate()) + " "
                + month_array[date.getMonth()]  + " "
                + String(date.getFullYear())
                + ", " + wday[date.getDay()]
    $("#date").html(string_date)
    setInterval(() => {
        var now = new Date();
        $("#digital-clock").html(now.toLocaleTimeString())
    }, 1000);        
    // 
})
