<cfif isDefined("session") and structKeyExists(session, 'cart')  and structKeyExists(session.cart, 'cartID')  >
    <cfset variables.cartID=session.cart.cartID />
    <cfset variables.showID=session.cart.showID />
    <cfset moviesObj=CreateObject("component","components.movies")/>
    <cfset result=moviesObj.getCartDetails(cartID)/>
</cfif>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width">
        <title>Seat Selection - Movie Max Digital</title>
        <link rel="stylesheet" type="text/css" href="./css/site.css" />
        <link type="text/css" href="./css/custom.css" rel="stylesheet" />
        <script src="./js/jquery-1.12.4.min.js"  crossorigin="anonymous"></script>
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
            <div id="page-body"> 
                <cfoutput> 
                    <input type="hidden" id="showID" name="showID" value=#showID#> 
                    <input type="hidden" id="cartID" name="cartID" value=#session.cart.cartID#> 
                    <input type="hidden" id="goldFullCount" name="goldFullCount" value=#result.goldFullCount#> 
                    <input type="hidden" id="goldHalfCount" name="goldHalfCount" value=#result.goldHalfCount#> 
                    <input type="hidden" id="odcFullCount" name="odcFullCount" value=#result.odcFullCount#> 
                    <input type="hidden" id="odcHalfCount" name="odcHalfCount" value=#result.odcHalfCount#> 
                    <input type="hidden" id="boxCount" name="boxCount" value=#result.boxCount#> 
                    <input type="hidden" id="bookedDate" name="bookedDate" value=#result.bookedDate#>
                    <input type="hidden" id="bookedTime" name="bookedTime" value="#result.bookedTime#"> 
                </cfoutput>     
                <div class="seatSelection col-lg-12">  
                    <ul class="showcase">
                        <li>
                            <div class="seat  seatNumber "></div>
                            <small>N/A</small>
                        </li>
                        <li>
                            <div class="seat seatNumber seatSelected"></div>
                            <small>Selected</small>
                        </li>
                        <li>
                            <div class="seat seatNumber seatUnavailable"></div>
                            <small>Occupied</small>
                        </li>  
                        <li>
                            <div class="seat seatNumber disabledseat" ></div>
                            <small>Not available</small>
                        </li>    
                    </ul>
                    <p class="seatSection"></p>
                    <div class="screen">
                        <div class="screen-txt">SCREEN</div>
                    </div>
                    <div class="seatsChart col-lg-6">
                        <div class="exit">Exit</div>
                        </br>
                        <div class="exit2">Exit</div>
                        </br>
                        <div class="seatRow seat_selector_wrap" id="goldFullCount">
                            <div class="seatRowNumber">
                                Gold Full
                            </div>
                            <span class="left"> 
                                <div id="G1" title="" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G1</div>
                                <div id="G2" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G2</div>
                                <div id="G3" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G3</div>
                                <div id="G4" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G4</div>
                            <span>                                   
                            <span class="right">
                                <div id="G5" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G5</div>
                                <div id="G6" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">G6</div>
                                <div id="G7" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G7</div>
                                <div id="G8" role="checkbox" value="300" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">G8</div>
                            <span>
                        </div>
                        <div class="seatRow seat_selector_wrap"  id="goldHalfCount"> 
                            <div class="seatRowNumber">
                                Gold Half
                            </div>
                            <span class="left">
                                <div id="H1" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H1</div>
                                <div id="H2" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H2</div>
                                <div id="H3" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H3</div>
                                <div id="H4" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H4</div>
                            <span>
                            <span class="right">
                                <div id="H5" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H5</div>
                                <div id="H6" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">H6</div>
                                <div id="H7" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H7</div>
                                <div id="H8" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">H8</div>
                            <span>
                        </div>
                        <div class="seatRow seat_selector_wrap" id="odcFullCount">  
                            <div class="seatRowNumber">
                                ODC Full
                            </div>
                            <span class="left">
                                <div id="O1" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O1</div>
                                <div id="O2" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O2</div>
                                <div id="O3" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O3</div>
                                <div id="O4" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O4</div>
                            <span>    
                            <span class="right">
                                <div id="O5" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O5</div>
                                <div id="O6" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">O6</div>
                                <div id="O7" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O7</div>
                                <div id="O8" role="checkbox" value="200" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">O8</div>
                            <span>
                        </div>
                        <div class="seatRow seat_selector_wrap" id="odcHalfCount"> 
                            <div class="seatRowNumber">
                                ODC Half
                            </div>
                            <span class="left">
                                <div id="D1" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D1</div>
                                <div id="D2" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D2</div>
                                <div id="D3" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D3</div>
                                <div id="D4" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D4</div>
                            <span>    
                            <span class="right">
                                <div id="D5" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D5</div>
                                <div id="D6" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">D6</div>
                                <div id="D7" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D7</div>
                                <div id="D8" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">D8</div>
                            <span>
                        </div>
                        <div class="seatRow seat_selector_wrap"  id="boxCount"> 
                            <div class="seatRowNumber">
                                Box 
                            </div>
                            <span class="left box">
                                <div id="B1" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B1</div>
                                <div id="B2" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B2</div>
                                <div id="B3" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B3</div>
                                <div id="B4" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B4</div>
                            <span> 
                            <span class="right">
                                <div id="B5" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B5</div>
                                <div id="B6" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber  ">B6</div>
                                <div id="B7" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B7</div>
                                <div id="B8" role="checkbox" value="100" aria-checked="false" focusable="true" tabindex="-1" class=" seatNumber ">B8</div>
                            <span>
                        </div>
                    </div> 
                    <div class="seatsReceipt col-lg-2">
                        <p><strong>Selected Seats:</strong> <button id="btnClear" class="btn">Clear</button></p>
                        <ul id="seatsList" class="nav nav-stacked"></ul>
                        <ul  hidden id="seatsListHid" class="nav nav-stacked"></ul>
                    </div>
                </div>
                <div class="checkout col-lg-offset-6">  
                    <div id="ticket-actionss">
                        <button class="action highlight-background next btnCheckout " id="submitter">
                            <span>Check out</span>
                        </button>
                    </div>
                </div>
            </div> 
        </div>
        <script type="text/javascript" src="./js/seat.js"></script>
    </body>
</html>
