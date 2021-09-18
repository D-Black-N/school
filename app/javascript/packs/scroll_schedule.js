jQuery(function(){  
    scrolling_table = $("tbody")
    setInterval(() => {
        table_height = scrolling_table.get(0).scrollHeight
        anim_speed = table_height * 10
        scrolling_table.animate({ scrollTop: table_height}, anim_speed)
        scrolling_table.animate({ scrollTop: 0}, anim_speed)            
    }, 12000);
})