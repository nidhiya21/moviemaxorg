$("#loginForm").validate({
    errorClass: "fail-alert",
    rules: {
        emailID: {
            required: true,
            email: true   
        },  
        password: {
            required: true,
            minlength: 5
        }      
    },
    messages: { 
        emailID: {
            required: "Please enter a userName",
            email: "Must be valid email"
            
        },
        password: {
            required: "Please enter password ",
            minlength: "Your userName must consist of at least 5 characters "
            
        },
        
    } 
});  
$("#signup").validate({
    errorClass: "fail-alert",
    rules: {
        userName: "required",
        emailID: {
            required: true,
            email: true
        },
        phoneNumber: {
            required: true
        },
        password: {
            required: true,
            minlength: 5,
            equalTo: "#confirmpassword"
        },
        confirmpassword: {
            required: true
            
        }
    },
    messages: { 
        userName: "Please enter your fullName ",
 
        emailID: {
            required: "Please enter a emailID ",
            email: "Must be valid email"
        },
        password: {
            required: "Please provide a password ",
            minlength: "Your password must be at least 5 characters long "
        },
        confirm_password: {
            required: "Please provide a confirm password ",
            minlength: "Your password must be at least 5 characters long ",
            equalTo: "Please enter the same password as above "
        },
        phoneNumber: "Please enter phoneNumber ",
   } 
});