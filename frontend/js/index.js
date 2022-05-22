$(document).ready(function() {
    var d = new Date();
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
    $.ajax({
      url: 'components/movies.cfc', 
      async: false, 
      data: 
          {  
              method: "getMoviesList", 
              dateVal:dateVal},
              success: function(response) {
                  var dataInJson = JSON.parse(response);
                  if (dataInJson){ 
                      $.each(dataInJson['items'], function(index, value) {
                      textToInsert +=
                     '<div class="movie"> <div class="movie-details"><a href="./detail.cfm?id='+value['movieID']+'" class="poster-portrait-link"><img data-src="https://yc.cldmlk.com/movie-max-digital/1649370258215_UWMT_NZ_1Sht_web.jpg" class="poster-portrait  loaded" alt="" src="../manage/movies/'+value['fld_poster']+'" data-was-processed="true"></a> <div class="movie-info"><a href="./detail.cfm?id='+value['movieID']+'" class="movie-link"><h2 class="movie-title">'+value['fld_moviename']+'</h2></a> <p class="duration-rating">'+value['fld_details']+'</p><div class="actors-mobile-hide">'+ value['fld_cast']+'</div> </div></div><div class="movie-times"><div class="session-container"><span class="slot-link"  ><span class="time ">'+value['startTime']+'</span></span></div></div></div>';  
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
    $("#movie-list3").show(); 
    var dateVal = $(this).data('date');
    var textToInsert = '';
    $.ajax({
        url: 'components/movies.cfc', 
        async: false, 
        data: 
        {  
            method: "getMoviesList", 
            dateVal:dateVal},
            success: function(response) {
                var dataInJson = JSON.parse(response);
                if (dataInJson){ 
                    $.each(dataInJson['items'], function(index, value) {
                    textToInsert +=
                    '<div class="movie"> <div class="movie-details"><a href="./detail.cfm?id='+value['movieID']+'" class="poster-portrait-link"><img data-src="https://yc.cldmlk.com/movie-max-digital/1649370258215_UWMT_NZ_1Sht_web.jpg" class="poster-portrait  loaded" alt="" src="../manage/movies/'+value['fld_poster']+'" data-was-processed="true"></a> <div class="movie-info"><a href="./detail.cfm?id='+value['movieID']+'" class="movie-link"><h2 class="movie-title">'+value['fld_moviename']+'</h2></a> <p class="duration-rating">'+value['fld_details']+'</p><div class="actors-mobile-hide">'+ value['fld_cast']+'</div> </div></div><div class="movie-times"><div class="session-container"><span class="slot-link"  ><span class="time ">'+value['startTime']+'</span></span></div></div></div>';  
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
$(document).on("click", ".by-day", function () {
    $("#movie-list3").show(); 
    $("#movie-listTitle").hide();  
    var d = new Date();
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
    $.ajax({
      url: 'components/movies.cfc', 
      async: false, 
      data: 
          {  
              method: "getMoviesList", 
              dateVal:dateVal},
              success: function(response) {
                  var dataInJson = JSON.parse(response);
                  if (dataInJson){ 
                      $.each(dataInJson['items'], function(index, value) {
                      textToInsert +=
                     '<div class="movie"> <div class="movie-details"><a href="./detail.cfm?id='+value['movieID']+'" class="poster-portrait-link"><img data-src="https://yc.cldmlk.com/movie-max-digital/1649370258215_UWMT_NZ_1Sht_web.jpg" class="poster-portrait  loaded" alt="" src="../manage/movies/'+value['fld_poster']+'" data-was-processed="true"></a> <div class="movie-info"><a href="./detail.cfm?id='+value['movieID']+'" class="movie-link"><h2 class="movie-title">'+value['fld_moviename']+'</h2></a> <p class="duration-rating">'+value['fld_details']+'</p><div class="actors-mobile-hide">'+ value['fld_cast']+'</div> </div></div><div class="movie-times"><div class="session-container"><span class="slot-link"  ><span class="time ">'+value['startTime']+'</span></span></div></div></div>';  
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
$(document).on("click", ".by-movie", function () {
    $("#movie-list3").hide();
    $(".dates").hide();
    var textToInsert = '';
    $.ajax({
        url: 'components/movies.cfc', 
        async: false, 
        data: 
        {  
            method: "getMoviesListByTitle",},     
            success: function(response) {
                var dataInJson = JSON.parse(response);
                if (dataInJson){ 
                    $.each(dataInJson['items'], function(index, value) {
                    textToInsert +=
                    '<div class="movie"> <div class="movie-details"><a href="./detail.cfm?id='+value['movieID']+'" class="poster-portrait-link"><img data-src="https://yc.cldmlk.com/movie-max-digital/1649370258215_UWMT_NZ_1Sht_web.jpg" class="poster-portrait  loaded" alt="" src="../manage/movies/'+value['fld_poster']+'" data-was-processed="true"></a> <div class="movie-info"><a href="./detail.cfm?id='+value['movieID']+'" class="movie-link"><h2 class="movie-title">'+value['fld_moviename']+'</h2></a> <p class="duration-rating">'+value['fld_details']+'</p><div class="actors-mobile-hide">'+ value['fld_cast']+'</div> </div></div><div class="movie-times"><div class="session-container"><span class="slot-link"  ><span class="time ">'+value['startTime']+'</span></span></div></div></div>';  
                });  
                textToInsert += '</div>';
                    $('#movie-listTitle').html(textToInsert);
                }  
                else {                  
                    alert('Error!');    
                }                    
        }
    }); 
});
$(document).ready(function() {
    var btn = document.querySelector('.btn');
    var wrapper = window.parent.document.getElementById('wizParDiv0');
    btn.addEventListener('click', closePopUp);
    function closePopUp() { wrapper.remove(); }
});
