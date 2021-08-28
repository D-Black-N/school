jQuery(function(){
    time = new Date()
    $("#hour").css({'transform' : 'rotate('+ (time.getHours()*30 + time.getMinutes()*0.5) +'deg)'})
    $("#min").css({'transform' : 'rotate('+ time.getMinutes()*6 +'deg)'})
    $("#sec").css({'transform' : 'rotate('+ time.getSeconds()*6 +'deg)'});        
    setInterval(() => {
        date = new Date()
        sec = date.getSeconds()
        $("#sec").css({'transform' : 'rotate('+ sec*6 +'deg)'});  
        if (sec == 0){
            min = date.getMinutes()
            hour = date.getHours()
            hour = (hour >= 12)? hour - 12: hour;
            $("#min").css({'transform' : 'rotate('+ min*6 +'deg)'})
            $("#hour").css({'transform' : 'rotate('+ (hour*30 + min*0.5) +'deg)'})
        }
    }, 1000);            
})