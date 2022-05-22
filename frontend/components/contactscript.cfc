<cfscript>
    component {     
         remote function saveUser (){
            var phoneNumber = trim(form.phoneNumber);
            var userName = trim(form.userName);
            var emailID = trim(form.emailID); 
            var password = trim(form.password);
            var confirmpassword = trim(form.confirmpassword); 
            var errorMessage= arrayNew(1);
            if(phoneNumber EQ ''){			
                ArrayAppend(errorMessage,"Please Enter phoneNumber","true");
            }
            if(userName EQ ''){			
                ArrayAppend(errorMessage,"Please Enter userName","true");
            }
            if(emailID EQ '' OR NOT isValid("eMail", emailID)){			
                ArrayAppend(errorMessage,"Please Enter valid Email","true");
            }
            if(password EQ ''){			
                ArrayAppend(errorMessage,"Please Enter password","true");
            }
            if(confirmpassword EQ ''){			
                ArrayAppend(errorMessage,"Please Enter confirmpassword","true");
            }
            if(confirmpassword NOT EQUAL password){			
                ArrayAppend(errorMessage,"Confirm Password Mismatch","true");
            }
            checkEmail = queryExecute(sql:"select * from user where emailID=:emailID"
                            ,params={emailID:{type:'varchar',value:'#emailID#'}}
                                );
            var prefix = checkEmail.userID
            if (prefix EQ 1){
                ArrayAppend(errorMessage,"emailID Already exists","true");       
            }
            if  (arrayIsEmpty(errorMessage)){
                qService = new query();
                qService.setName("qInsert");
                qService.addParam(name="emailID", value="#trim(form.emailID)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="userName", value="#trim(form.userName)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="password", value="#hash(form.password)#", cfsqltype="cf_sql_varchar");
                qService.addParam(name="phoneNumber", value="#trim(form.phoneNumber)#", cfsqltype="CF_SQL_BIGINT");
                qService.setSql("INSERT INTO user( emailID,password,phoneNumber,userName) VALUES (:emailID, :password, :phoneNumber, :userName)");
                var result = qService.execute();
                var getID  = result.getPrefix().generatedkey;
                if(getID GT 0){
              
                     StructDelete(session,"errormsg", "true");
                     session.stLoggedInFrUser = {'loggedin'=true, 'emailID' = form.emailID,
                                   'userID' = getID} ; 
                }
                location("../account.cfm", "no");      
            } 
            else{
                Session.errormsg = errorMessage; 
                location("../index.cfm", "no");     
            }
            return Session.errorMessage ;  
        }
        remote function validateLogin (){
            var errorMessage= arrayNew(1);
            var emailID = trim(form.emailID);
            var password = trim(form.password);
                if(emailID EQ  ""){ 
                    ArrayAppend(errorMessage,"Please Enter emailID","true");
                }
                if(password EQ  ""){
                    ArrayAppend(errorMessage,"Please Enter Password","true");
                }
                if(arrayIsEmpty(errorMessage)){ 
                    getUsersDet = queryExecute(sql:"select * from user where emailID=:emailID  AND password=:password"
                            ,params={emailID:{type:'varchar',value:'#emailID#'},password:{type:'varchar',value:#hash(password)#}}
                            );
                    var prefix = getUsersDet.userID;
                    if (prefix GT 0){
                        StructDelete(session,"errormsgLog", "true");
                        session.stLoggedInFrUser = {'loggedin'=true,'emailID' = getUsersDet.emailID,
                                   'userID' = getUsersDet.userID} ; 
                        location(CGI.HTTP_REFERER, "no");      
                    }else{
                        arrayAppend(errorMessage, 'Incorrect username/Password',"true");
                        Session.errormsgLog = errorMessage;
                        location("../index.cfm", "no");     
                    }
                }else{
                    Session.errormsgLog = errorMessage; 
                    location("../index.cfm", "no");     
                }
            return Session.errormsgLog ;
        } 
    }
</cfscript>