<!DOCTYPE html>
<html>
    <head>
        <title>Theaters in  Movie Max Digital Cinemas</title>
        <meta name="description" content="Home home of great movies.">
        <cfinclude template="./common.cfm">
    </head>
    <body>
        <header>
            <cfinclude template="./header.cfm">	 
        </header>
        <section id="coming-soon">
            <cfoutput>
                <div class="main-content">
                    <h1>Theaters</h1>
                    <div id="movie-list" class="flex-container flex-container-wrap">
                        <!-- display list of movies here -->
                        <cfset moviesObj=CreateObject("component","components.movies")/>
                        <cfset theaterList=moviesObj.getTheaters()/>
                        <cfloop query="theaterList"> 
                            <div class="movie flex-item-stretch">
                                <img src="../manage/img/theaterimages/#theaterList.fld_theaterImage#" class="poster-portrait mobile-hide">
                                <div class="movie-info upcoming">
                                    <h2 class="filim">#theaterList.fld_theaterName#</h2>                            
                                </div>
                            </div>
                        </cfloop>
                        <div class="movie flex-item-stretch blank">&nbsp;</div>
                    </div>
                </div>
                <aside class="mobile-hide tablet-hide">
                    <cfinclude template="./bannerleftblock.cfm">	
                </aside>
            </cfoutput>    
        </section>
        <cfinclude template="./footer.cfm">	
        <script type="text/javascript" src="./js/main.js"></script>   
    </body>
</html>