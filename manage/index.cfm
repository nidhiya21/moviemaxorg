<cfif StructKeyExists(session.stLoggedInUser,"loggedin") AND session.stLoggedInUser.loggedin EQ true and  StructKeyExists(session.stLoggedInUser,"userID")>
     <cfset variables.userID=session.stLoggedInUser.userID />
     <cfset variables.userName=session.stLoggedInUser.userName />
<cfelse>
     <cfset variables.userID=0 />
</cfif>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Dashboard| Movie Max Digital</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
    </head>
    <body>
        <cfinclude template="leftsidemenu.cfm">  
            <cfoutput>
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
                                                            <h2>Dashboard</h2>
                                                            <p>Welcome to  Movie Max Digital Online Movie Booking 
                                                                <span class="bread-ntd">Admin Dashboard</span>
                                                            </p>
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
                    <cfset moviesObj=CreateObject("component","components.movies")/>
                    <cfset movieCnt=moviesObj.getMoviesCounts(variables.userID)/>
                    <cfset teaterCnt=moviesObj.getTeaterCounts(variables.userID)/>
                    <cfset userCnt=moviesObj.getUserCountS(variables.userID)/>
                    <cfset bookingCnt=moviesObj.getBookingCountS(variables.userID)/>
                    <div class="section-admin container-fluid">
                        <div class="row admin text-center">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="admin-content analysis-progrebar-ctn analysis-blue res-mg-t-15">
                                            <h1 class="text-left text-uppercase main-blk"><b>#userCnt.cnt#</b></h1>
                                            <h4 class="text-left text-uppercase"><b>Users</b></h4>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link more-info" href="./users.cfm">
                                                    More Info
                                                </a>
                                                <div class="small text-white">
                                                    <svg class="svg-inline--fa fa-angle-right lft-arrow" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M64 448c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L178.8 256L41.38 118.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l160 160c12.5 12.5 12.5 32.75 0 45.25l-160 160C80.38 444.9 72.19 448 64 448z"></path></svg><!-- <i class="fas fa-angle-right"></i> Font Awesome fontawesome.com -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="margin-bottom:1px;">
                                        <div class="admin-content analysis-progrebar-ctn analysis-green res-mg-t-30">
                                            <h1 class="text-left text-uppercase main-blk"><b>#teaterCnt.cnt#</b></h1>
                                            <h4 class="text-left text-uppercase"><b>Theaters</b></h4> 
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link more-info" href="./theaters-list.cfm">
                                                    More Info
                                                </a>
                                                <div class="small text-white">
                                                    <svg class="svg-inline--fa fa-angle-right lft-arrow" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M64 448c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L178.8 256L41.38 118.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l160 160c12.5 12.5 12.5 32.75 0 45.25l-160 160C80.38 444.9 72.19 448 64 448z"></path></svg><!-- <i class="fas fa-angle-right"></i> Font Awesome fontawesome.com -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="admin-content analysis-progrebar-ctn analysis-ylw res-mg-t-30">
                                            <h1 class="text-left text-uppercase main-blk"><b>#movieCnt.cnt#</b></h1>
                                            <h4 class="text-left text-uppercase"><b>Movies</b></h4>
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link more-info" href="./movies.cfm">
                                                    More Info
                                                </a>
                                                <div class="small text-white">
                                                    <svg class="svg-inline--fa fa-angle-right lft-arrow" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M64 448c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L178.8 256L41.38 118.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l160 160c12.5 12.5 12.5 32.75 0 45.25l-160 160C80.38 444.9 72.19 448 64 448z"></path></svg><!-- <i class="fas fa-angle-right"></i> Font Awesome fontawesome.com -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="admin-content analysis-progrebar-ctn analysis-orange res-mg-t-30">
                                            <h1 class="text-left text-uppercase main-blk"><b>#bookingCnt.cnt#</b></h1>
                                            <h4 class="text-left text-uppercase"><b>Bookings</b></h4> 
                                            <div class="card-footer d-flex align-items-center justify-content-between">
                                                <a class="small text-white stretched-link more-info" href="./booking.cfm">
                                                    More Info
                                                </a>
                                                <div class="small text-white">
                                                    <svg class="svg-inline--fa fa-angle-right lft-arrow" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M64 448c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L178.8 256L41.38 118.6c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l160 160c12.5 12.5 12.5 32.75 0 45.25l-160 160C80.38 444.9 72.19 448 64 448z"></path></svg><!-- <i class="fas fa-angle-right"></i> Font Awesome fontawesome.com -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </cfoutput>
        <cfinclude template="commonfooter.cfm">
    </body>
</html>