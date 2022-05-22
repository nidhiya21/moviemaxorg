$("#loginForm").validate({
    errorClass: "fail-alert",
    rules: {
        fld_username: {
            required: true
        },  
        fld_password: {
            required: true
           
        }      
    },
    messages: { 
        fld_username: {
            required: "Please enter a userName"
            
        },
        fld_password: {
            required: "Please enter password "
           
            
        },
        
    }      
});
$("#movie").validate({
    errorClass: "fail-alert",
    rules: {
        fld_moviename: "required", 
        fld_details: "required", 
        fld_cast: "required", 
        fld_link: "required" 
    },
    messages: { 
        fld_moviename: "Please enter name",
        fld_details: "Please enter details",
        fld_cast: "Please enter cast",
        fld_link: "Please enter link"
            
    },       
});
$(document).on("click", ".formMovieSubmit", function () {
    if ($('#fld_poster').val()!='') {
        var movieImageVal = $('#fld_poster').val();
    } else if ($('#old_img').val()!='') {
        var movieImageVal = $('#old_img').val(); 
    } else {
        var movieImageVal = '';
    }
    var movieImage = movieImageVal.split("\\").pop();
    var userID = $('#userID').val();
    var fld_moviename = $('#fld_moviename').val();
    var movieID  = $('#movieID').val();
    var fileData = new FormData($('#movie')[0]);
    var fileData = fileData.append("fld_moviename", fld_moviename); 
    $.ajax({ 
        url: "components/movies.cfc?method=insertMovie", 
        type: "POST",
        dataType: "json",
        data: new FormData($('#movie')[0]), 
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false
    }).done(function(objResponse) { 
        if (objResponse.SUCCESS){
            alert('Movie Updated successfully');    
        } else {  
           
        } 
    })  
    	
});
$(document).on("click", ".modal-trigger", function () {
	var movieID = $(this).data('id');
	$(".modal-contentVal #movieIDVal").val(movieID);   
});
$(document).on("click", ".deleteSubmit", function () {
	var movieID = $('#movieIDVal').val();
	$.ajax({
    url: 'components/movies.cfc', 
    async: false,
    dataType: "json",
    data: 
        { 
            method: "deleteMovies",
            movieID:movieID},
            success: function(objResponse ) {
                if (objResponse.SUCCESS){ 
                    alert('Movie deleted successfully');           
                } 
                else {                  
                    alert('Error in deletion,Please try again!');    
                }                    
        }
    }); 
});
$(document).on("click", ".myform-btnVal", function () {
    $(".mod-title").html("ADD MOVIE"); 
    var editSrc = "./img/theaterimages/no-man.jpg";
    $("#editimgsrc").attr('src', editSrc);      
});   
$(document).on("click", ".modal-trigger-edit", function () {
	var movieID = $(this).data('id');
    $.ajax({
        url: 'components/movies.cfc', 
        async: false, 
        data: 
            {  
                method: "getMovieByID",
                movieID:movieID},
                success: function(response) {
                    if (response){ 
                        $(".mod-title").html("EDIT MOVIE");    
                    //  console.log(typeof response);
                        var dataInJson = JSON.parse(response);
                        $(".modal-content #fld_moviename").val(dataInJson.items[0].fld_moviename);
                        $(".modal-content #movieID ").val(dataInJson.items[0].movieID );
                        $(".modal-content #old_img").val(dataInJson.items[0].fld_poster);
                        $(".modal-content #fld_details").val(dataInJson.items[0].fld_details);
                        $(".modal-content #fld_cast").val(dataInJson.items[0].fld_cast);
                        $(".modal-content #fld_facts").val(dataInJson.items[0].fld_facts);
                        $(".modal-content #fld_link").val(dataInJson.items[0].fld_link);
                        $(".modal-content #fld_ratings").val(dataInJson.items[0].fld_ratings);
                        if(dataInJson.items[0].fld_poster){
                            var editSrc = "./movies/"+dataInJson.items[0].fld_poster;
                            $("#editimgsrc").attr('src', editSrc);   
                        }else{
                            var editSrc = "./img/theaterimages/no-man.jpg";
                            $("#editimgsrc").attr('src', editSrc);   
                        }
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
    document.getElementById("movie").reset();
    
});
function preview() {
    editimgsrc.src=URL.createObjectURL(event.target.files[0]);
}
$(document).on("click", ".activatebtn", function () {
    var movieID = $(this).data('id');
    var status  = $(this).data('status');
    // var status = $('#activatebtn').val();
	$.ajax({
    url: 'components/movies.cfc', 
    async: false,
    dataType: "json",
    data: 
        { 
            method: "activateMovies",
            movieID:movieID,status:status},
            success: function(objResponse ) {
                if (objResponse.SUCCESS){ 
                    if(status == "No"){ 
                        $("#activatebtn").html("Activate"); 
                        alert('Movie inactivate successfully');
                     
                    }else{
                        $("#activatebtn").html("Activated"); 
                        alert('Movie activated successfully');  
                    }
                } 
                else {                  
                    alert('Error in activation,Please try again!');    
                }                    
        }
    }); 
});
$(document).on("click", ".loginbtn", function () {
    var fld_username = $('#fld_username').val();
    var fld_password = $('#fld_password').val();
	$.ajax({
    url: 'components/movies.cfc', 
    async: false,
    dataType: "json",
    data: 
        { 
            method: "validateLogin",
            fld_username:fld_username,fld_password:fld_password},
            success: function(objResponse ) {
                if (objResponse.SUCCESS){ 
                }                   
        }
    }); 
});
$(document).ready( function () {
    $('#table_id').DataTable();
}); 