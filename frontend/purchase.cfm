<cfset moviesObj=CreateObject("component","components.movies")/>
<cfif structKeyExists(URL,'id')>
    <cfif URL.id NEQ "">
        <cfset variables.movieID = URL.id/>
        <cfset result=moviesObj.getMoviesById(movieID)/>   
    </cfif>
    <cfif URL.tid NEQ "">
        <cfset variables.theaterID = URL.tid/>
        <cfset res=moviesObj.getTheaterByID(theaterID)/>   
    </cfif>
</cfif>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width">
        <title><cfoutput>#result.FLD_MOVIENAME#</cfoutput> - Movie Max Digital</title>
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link href="./css/font.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="./css/site.css" />
        <link rel="stylesheet" type="text/css" href="./css/purchase.css" />
        <link type="text/css" href="./css/custom.css" rel="stylesheet" />
    </head>
    <body>
        <img class="body-background film-poster"></img>
        <img class="body-background film-backdrop"></img>
        <div id="container">
            <header>
                <a href="./index.cfm">
                    <img src="./images/banner.jpg" alt="" />
                </a>
            </header>
            <div id="page-body" >
                <cfoutput>
                    <input type="hidden" id="movieID" name="movieID" value= "#URL.id#"/>
                    <input type="hidden" id="theaterID" name="theaterID" value= "#URL.tid#"/>
                    <input type="hidden" id="showID" name="showID" value= "#URL.sid#"/> 
                    <input type="hidden" id="bookedTime" name="bookedTime" value= "#URL.slot#"/>
                    <input type="hidden" id="bookedDate" name="bookedDate" value= "#URL.date#"/>
                    <input type="hidden" id="userID" name="userID"  value="#session.stLoggedInFrUser.userID#"/> 
                    <section id="session-overview">
                        <section class="session-details ">
                            <div class="poster-container">
                                <img class="poster" src="../manage/movies/#result.FLD_POSTER#" alt=#result.FLD_MOVIENAME# />
                            </div>
                            <section class="film-details">
                                <div class="film-details-header">
                                    <div class="movie-title-container">
                                        <h3>
                                            <span>#result.FLD_MOVIENAME#</span>
                                        </h3>
                                    </div>                              
                                    <div> 
                                        <span> #result.fld_details#</span></br>  
                                    </div>
                                </div>
                                <div class="film-details-body">
                                    <div class="showtime-info">
                                        <label for="ShowingTime">Date</label>
                                        <text>#URL.date#</text>
                                    </div>
                                    <div class="showtime-info">
                                        <label for="FilmLength">Time</label>
                                        <text for="FilmLength">
                                        #URL.slot#
                                        </text>
                                    </div>
                                    <div class="showtime-info">
                                        <label for="SiteName">Theater Name</label>
                                        <text for="SiteName"> #res.fld_theaterName#</text>
                                    </div>
                                </div>
                            </section>
                        </section>
                    </section>
                    <div class="synopsis">
                        <p> #result.fld_cast#</p>
                    </div>
                </cfoutput>   
                <section id="ticket-section">
                    <div class="underlined">
                        <div class="page-heading highlight-foreground">
                            Select tickets
                        </div>
                    </div>
                    <div id="ticket-table-container">
                        <div class="ticket-table">
                            <div id="placeHolder" class="highlight-background"></div>
                            <table id="ticket-table" data-max-quantity="10">
                                <thead>
                                    <tr class="desktop-only">
                                        <th></th>
                                        <th class="desktop-only">Price</th>
                                        <th class="quantity">Quantity</th>
                                        <th class="subtotal">Subtotal</th>
                                    </tr>
                                </thead>
                                <tr data-max-quantity="10" 
                                    data-code="0001" 
                                    data-recognitionid=""
                                    data-price="300.0000" 
                                    data-bookingfee="" 
                                    data-isrewardticket="False"
                                    data-isForAllocatedArea="True" 
                                    data-cardNumber="" 
                                    data-voucherBarcode=""
                                    property="offers" 
                                    typeof="Offer" 
                                    class="">
                                        <td class="name" property="name">
                                            <div class="ticket-name">
                                                Gold Full                </div>
                                            <div class="ticket-table-member">
                                                <span class="price mobile-only" property="price">
                                                  <span> &#x20b9;</span> 300.00
                                                </span>
                                            </div>
                                        </td>
                                        <td class="desktop-only">
                                            <span class="price" property="price">
                                                  <span> &#x20b9;</span> 300.00
                                            </span>
                                        </td>
                                        <td class="quantity">
                                            <div>
                                                <button class="icon-button icon_circle_minus highlight-foreground"></button>
                                                <input type="tel" name="goldFullCount"  id="goldFullCount" class="short numeric" value="0" />
                                                <button class="icon-button icon_circle_plus highlight-foreground"></button>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="subtotal">
                                                    <span class="subtotal-currency">
                                                        <span> &#x20b9;</span> 
                                                    </span>
                                                    <span class="subtotal-value-money">
                                                        0.00
                                                    </span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr data-max-quantity="10" 
                                        data-code="0002" 
                                        data-recognitionid=""
                                        data-price="200.0000" 
                                        data-bookingfee="" 
                                        data-isrewardticket="False"
                                        data-isForAllocatedArea="True" 
                                        data-cardNumber="" 
                                        data-voucherBarcode=""
                                        property="offers" 
                                        typeof="Offer" 
                                        class="">
                                        
                                            <td class="name" property="name">
                                                <div class="ticket-name"> Gold Half</div>
                                                <div class="ticket-table-member">
                                                    <span class="price mobile-only" property="price">
                                                        <span> &#x20b9;</span> 200.00
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="desktop-only">
                                                <span class="price" property="price">
                                                    <span> &#x20b9;</span> 200.00
                                                </span>
                                            </td>
                                            <td class="quantity">
                                                <div>
                                                    <button class="icon-button icon_circle_minus highlight-foreground"></button>
                                                    <input type="tel" name="goldHalfCount"  id="goldHalfCount" class="short numeric" value="0" />
                                                    <button class="icon-button icon_circle_plus highlight-foreground"></button>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="subtotal">
                                                    <span class="subtotal-currency">
                                                        <span> &#x20b9;</span> 
                                                    </span>
                                                    <span class="subtotal-value-money">
                                                        0.00
                                                    </span>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr data-max-quantity="10" 
                                        data-code="0003" 
                                        data-recognitionid=""
                                        data-price="200.0000" 
                                        data-bookingfee="" 
                                        data-isrewardticket="False"
                                        data-isForAllocatedArea="True" 
                                        data-cardNumber="" 
                                        data-voucherBarcode=""
                                        property="offers" 
                                        typeof="Offer" 
                                        class="">
                                            <td class="name" property="name">
                                                <div class="ticket-name">ODC Full</div>
                                                <div class="ticket-table-member">
                                                    <span class="price mobile-only" property="price">
                                                        <span> &#x20b9;</span> 200.00
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="desktop-only">
                                                <span class="price" property="price">
                                                    <span> &#x20b9;</span> 200.00
                                                </span>
                                            </td>
                                            <td class="quantity">
                                                <div>
                                                    <button class="icon-button icon_circle_minus highlight-foreground"></button>
                                                    <input type="tel"  name="odcFullCount"  id="odcFullCount" class="short numeric" value="0" />
                                                    <button class="icon-button icon_circle_plus highlight-foreground"></button>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="subtotal">
                                                    <span class="subtotal-currency">
                                                            <span> &#x20b9;</span> 
                                                    </span>
                                                    <span class="subtotal-value-money">
                                                        0.00
                                                    </span>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr data-max-quantity="10" 
                                        data-code="0004" 
                                        data-recognitionid=""
                                        data-price="100.0000" 
                                        data-bookingfee="" 
                                        data-isrewardticket="False"
                                        data-isForAllocatedArea="True" 
                                        data-cardNumber="" 
                                        data-voucherBarcode=""
                                        property="offers" 
                                        typeof="Offer" 
                                        class="">                                    
                                            <td class="name" property="name">
                                                <div class="ticket-name">ODC Half </div>
                                                <div class="ticket-table-member">
                                                    <span class="price mobile-only" property="price">
                                                        <span> &#x20b9;</span> 100.00
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="desktop-only">
                                                <span class="price" property="price">
                                                    <span> &#x20b9;</span> 100.00
                                                </span>
                                            </td>
                                            <td class="quantity">
                                                <div>
                                                    <button class="icon-button icon_circle_minus highlight-foreground"></button>
                                                    <input type="tel"   name="odcHalfCount"  id="odcHalfCount" class="short numeric" value="0" />
                                                    <button class="icon-button icon_circle_plus highlight-foreground"></button>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="subtotal">
                                                    <span class="subtotal-currency">
                                                            <span> &#x20b9;</span> 
                                                    </span>
                                                    <span class="subtotal-value-money">
                                                        0.00
                                                    </span>
                                                </div>
                                            </td>
                                    </tr>
                                    <tr data-max-quantity="10" 
                                        data-code="0017" 
                                        data-recognitionid=""
                                        data-price="100.0000" 
                                        data-bookingfee="" 
                                        data-isrewardticket="False"
                                        data-isForAllocatedArea="True" 
                                        data-cardNumber="" 
                                        data-voucherBarcode=""
                                        property="offers" 
                                        typeof="Offer" 
                                        class="">
                                            <td class="name" property="name">
                                                <div class="ticket-name">Box </div>
                                                <div class="ticket-table-member">
                                                    <span class="price mobile-only" property="price">
                                                        <span> &#x20b9;</span> 100.00
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="desktop-only">
                                                <span class="price" property="price">
                                                    <span> &#x20b9;</span> 100.00
                                                </span>
                                            </td>
                                            <td class="quantity">
                                                <div>
                                                    <button class="icon-button icon_circle_minus highlight-foreground"></button>
                                                    <input type="tel"  name="boxCount"  id="boxCount" class="short numeric" value="0" />
                                                    <button class="icon-button icon_circle_plus highlight-foreground"></button>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="subtotal">
                                                    <span class="subtotal-currency">
                                                        <span> &#x20b9;</span> 
                                                    </span>
                                                    <span class="subtotal-value-money">
                                                        0.00
                                                    </span>
                                                </div>
                                            </td>
                                    </tr>
                                </table>
                            </div>
                    </div>
                    <div id="price-summary">
                        <div>
                            <span>Booking fee</span>
                            <div class="booking-fee-value"><span id="booking-fee-value">0.00</span></div>
                        </div>
                        <div>
                            <span class="total-label">Total price</span>
                            <div class="total-value">
                            <span id="total">   <span> &#x20b9;</span> 0.00</span>
                            </div>
                        </div>
                    </div>
                    <div id="ticket-actionss">
                        <button class="action highlight-background next pay">
                            Select seats
                        </button>
                    </div>
                </section>
                <section id="seat-selection">
                    <div class="underlined">
                        <div class="page-heading highlight-foreground">
                            Select seats
                        </div>
                    </div>
                    <span class="countdown">
                        <em>
                            <span>Time remaining: </span>
                            <span class="time highlight-foreground"></span>
                        </em>
                    </span>
                    <div class="Seating-Control layout"></div>
                    <div class="underlined">
                        <div class="page-heading highlight-foreground">
                            
                        </div>
                    </div>
                    <div id="seating-actions">
                        <button class="action-secondary-button highlight-border-medium back">
                            <span class="highlight-foreground">Back</span>
                        </button>
                        <button class="action highlight-background next">
                            <span>Next</span>
                        </button>
                    </div>
                </section>
                <section id="error-section">
                    <h2><em class="highlight-foreground">Sorry!</em></h2>
                    <p></p>
                    <div id="error-actions">
                        <button class="action highlight-background retry">
                            <span>Retry</span>
                        </button>
                    </div>
                </section>
            </div>
        </div>
        <script language="javascript" type="text/javascript" src="./js/date.js"></script>  
        <script type="text/javascript" src="./js/site.js"></script> 
        <script type="text/javascript" src="./js/purchase.js"></script>
    </body>
</html>
