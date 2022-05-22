$("#contactFrm").validate({
    errorClass: "fail-alert",
    rules: {
        password: {
            required: true
        }    
    },
    messages: { 
        password: {
            required: "Please enter a password"
            
        },
    }      
});