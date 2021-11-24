// функция автоматической прокрутки расписания
jQuery(function(){  
    scrolling_table = $("tbody")
    setInterval(() => { // включение анимации каждые 12 секунд
        table_height = scrolling_table.get(0).scrollHeight
        anim_speed = table_height * 10
        scrolling_table.animate({ scrollTop: table_height}, anim_speed) // создание анимации движения вниз
        scrolling_table.animate({ scrollTop: 0}, anim_speed)            // создание анимации движения вверх
    }, 12000);
})