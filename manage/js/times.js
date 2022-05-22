$(document).ready(function() {
    $("#showtime").validate({
        errorClass: "fail-alert",
        rules: {
            theaterID: "required", 
            movieID: "required", 
            startDate: "required", 
            endDate: "required",
            startTime: "required",
            endTime: "required",
            goldFull: "required",
            goldHalf: "required",
            odcFull: "required",
            odcHalf: "required",
            box: "required",
            seats: "required"
        },
        messages: { 
            theaterID: "Please select theate",
            movieID: "Please select movie",
            startDate: "Please enter start Date",
            endDate: "Please enter end Date",
            startTime: "Please enter start Time",
            endTime: "Please enter price",
            goldFull: "Please enter price",
            goldHalf: "Please enter price",
            odcFull: "Please enter price",
            odcHalf: "Please enter price",
            box: "Please enter end price",
            seats: "Please enter seats" 
             
        },       
    });
});
$(document).on("click", ".formTimeSubmit", function () {
    var userID = $('#userID').val();
    var showID  = $('#showID').val();
    $.ajax({ 
        url: "components/times.cfc?method=insertShow",
        type: "POST",
        data: new FormData($('#showtime')[0]), 
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false
    }).done(function(objResponse) { 
        if (!$.trim(objResponse)){  
        
            alert('Time Updated successfully');    
        }else{
            alert('Time Updated successfully');    
        }
    })  
    	
});
$(document).on("click", ".modal-trigger", function () {
	var showID = $(this).data('id');
	$(".modal-contentVal #showIDVal").val(showID);   
});
$(document).on("click", ".deleteSubmit", function () {
	var showID = $('#showIDVal').val();
	$.ajax({
    url: 'components/times.cfc', 
    async: false,
    dataType: "json",
    data: 
        { 
            method: "deleteShows",
            showID:showID},
            success: function(objResponse ) {
                if (objResponse.SUCCESS){ 
                    alert('Shows deleted successfully');           
                } 
                else {                  
                    alert('Error in deletion,Please try again!');    
                }                    
        }
    }); 
});
$(document).on("click", ".myform-btnVal", function () {
    $(".mod-title").html("ADD SHOW TIMINGS"); 
  
});   
$(document).on("click", ".modal-trigger-edit", function () {
	var showID = $(this).data('id');
    $.ajax({
        url: 'components/times.cfc',  
        async: false, 
        data: 
            {  
                method: "getShowByID",
                showID:showID},
                success: function(response) {
                    if (response){ 
                        $(".mod-title").html("EDIT SHOW TIMINGS");     
                    //  console.log(typeof response);
                        var dataInJson = JSON.parse(response);
                        $(".modal-content #theaterID").val(dataInJson.items[0].theaterID);
                        $(".modal-content #showID").val(dataInJson.items[0].showID );
                        $(".modal-content #movieID").val(dataInJson.items[0].movieID);
                       // $(".modal-content #startDate").val(dataInJson.items[0].startDate);
                       // $(".modal-content #endDate").val(dataInJson.items[0].endDate);
                        $(".modal-content #startTime").val(dataInJson.items[0].startTime);
                        $(".modal-content #endTime").val(dataInJson.items[0].endTime);
                        $(".modal-content #goldFull").val(dataInJson.items[0].goldFull);
                        $(".modal-content #goldHalf").val(dataInJson.items[0].goldHalf);
                        $(".modal-content #odcFull").val(dataInJson.items[0].odcFull);
                        $(".modal-content #odcHalf").val(dataInJson.items[0].odcHalf);
                        $(".modal-content #box").val(dataInJson.items[0].box);
                        $(".modal-content #seats").val(dataInJson.items[0].seats);
                        var now = new Date(dataInJson.items[0].startDate);
                        var day = ("0" + now.getDate()).slice(-2);
                        var month = ("0" + (now.getMonth() + 1)).slice(-2);
                        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
                        $(".modal-content #startDate").val(today);
                        var now = new Date(dataInJson.items[0].endDate);
                        var day = ("0" + now.getDate()).slice(-2);
                        var month = ("0" + (now.getMonth() + 1)).slice(-2);
                        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
                        $(".modal-content #endDate").val(today);
                    } 
                    else {                  
                        alert('Error!');    
                    }                    
            }
     }); 
});
$(document).on('hide.bs.modal','#addEmployeeModal', function () {
    $("label.fail-alert" ).remove(); 
    $('input').removeClass('fail-alert');
    document.getElementById("showtime").reset(); 
    
});
$(document).ready( function () {
    $('#table_id').DataTable();
} ); 
