$(document).ready(function() {
    var userID = $('#userID').val();
    var d = new Date();
    var curTime = d.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true });
    month = '' + (d.getMonth() + 1);
    day = '' + d.getDate();
    year = d.getFullYear();
    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;
    var dates = [year, month, day].join('-'); 
    var dateVal = dates;
    var textToInsert = '';
    var movieID = $('#movieID').val();
    var curTime = moment(curTime, 'hh:mm A').format('HH:mm');
    $.ajax({
        url: 'components/movies.cfc', 
        async: false, 
        data: 
        {   
            method: "getTheaterList", 
            dateVal:dateVal, movieID:movieID},
            success: function(response) {
                var dataInJson = JSON.parse(response);
                if (dataInJson){ 
                    $.each(dataInJson['items'], function(index, value) { 
                    if (typeof userID === 'undefined'){ 
                        textToInsert +=
                        '<div class="movie"> <div class="movie-details"><img class="poster-portraits  loaded" alt="" src="../manage/img/theaterimages/'+value['fld_theaterImage']+'" data-was-processed="true"> <div class="movie-info"><h2 class="movie-title">'+value['fld_theaterName']+'</h2>  </div></div><div class="movie-times"><div class="session-container"><span class="slot-link"  ><span class="time ">'+value['startTime']+'</span></span></div></div></div>';  
                    }  
                    else{   
                        var startTime = moment(value['startTime'], 'hh:mm A').format('HH:mm');
                        if(curTime >= startTime){
                            textToInsert +=
                            '<div class="movie"> <div class="movie-details"><img class="poster-portraits  loaded" alt="" src="../manage/img/theaterimages/'+value['fld_theaterImage']+'" data-was-processed="true"> <div class="movie-info"><h2 class="movie-title">'+value['fld_theaterName']+'</h2>  </div></div><div class="movie-times"><div class="session-container"><span class="time expired slot-link">'+value['startTime']+'</span></div></div></div>';  
                        }else{
                            textToInsert +=
                            '<div class="movie"> <div class="movie-details"><img class="poster-portraits  loaded" alt="" src="../manage/img/theaterimages/'+value['fld_theaterImage']+'" data-was-processed="true"> <div class="movie-info"><h2 class="movie-title">'+value['fld_theaterName']+'</h2>  </div></div><div class="movie-times"><div class="session-container"><a href="./purchase.cfm?id='+value['movieID']+'&tid='+value['theaterID']+'&sid='+value['showID']+'&slot='+value['startTime']+'&date='+dateVal+'" class="slot-link"  ><span class="time ">'+value['startTime']+'</span></a></div></div></div>';  
                        }
                    }     
                });
                    textToInsert += '</div>';
                    $('#movie-list3').html(textToInsert);
                } 
                else {                  
                    alert('Error!');    
                }                    
        }
   }); 
});
$(document).on("click", ".date-slct", function () {
    var movieID = $('#movieID').val();
    var dateVal = $(this).data('date');
    var textToInsert = '';
    $.ajax({
        url: 'components/movies.cfc', 
        async: false, 
        data: 
        {  
            method: "getTheaterList", 
            dateVal:dateVal,movieID:movieID},
            success: function(response) {                   
                var dataInJson = JSON.parse(response);
                if (dataInJson){ 
                    $.each(dataInJson['items'], function(index, value) {
                        if (typeof userID === 'undefined'){ 
                            textToInsert +=
                                '<div class="movie"> <div class="movie-details"><img class="poster-portraits  loaded" alt="" src="../manage/img/theaterimages/'+value['fld_theaterImage']+'" data-was-processed="true"> <div class="movie-info"><h2 class="movie-title">'+value['fld_theaterName']+'</h2>  </div></div><div class="movie-times"><div class="session-container"><span class="slot-link"  ><span class="time ">'+value['startTime']+'</span></span></div></div></div>';   
                        }  
                        else{   
                            textToInsert +=
                                '<div class="movie"> <div class="movie-details"><img class="poster-portraits  loaded" alt="" src="../manage/img/theaterimages/'+value['fld_theaterImage']+'" data-was-processed="true"> <div class="movie-info"><h2 class="movie-title">'+value['fld_theaterName']+'</h2>  </div></div><div class="movie-times"><div class="session-container"><a href="./purchase.cfm?id='+value['movieID']+'&tid='+value['theaterID']+'&sid='+value['showID']+'&slot='+value['startTime']+'&date='+dateVal+'" class="slot-link"  ><span class="time ">'+value['startTime']+'</span></a></div></div></div>';  
                    }   
                });
                    textToInsert += '</div>';
                    $('#movie-list3').html(textToInsert);
                } 
                else {                  
                    alert('Error!');    
                }                    
        }
    }); 
});
$(document).on("click", ".expired", function () {
    alert("Sorry!Booking Closed")
});
$(document).on("click", ".slot-link", function () {
    var userID = $('#userID').val();
    if (typeof userID === 'undefined'){ 
        var $overlay = $('.overlay');
        var $mainPopUp = $('.main-popup')
        var $signIn = $('#sign-in');
        var $register = $('#register');
        var $formSignIn = $('form.sign-in');
        var $formRegister = $('form.register');
        var $firstChild = $('nav ul li:first-child');
        var $secondChild = $('nav ul li:nth-child(2)');
        var $thirdChild = $('nav ul li:nth-child(3)');
        $overlay.addClass('visible');
        $mainPopUp.addClass('visible');
        $signIn.addClass('active');
        $register.removeClass('active');
        $formRegister.removeClass('move-left');
        $formSignIn.removeClass('move-left');
    }
}); 
    
       
    