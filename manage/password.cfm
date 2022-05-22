<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Change Password | Movie Max Digital </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
        <script src="js/theater.js"></script> 
        <script src="./js/jquery.validate.min.js"></script>
    </head>
    <body>
        <cfoutput>
            <cfinclude template="leftsidemenu.cfm"> 
            <cfset variables.userID=session.stLoggedInUser.userID />
            <!-- Start Welcome area -->
            <div class="all-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="logo-pro">
                                <a href="index.cfm"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-advance-area">
                    <cfinclude template="commonheader.cfm">  
                    <div class="breadcome-area">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="breadcome-list">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="breadcomb-wp">
                                                    <div class="breadcomb-icon">
                                                        <i class="icon nalika-home"></i>
                                                    </div>
                                                    <div class="breadcomb-ctn">
                                                        <h2>Change Password</h2>
                                                    </div>
                                                </div>
                                            </div>                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-xs-12"></div>
                    <div class="">
                        <div class="text-center m-b-md ">  
                        </div>
                        <div class="hpanel">
                            <div class="panel-body">
                                <div>
                                    <center>
                                        <h2 class="pass-txt"><span class="fa-passwd-reset fa-stack "><i class="fa fa-undo fa-stack-2x"></i><i class="fa fa-lock fa-stack-1x"></i></span>Reset your Password<span class="fa-passwd-reset fa-stack"><i class="fa fa-undo fa-stack-2x"></i><i class="fa fa-lock fa-stack-1x"></i></span></h2>
                                    </center>
                                </div>
                                <cfparam name="form.fld_password" default="" type="string">  
                                <cfparam name="form.fld_new_password" default="" type="string">  
                                <cfparam name="form.fld_confirm_password" default="" type="string"> 
                                <form name="passwordForm" method="post"  id="passwordForm"  action="components/contactscript.cfc?method=validatePassword"> 
                                    <cfif isDefined("session.errormsg")> 
                                        <p class="fail-alert"><cfoutput>#session.errormsg[1]#</cfoutput></p>
                                    </cfif> 
                                    <cfset errormsgs = StructDelete(session, "errormsg", "True")>     
                                    <div class="form-group">
                                        <label class="control-label" for="password">Old Password</label>
                                        <i class="fa fa-key icon"></i>
                                        <input type="password" title="Please enter your password" placeholder="******" name="fld_password"  id="fld_password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="password">New Password</label>
                                        <input type="password" title="Please enter your password" placeholder="******" name="fld_new_password" id="fld_new_password" class="form-control">
                                    </div>    
                                    <div class="form-group">
                                        <label class="control-label" for="password">Confirm Password</label>
                                        <input type="password" title="Please enter your password" placeholder="******" name="fld_confirm_password" id="fld_confirm_password" class="form-control">
                                        <span class="help-block small">Your new password and confirm  password must be same</span>
                                    </div>
                                    <button class="btn updatebtn">Update Password</button> 
                                </form> 
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
                </div>
            </div>
            <div class="footer-copyright-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer-copy-right">
                                <p>Copyright © 2018 <a href="##">Movie Max Digital</a> All rights reserved.</p>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>  
            <cfinclude template="commonfooter.cfm">
        </cfoutput>
    </body>
</html>