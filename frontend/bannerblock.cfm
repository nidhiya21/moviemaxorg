<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="./css/banner.css" />  
    </head>
    <body>
        <div class="">
            <cfset moviesObj=CreateObject("component","components.movies")/>
            <cfset movieList=moviesObj.getHomeMovies()/>
            <cfoutput>
                <cfloop query="movieList"> 
                    <!-- Full-width images with number and caption text -->
                    <div class=" preview  mySlides fade">      
                        <a href="./detail.cfm?id=#movieList.movieID#"  >
                            <img src="../manage/movies/#movieList.fld_poster#" style="width:100%">
                        </a>    
                        <div class="info carousel-caption">
                            <div class="caption-container">
                                <div class="caption-details">
                                    <h2>#movieList.fld_moviename# </h2>
                                    <p>#movieList.fld_details#</p>
                                    <cfif movieList.fld_ratings EQ 1> 
                                        <div class="small-ratings">
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    <cfelseif movieList.fld_ratings EQ 2> 
                                        <div class="small-ratings">
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    <cfelseif movieList.fld_ratings EQ 3> 
                                        <div class="small-ratings">
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    <cfelseif movieList.fld_ratings EQ 4> 
                                        <div class="small-ratings">
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    <cfelseif movieList.fld_ratings EQ 5> 
                                        <div class="small-ratings">
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                            <i class="fa fa-star rating-color"></i>
                                        </div>
                                    </cfif>    
                                </div>
                                <div class="caption-link">
                                    <a href="./detail.cfm?id=#movieList.movieID#&up=no"  >BUY TICKETS</a>
                                </div>
                            </div>
                        </div>
                    </div> 
                </cfloop>
            </cfoutput>
        </div>
        <br>
        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
        <script type="text/javascript" src="./js/slider.js"></script>
    </body>
</html> 
