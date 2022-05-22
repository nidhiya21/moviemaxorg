<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Login |  Movie Max Digital </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="./common.cfm">
        <script src="./js/jquery.validate.min.js"></script> 
    </head>
    <body>
        <div class="color-line"></div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
                <div class="col-md-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="text-center m-b-md custom-login">
                        <h3>LOGIN</h3>
                    </div>
                    <div class="hpanel">
                        <div class="panel-body">
                            <cfparam name="form.fld_username" default="" type="string"> 
                            <cfparam name="form.fld_password" default="" type="string">  
                            <cfif isDefined("session.errormsg")> 
                                <p class="fail-alert"><cfoutput>#session.errormsg[1]#</cfoutput></p>
                            </cfif>
                            <cfset errormsgs = StructDelete(session, "errormsg", "True")>  
                            <form name="loginForm" id="loginForm" method="post" action="components/contactscript.cfc?method=validateLogin">
                                <div class="form-group">
                                    <label class="control-label" for="fld_username">Username</label>
                                    <input type="text" placeholder="example@gmail.com" placeholder="Your unique username"  title="Please enter you username" name="fld_username" id="fld_username" class="form-control"> 
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="password">Password</label>
                                    <input type="password" title="Please enter your password" placeholder="******" name="fld_password" id="fld_password" class="form-control">    
                                </div>
                                <button class="btn btn-success btn-block loginbtn">Login</button> 
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
            </div>
        </div>
        <script type="text/javascript" src="./js/movies.js"></script>
    </body>
</html>