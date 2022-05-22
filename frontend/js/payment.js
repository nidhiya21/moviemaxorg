$(function () {
    $('[data-toggle="popover"]').popover();   
    $('#cvc').on('click', function(){
      if ( $('.cvc-preview-container').hasClass('hide') ) {
        $('.cvc-preview-container').removeClass('hide');
      } else {
        $('.cvc-preview-container').addClass('hide');
      }    
    });  
  });
$(document).on("click", ".paymentBtn", function () {
    var nameOnCard = $('#nameOnCard').val();
    var creditCardNumber = $('#creditCardNumber').val();
    var expiryDate = $('#expiryDate').val();
    var securityCode = $('#securityCode').val();
    var zipCode      = $('#zipCode').val();
    $.ajax({
        type:"POST",   
        url: 'components/movies.cfc',  
        dataType: "json",
        data: {
                method: "insertPayment",
                nameOnCard: nameOnCard,
                creditCardNumber: creditCardNumber,
                expiryDate: expiryDate,
                securityCode: securityCode,
                zipCode: zipCode 
            },
            success: function(objResponse ){  
                if (objResponse.SUCCESS){
                       // window.location = './paymentthanks.cfm'; 
                } else {  
                    
                }
            } 
        }); 
});
$("#payment").validate({
errorClass: "fail-alert",
rules: {
    nameOnCard: "required",
    creditCardNumber: {
        required: true,
        number: true
            
    },
    expiryDate: {
        required: true
        
    },
    securityCode: {
        required: true
        
    }, 
    zipCode: {
        required: true,
        number: true 
        
    }
},
messages: { 
    nameOnCard: "Please enter your Name ",

    creditCardNumber: {
        required: "Please enter a credit CardNumber ",
        number: "Must be number",
        
    },
    expiryDate: {
        required: "Please enter  expiry Date",
        
    },
    securityCode: {
        required: "Please enter security Code ",
        
    }, 
    zipCode:{ 
        required:"Please enter a  zip Code ",
        number: "Must be number",
    },
} 
});   
