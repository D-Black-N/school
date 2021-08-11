jQuery(function(){
    var date = new Date().toLocaleDateString()
    setInterval(() => {
        var now = new Date();
        $("#digital-clock").html(now.toLocaleTimeString())
    }, 1000);        
    // $("#date").html(now.toLocaleDateStыring())
})
