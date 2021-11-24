// функция анимации аналоговых часов
jQuery(function(){
    time = new Date()
    // начальное положение стрелок часов при входе на страницу сайта
    $("#hour").css({'transform' : 'rotate('+ (time.getHours()*30 + time.getMinutes()*0.5) +'deg)'}) // часовая стрелка
    $("#min").css({'transform' : 'rotate('+ time.getMinutes()*6 +'deg)'})   // минутная стрелка
    $("#sec").css({'transform' : 'rotate('+ time.getSeconds()*6 +'deg)'});  // секундная стрелка
    setInterval(() => { // анимация с интервалом в 1 секунду
        date = new Date()
        sec = date.getSeconds()
        $("#sec").css({'transform' : 'rotate('+ sec*6 +'deg)'}); // вращение секундной стрелки  
        if (sec == 0){
            min = date.getMinutes()
            hour = date.getHours()
            hour = (hour >= 12)? hour - 12: hour;   // преобразование в 12 часовой формат
            $("#min").css({'transform' : 'rotate('+ min*6 +'deg)'}) // вращение минутной стрелки
            $("#hour").css({'transform' : 'rotate('+ (hour*30 + min*0.5) +'deg)'}) // вращение часовой стрелки
        }
    }, 1000);            
})