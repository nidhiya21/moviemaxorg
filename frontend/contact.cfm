
<!DOCTYPE html>
<html>
    <head>
        <cfinclude template="./common.cfm">	 
    </head>
    <body>
        <header>
            <cfinclude template="./header.cfm">	 
        </header>
        <section id="basic-page">
            <div class="main-content">
                <div class="staticPage">  
                    <div class="print-title">
                        <h1>CONTACT &amp; LOCATION, Movie Max Digital Cinemas</h1>
                    </div>
                    <h1>CONTACT &amp; LOCATION</h1>
                    <iframe id="c220"  width="100%" height="450" frameborder="0" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDIwdoJS1mh4IHsRyiKV-XOUJh4uIpJ6t8&q=Movie+Max">
                    </iframe>
                    <p></p>
                    <p>Movie Max Digital is on the Corner of Sophia and Canon Streets</p>
                    <p>
                        <b> Email</b> <br/>
                        <a href="mailto: info@moviemaxdigital.com">info@moviemaxdigital.com</a>
                    </p>
                    <p>
                        <b>Phone<br/></b>Movie Information Line: 03-684-6987<br/>
                    </p>
                    <p>
                        <b data-highlightable="1">Fundraising, Cinema Hires and Group Bookings</b> <br data-highlightable="1"/>info@moviemaxdigital.com
                    </p>
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
                                <li>
                                    <a href="./detail.cfm?id=#movieList.movieID#&up=yes">
                                        #movieList.fld_moviename#
                                    </a>
                                </li>
                            </cfloop>
                            <li>
                                <a href="./comingsoon.cfm" class="see-all">
                                    SEE ALL
                                </a>
                            </li>
                        </ul>
                    </cfoutput>
                </div>
            </aside>
        </section>
        <cfinclude template="./footer.cfm">	
        <script type="text/javascript" src="./js/main.js"></script>   
    </body>
</html>