
<!DOCTYPE html>
<html>
    <head>
        <title>PRICES & SPECIALS, Movie Max Digital Cinemas</title>
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
                        <h1>PRICES &amp; SPECIALS, Movie Max Digital Cinemas</h1>
                    </div>
                    <h1>PRICES &amp; SPECIALS</h1>
                    <h2>Ticket Prices</h2>
                    <p>&nbsp;</p>
                    <table id="c231" class="normal" border="0">
                        <tbody>
                            <tr>
                                <td><h3>Standard</h3></td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>Gold Full</strong></td>
                                <td><span> &#x20b9;</span> 300.00</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>Gold Half</strong></td>
                                <td><span> &#x20b9;</span>200.00</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>ODC Full</strong></td>
                                <td><span> &#x20b9;</span>200.00</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>ODC Half</strong></td>
                                <td><span> &#x20b9;</span>100.00</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td><strong>Box</strong></td>
                                <td><span> &#x20b9;</span>100.00</td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                    <hr id="c1087" />
                        <h2>Cinema Hire</h2>
                        <p>Cinema hire available, please <a href="mailto:events@moviemaxdigitals.com">contact us</a> for more information.</p>
                    <hr id="c1112" />
                        <h2>Phone Bookings</h2>
                        <p>Payment via Credit Card is required at the time of booking.</p>
                    <hr id="c1124" />
                        <h2>Internet Bookings</h2>
                        <p>To use the internet booking facility please click on the session time you would like to see and follow the instructions to confirm your booking. &nbsp;A <span> &#x20b9;</span>1.20 booking fee is charged for each ticket purchased.</p>
                    <hr id="c1136" />
                        <h2>Terms and Conditions</h2>
                        <p>Movie Max Digital Terms and Conditions can be found <a href="./terms.cfm" target="_self">here</a>.</p>
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