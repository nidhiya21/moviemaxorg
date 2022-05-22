<cfset moviesObj=CreateObject("component","components.movies")/>
<cfif structKeyExists(URL,'id')>
    <cfif URL.id NEQ "">
        <cfset variables.movieID = URL.id/>
        <cfset result=moviesObj.getMoviesById(movieID)/>   
    </cfif>
</cfif>
<!DOCTYPE html>
<html>
    <head>
        <title> <cfoutput>#result.fld_moviename# </cfoutput></title>
        <cfinclude template="./common.cfm">
    </head>
    <body>
        <header>
            <cfinclude template="./header.cfm">	 
        </header>
        <section class="details-container">
            <cfoutput>
                <div class="print-title"><h1>#result.fld_moviename#</h1></div>
                    <div class="mobile-hide movie-details-container">
                        <div class="movie-poster">
                            <img src="../manage/movies/#result.FLD_POSTER#" class="poster-portrait poster-filim">
                        </div>
                        <div class="movie-details">
                            <h1>#result.fld_moviename#</h1>
                            <div class="release-date">
                                <div>
                                    <cfset dateformat1 = DateFormat(result.startDate,"ddd")/>
                                    <cfset dateformat2 = DateTimeFormat(result.startDate,"mmm")/>
                                    <cfset dateformat3 = DateTimeFormat(result.startDate,"dd")/>
                                    #dateformat1# <span class="date">#dateformat3#</span> #dateformat2#
                                </div>
                                <p>
                                    Coming Soon to<br> Movie Max Digital Cinemas
                                </p>
                            </div>
                            <hr>
                            <p class="meta-data">#result.fld_details#</p>
                            <p class="meta-data">#result.fld_cast#</p>
                            <cfif result.fld_ratings EQ 1> 
                               <div class="small-ratings">
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            <cfelseif result.fld_ratings EQ 2> 
                                <div class="small-ratings">
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            <cfelseif result.fld_ratings EQ 3> 
                                <div class="small-ratings">
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            <cfelseif result.fld_ratings EQ 4> 
                                 <div class="small-ratings">
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            <cfelseif result.fld_ratings EQ 5> 
                                <div class="small-ratings">
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                    <i class="fa fa-star rating-color"></i>
                                </div>
                            </cfif>        
                            <hr>
                            <p><i></i></p>
                            <p><p>#result.fld_facts#</p></p>
                            <div class="social-media-share">
                                <a href="https://twitter.com/share?url=http%3A%2F%2Fwww.moviemaxdigital.co.nz%2Fmovie%2Fthe-unbearable-weight-of-massive-talent&text=The Unbearable Weight of Massive Talent%20at%20Movie%20Max%20Digital%20Cinemas" class="share-button twitter-share-button flex-container flex-container-inline" target="_blank"><span class="twitter-icon"></span> <span>Tweet</span></a>
                                <a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.moviemaxdigital.co.nz%2Fmovie%2Fthe-unbearable-weight-of-massive-talent" class="share-button facebook-share-button flex-container flex-container-inline" target="_blank"><img src="https://www.facebook.com/rsrc.php/v3/yq/r/5nnSiJQxbBq.png"> <span>Share</span></a>
                            </div>
                            <div class='embed-container trailer'>
                                <iframe src=#result.fld_link#></iframe>
                            </div>
                        </div>
                </div>
            </cfoutput>    
        </section>
        <section id="details">
            <div class="main-content">
                <!-- display date selector and times -->
                <div id="session-keys"></div>
            </div>
            <aside class="mobile-hide tablet-hide"> 
                <cfinclude template="./bannerleftblock.cfm">	
            </aside>
        </section>
        <cfinclude template="./cast.cfm">
        <cfinclude template="./footer.cfm">	
        <script type="text/javascript" src="./js/main.js"></script>   
    </body>
</html>