<!DOCTYPE html>
<html>
    <head>
        <title>Profile Edit, Movie Max Digital Cinemas</title>
        <cfinclude template="./common.cfm">
        <link rel="stylesheet" type="text/css" href="./css/profile.css" /> 
        <script src="./js/jquery.validate.min.js"></script>
        <script src="./js/account.js"></script>   
    </head> 
    </head>
    <body>
    <cfoutput> 
        <header>
            <cfinclude template="./header.cfm">	 
        </header>
        <cfif isDefined("session") and structKeyExists(session, 'stLoggedInFrUser')  and structKeyExists(session.stLoggedInFrUser, 'userID')  >
            <cfset variables.userID=session.stLoggedInFrUser.userID />
        </cfif>
        <cfset moviesObj=CreateObject("component","components.movies")/>
        <cfset result=moviesObj.getUserDetails(userID)/>   
        <section id="basic-page">
            <div class="main-content">
            <div class="alert alert-success hide">
                <strong>Success!</strong> Profile updated.
            </div>
                <div class="staticPage">
                    <div class="container">
                        <div class="row profile">
                            <div class="col-md-3">
                                <div class="profile-sidebar">
                                    <div class="profile-userpic">
                                        <img src="./images/4.png.webp" class="img-responsive" alt="">
                                    </div>
                                    <div class="profile-usertitle">
                                        <div class="profile-usertitle-name"> 
                                           #result.userName#
                                        </div>
                                        <div class="profile-usertitle-job">
                                            #result.emailID#
                                        </div>
                                    </div>
                                    <div class="profile-usermenu">
                                        <ul class="nav">
                                            <li>
                                                <a href="./account.cfm">
                                                <i class="glyphicon glyphicon-user"></i>
                                                Account Settings </a>
                                            </li>
                                            <li class="active">
                                                <a href="./booking.cfm">
                                                <i class="glyphicon glyphicon-home"></i>
                                                Booking History </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>                       
                                    <div>
                                </div>
                            </div>                                                  
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="profile-content">                           
                            <div class="form_main col-md-4 col-sm-5 col-xs-7">
                                <h4 class="heading"><strong>Personal </strong> Contact <span></span></h4>
                                <div class="form">
                                    <cfparam name="form.userName" default="" type="string"> 
                                    <cfparam name="form.emailID" default="" type="string"> 
                                    <cfparam name="form.password" default=""  type="string"> 
                                    <cfparam name="form.phoneNumber" default=""> 
                                    <form name="contactFrm"  id="contactFrm"  method="post" action="components/movies.cfc?method=updateProfile">
                                        <cfif isDefined("session.errormsg")> 
                                            <div class="fail-alert"><cfoutput>#session.errormsg[1]#</cfoutput></div>
                                        </cfif>
                                        <cfset errormsgs = StructDelete(session, "errormsg", "True")>  
                                        <input type="text"  placeholder="Name" name="userName" value=#result.userName# class="txt">
                                        <input type="text" placeholder="Email"  name="emailID" value=#result.emailID# class="txt" readonly>
                                        <input type="text" placeholder="Phone Number"  name="phoneNumber" value=#result.phoneNumber# class="txt">
                                        <input type="password" id="password" placeholder="Change Password" name="password" class="txt" ><br>
                                        </br>
                                        </br> 
                                        <input type="Submit" value="Update"   class="btn btn-default">
                                    </form>
                                </div>
                            </div>
                        </div>
		            </div>
	            </div>
                </div>
            </div>
            </div>
            <aside class="mobile-hide tablet-hide">
                <cfinclude template="./bannerleftblock.cfm">	      
                <div class="coming-soon">
                    <cfoutput>
                    <h2>COMING SOON</h2>
                    <ul class="coming-soon">
                        <cfset moviesObj=CreateObject("component","components.movies")/>
                        <cfset movieList=moviesObj.getUpcomingMovies()/>
                        <cfloop query="movieList"> 
                            <li><a href="./detail.cfm?id=#movieList.movieID#&up=yes">#movieList.fld_moviename#</a></li>
                        </cfloop>
                        <li><a href="./comingsoon.cfm" class="see-all">SEE ALL</a></li>
                    </ul>
                    </cfoutput>
                </div>
            </aside>
        </section>
            <cfinclude template="./footer.cfm">	
        </cfoutput>    
    </body>
</html>