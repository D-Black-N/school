// функция отображения цифровых часов и даты
jQuery(function(){
    month_array = ["Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", 
                    "Июля", "Августа", "Сентября", "Октября", "Ноября", "Декабря"]
    wday = ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    var date = new Date()
    string_date = String(date.getDate()) + " "
                + month_array[date.getMonth()]  + " "
                + String(date.getFullYear())
                + ", " + wday[date.getDay()]    // создание строки даты
    $("#date").html(string_date)
    setInterval(() => { // обновление времени с интервалом 1 секунда
        var now = new Date();
        $("#digital-clock").html(now.toLocaleTimeString()) // изменение данных в html
    }, 1000);        
    // 
})
