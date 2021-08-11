jQuery(function(){
    $(".plus").click(function(el){
        if (el.target.id == 's1') {
            $("#s1").css("display", "none")
            $("#l2").css("display", "flex")    
        }
        else {
            if (el.target.id == 's2') {
                $("#s2").css("display", "none")
                $("#l3").css("display", "flex")        
            }  
            else {               
                $("#s3").css("display", "none")
                $("#l4").css("display", "flex")    
            }
        }
    })
})