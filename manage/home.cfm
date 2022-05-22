<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home | Movie Max Digital </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
        <script src="./js/jquery.validate.min.js"></script>
    </head>
    <body>
        <cfoutput>
            <cfinclude template="leftsidemenu.cfm"> 
            <cfset variables.userID=session.stLoggedInUser.userID />
            <cfset moviesObj=CreateObject("component","components.movies")/> 
            <!-- Start Welcome area -->
            <div class="all-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="logo-pro">
                                <a href="index.cfm">
                                    <img class="main-logo" src="img/logo/logo.png" alt="" />
                                </a>
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
                                                        <h2>Home Page</h2>
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
                            <div class="text-center m-b-md "> </div>
                            <div class="hpanel">
                                <div class="panel-body">
                                    <cfset movieList=moviesObj.getMovies(variables.userID)/>
                                    <cfloop query="movieList">       
                                        <div class="movie-blk">
                                            <div class="movie-title"> #movieList.fld_moviename# </div>
                                            <cfif movieList.fld_poster NEQ ''>
                                                <img src="./movies/#movieList.fld_poster#" class="home-img"/>
                                            <cfelse> 
                                                 <img src="./img/theaterimages/no-man.jpg" class="home-img">
                                            </cfif>
                                            <div class="movie-right"> 
                                                <div class="movie-desc">
                                                    <span class="movie-top">Details :</span>
                                                    #movieList.fld_details#
                                                </div>
                                                <div class="movie-cast">
                                                    <span class="movie-top">Cast :</span>
                                                    #movieList.fld_cast#
                                                </div>
                                                <div class="movie-rate">
                                                    <span class="movie-top">Ratings :</span>
                                                    #movieList.fld_ratings# / 5
                                                </div>
                                                <div class="movie-facts">
                                                    <span class="movie-top">Facts :</span>
                                                    #movieList.fld_facts#
                                                </div>
                                                <cfset btnContent= ((movieList.displayHome EQ "No") ?"Activate" :"Activated" ) /> 
                                                <cfset btnStatus= ((movieList.displayHome EQ "No") ?"yes" :"No" ) /> 
                                                <button class="btn activatebtn" id="activatebtn" value=#btnStatus#  data-status=#btnStatus# data-id=#movieList.movieID#>
                                                    #btnContent# 
                                                </button> 
                                            </div>    
                                        </div>
                                    </cfloop>    
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
            <cfinclude template="commonfooter.cfm">
        </cfoutput>
        <script src="js/movies.js"></script> 
    </body>
</html>