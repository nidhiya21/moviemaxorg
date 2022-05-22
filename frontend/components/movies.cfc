<cfcomponent  accessors="true" output="false">
    <cffunction name="getHomeMovies" hint="get home movies"  access="public" output="false" >	 
        <cfquery name = "qry.moviesList"> 
            SELECT shows.movieID,shows.startDate,movies.*
            FROM shows as shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            where movies.displayHome="yes"   and shows.endDate >= CURDATE() ORDER BY shows.endDate
        </cfquery>
        <cfreturn qry.moviesList/>  
    </cffunction> 
    <cffunction name="getMoviesById" hint="get movie details"  access="public" output="false" >	 
        <cfargument name="movieID" type="numeric" required="yes" >
        <cfquery name = "qry.moviesDet" > 
            SELECT shows.movieID,shows.startDate,movies.*
            FROM shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            where shows.movieID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.movieID#">
        </cfquery>
        <cfreturn qry.moviesDet/>  
    </cffunction> 
    <cffunction name="getUpcomingMovies" hint="get upcoming movies"  access="public" output="false" >	 
        <cfquery name = "qry.moviesList"> 
            SELECT shows.movieID,shows.startDate,movies.*
            FROM shows as shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            where shows.startDate >= CURDATE() ORDER BY shows.startDate   
        </cfquery>
        <cfreturn qry.moviesList/>  
    </cffunction> 
    <cffunction name="getUserDetails" hint="get user details"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.userDet" > 
            SELECT *
            FROM user
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#">
        </cfquery>
        <cfreturn qry.userDet/>  
    </cffunction> 
    <cffunction name="updateProfile" access="remote" hint="update profile" output="false" >	
        <cfargument name="password" type="string" required="yes" > 
        <cfset variables.errorMessage= arrayNew(1) />
        <cfif arguments.password EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter password')>
        </cfif>
        <cfif arrayIsEmpty(errorMessage)>
            <cfquery name = "qry.updateProfile" result="res">   
                update user 
                set   
                emailID= <cfqueryparam value = "#trim(form.emailID)#" cfsqltype = "cf_sql_varchar">,
                password= <cfqueryparam value = "#hash(arguments.password)#" cfsqltype = "cf_sql_varchar">, 
                phoneNumber= <cfqueryparam value = "#trim(form.phoneNumber)#" cfsqltype = "CF_SQL_BIGINT">, 
                userName= <cfqueryparam value = "#trim(form.userName)#" cfsqltype = "cf_sql_varchar">
                where userID= <cfqueryparam value = "#session.stLoggedInFrUser.userID#" cfsqltype = "cf_sql_integer">
            </cfquery> 	
            <cfset arrayAppend(errorMessage, 'Profile updated successfully')>       
        <cfelse> 
            <cfset Session.errormsg = errorMessage/>     
        </cfif> 
        <cflocation url = "../account.cfm" addToken = "no">	    	
	</cffunction>
    <cffunction name="getMoviesList" hint="get movie list"  access="remote" output="false"  returntype="any" returnformat="JSON">	 
        <cfargument name="dateVal" type="any" required="yes" >
        <cfset variables.retVal = ArrayNew(1)>
        <cfquery name = "moviesDet" > 
            SELECT shows.*,movies.*,theaters.fld_theaterName,theaters.theaterID
            FROM shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            LEFT JOIN theaters as theaters
            ON shows.theaterID   = theaters.theaterID  
            where
            shows.startDate <= <cfqueryparam cfsqltype="cf_sql_date" value = "#arguments.dateVal#">
            AND shows.endDate >= <cfqueryparam cfsqltype="cf_sql_date" value = "#arguments.dateVal#">; 
        </cfquery>
        <cfloop query="moviesDet"> 
            <cfset variables.temp = {} />
            <cfset variables.temp['fld_theaterName'] = moviesDet.fld_theaterName />
            <cfset variables.temp['fld_moviename'] = moviesDet.fld_moviename />
            <cfset variables.temp['fld_details'] = moviesDet.fld_details />
            <cfset variables.temp['fld_cast'] = moviesDet.fld_cast />
            <cfset variables.temp['fld_poster'] = moviesDet.fld_poster />
            <cfset variables.temp['startTime'] = moviesDet.startTime />
            <cfset variables.temp['movieID'] = moviesDet.movieID />
            <cfset ArrayAppend(retval, temp)>
        </cfloop>
        <cfset variables.result = {} />
        <cfset variables.result['items'] = retVal /> 
        <cfreturn variables.result/>  
    </cffunction> 
    <cffunction name="getTheaterList" hint="get Theater list"  access="remote" output="false"  returntype="any" returnformat="JSON">	 
        <cfargument name="dateVal" type="any" required="yes" >
        <cfargument name="movieID" type="numeric" required="yes" >
        <cfset variables.retVal = ArrayNew(1)>
        <cfquery name = "theaterDet" > 
            SELECT shows.*,movies.*,theaters.fld_theaterName,theaters.theaterID,theaters.fld_theaterImage
            FROM shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            LEFT JOIN theaters as theaters
            ON shows.theaterID   = theaters.theaterID  
            where
            shows.movieID=<cfqueryparam cfsqltype="cf_sql_integer" value= "#arguments.movieID#">
            AND shows.startDate <= <cfqueryparam cfsqltype="cf_sql_date" value= "#arguments.dateVal#">
            AND shows.endDate >= <cfqueryparam cfsqltype="cf_sql_date" value= "#arguments.dateVal#">; 
        </cfquery> 
        <cfloop query="theaterDet"> 
            <cfset variables.temp = {} />
            <cfset variables.temp['fld_theaterName'] = theaterDet.fld_theaterName />
            <cfset variables.temp['fld_theaterImage'] = theaterDet.fld_theaterImage /> 
            <cfset variables.temp['startTime'] = theaterDet.startTime /> 
            <cfset variables.temp['movieID'] = theaterDet.movieID />
            <cfset variables.temp['theaterID'] = theaterDet.theaterID />
            <cfset variables.temp['showID'] = theaterDet.showID />
            <cfset ArrayAppend(retval, temp)>
        </cfloop>
        <cfset variables.result = {} />
        <cfset variables.result['items'] = retVal />
        <cfreturn variables.result/>  
    </cffunction> 
    <cffunction name="getTheaterByID" access="remote"  output="false" hint="get theater by id" returntype="any" returnformat="JSON" >   	 
        <cfargument name="theaterID" type="numeric" required="yes" > 
            <cfquery name = "qry.theaterDetails">  
                SELECT fld_theaterName
                FROM theaters
                where theaterID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.theaterID#">
            </cfquery>
        <cfreturn qry.theaterDetails>  
    </cffunction> 
    <cffunction name="insertBooking" access="remote"  hint="add booking"  returntype="struct" returnformat="json" output="false">
        <cfargument name="userID" ype="numeric"> 
        <cfargument name="theaterID" type="numeric">
        <cfargument name="movieID" type="numeric">
        <cfargument name="showID" type="numeric">
        <cfargument name="bookedDate" type="string">
        <cfargument name="bookedTime" type="string">
        <cfargument name="goldFullCount" type="string">
        <cfargument name="goldHalfCount" type="string">
        <cfargument name="odcFullCount" type="string">
        <cfargument name="odcHalfCount" type="string">
        <cfargument name="boxCount" type="string">
        <cfargument name="orderAmount" type="string">         
            <cfquery name = "insertBooking" result="pageResult">  
                insert into cart(userID,showID,theaterID,movieID,bookedDate,bookedTime,goldFullCount,goldHalfCount,odcFullCount,odcHalfCount,boxCount,createdDate,orderAmount,paymentStatus,seats)
                values(
                <cfqueryparam cfsqltype ="cf_sql_integer"  value="#arguments.userID#" />
                ,<cfqueryparam cfsqltype ="cf_sql_integer" value="#arguments.showID#" />
                ,<cfqueryparam cfsqltype ="cf_sql_integer" value="#arguments.theaterID#" />
                ,<cfqueryparam cfsqltype ="cf_sql_integer" value="#arguments.movieID#" />
                ,<cfqueryparam cfsqltype ="cf_sql_date"    value="#arguments.bookedDate#" />
                ,<cfqueryparam cfsqltype ="cf_sql_varchar" value="#arguments.bookedTime#" />
                ,<cfqueryparam cfsqltype ="cf_sql_varchar" value="#arguments.goldFullCount#" />
                ,<cfqueryparam cfsqltype ="cf_sql_varchar" value="#arguments.goldHalfCount#" />
                ,<cfqueryparam cfsqltype ="cf_sql_varchar" value="#arguments.odcFullCount#" />
                ,<cfqueryparam cfsqltype ="cf_sql_varchar" value="#arguments.odcHalfCount#" />
                ,<cfqueryparam cfsqltype ="cf_sql_varchar" value="#arguments.boxCount#" />
                ,#Now()#
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.orderAmount#"/>
                ,"Success" 
                ,"" 
                ) 
            </cfquery>
            <cfset variables.getNumberOfRecords = #pageResult.generated_key#>   
            <cfset session.cart = {'cart'=true, 'cartID' = getNumberOfRecords,'showID' = #arguments.showID#,
                                   'userID' = #session.stLoggedInFrUser.userID#} />
            <cfset variables.Response.Success = true />
            <cfreturn variables.Response />   
    </cffunction> 
    <cffunction name="getCartDetails" hint="get cart details"  access="public" output="false" >	 
        <cfargument name="cartID" type="numeric" required="yes" >
        <cfquery name = "qry.cartDet" result="pageResult" > 
            SELECT cart.*,user.userName,user.emailID,user.phoneNumber
            FROM cart as cart
            LEFT JOIN user as user
            ON cart.userID   = user.userID  
            where cart.cartID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cartID#">
        </cfquery>
        <cfreturn qry.cartDet/>  
    </cffunction> 
    <cffunction name="insertPayment" access="remote"  hint="add payment"  returntype="struct" returnformat="json" output="false"> 
        <cfargument name="nameOnCard" ype="string">
        <cfargument name="creditCardNumber" type="any"> 
        <cfargument name="expiryDate" type="string">
        <cfargument name="securityCode" type="numeric">
        <cfargument name="zipCode" type="numeric">
            <cfset variables.errorMessage= arrayNew(1) />
            <cfif trim(arguments.nameOnCard) EQ ''>
                <cfset arrayAppend(errorMessage, 'Please Enter Name')>
            </cfif>
            <cfif arrayIsEmpty(errorMessage)>	
                <cfquery name = "insertPayment" result="pageResult">  
                    insert into payment(cartID,userID,nameOnCard,creditCardNumber,expiryDate,securityCode,zipCode,orderStatus,createdDate)
                    values(
                    <cfqueryparam cfsqltype="cf_sql_integer" value="#session.cart.cartID#" />
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value ="#session.stLoggedInFrUser.userID#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.nameOnCard#" />
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.creditCardNumber#" />
                    ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.expiryDate#" />
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.securityCode#" />
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.zipCode#" /> 
                    ,"Success" 
                    ,#Now()#
                    )  
                </cfquery>  
            <cfelse>  
                <cfset session.errormsg = errorMessage />
            </cfif>    
            <cfreturn session.errormsg />    
    </cffunction> 
    <cffunction name="getPaymentDetails" hint="get payment details"  access="public" output="false" >	 
        <cfargument name="cartID" type="numeric" required="yes" >
        <cfquery name = "qry.paymentDet" result="pageResult" > 
            SELECT cart.*,payment.nameOnCard,movies.fld_moviename,user.userName,user.emailID,user.phoneNumber,theaters.fld_theaterName 
            FROM cart as cart
            LEFT JOIN payment as payment 
            ON cart.cartID  = payment.cartID 
            LEFT JOIN user as user
            ON cart.userID   = user.userID  
            LEFT JOIN movies as movies
            ON cart.movieID  = movies.movieID 
            LEFT JOIN theaters as theaters
            ON cart.theaterID  = theaters.theaterID  
            where cart.cartID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cartID#">  GROUP BY cart.cartID 
        </cfquery>
        <cfreturn qry.paymentDet/>  
    </cffunction> 
     <cffunction name="getOrderDetails" hint="get order details"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.orderDet" result="pageResult" > 
            SELECT cart.*,payment.nameOnCard,movies.fld_moviename,user.userName,user.phoneNumber,theaters.fld_theaterName 
            FROM cart as cart
            LEFT JOIN payment as payment
            ON cart.cartID  = payment.cartID 
            LEFT JOIN user as user
            ON cart.userID   = user.userID  
            LEFT JOIN movies as movies
            ON cart.movieID  = movies.movieID 
            LEFT JOIN theaters as theaters
            ON cart.theaterID  = theaters.theaterID 
            where cart.userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"> AND payment.orderStatus ="Success"  AND cart.paymentStatus ="Success"  GROUP BY cart.cartID ORDER BY cart.cartID DESC
        </cfquery>
        <cfreturn qry.orderDet/>  
    </cffunction> 
    <cffunction name="getPlayingMovies" hint="get now playing movies"  access="public" output="false" >	 
        <cfquery name = "qry.moviesList"> 
            SELECT shows.movieID,shows.startDate,movies.*
            FROM shows as shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            where shows.endDate >= CURDATE() GROUP BY shows.movieID ORDER BY shows.startDate   
        </cfquery>
        <cfreturn qry.moviesList/>  
    </cffunction> 
    <cffunction name="insertSeat" access="remote" hint="update seats " returntype="struct" returnformat="json" output="false" >
       <cfargument name="seats" type="string"  >	
        <cfquery name = "insertSeat" result="res">  
            update cart 
            set   
            seats= <cfqueryparam value="#arguments.seats#"  cfsqltype = "cf_sql_varchar">
            where cartID= <cfqueryparam value = "#session.cart.cartID#" cfsqltype = "cf_sql_integer">
        </cfquery> 
        <cfset variables.Response.Success = true />
        <cfreturn variables.Response />
	</cffunction>
    <cffunction name="selectBookedSeat" hint="get seat details"  access="remote"  returntype="any" returnformat="JSON" output="false" >	 
        <cfargument name="showID" type="numeric" required="yes" >
        <cfargument name="bookedDate" type="string">
        <cfargument name="bookedTime" type="string" >
        <cfset variables.retVal = ArrayNew(1)>
        <cfquery name = "seatDet" result="pageResult" > 
            SELECT GROUP_CONCAT(seats) as seats
            FROM cart
            LEFT JOIN payment as payment
            ON cart.cartID  = payment.cartID 
            where cart.showID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.showID#">
            AND cart.bookedDate = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bookedDate#">
            AND cart.bookedTime = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.bookedTime#">
            AND payment.orderStatus ="Success"
        </cfquery>
        <cfloop query="seatDet"> 
            <cfset variables.temp = {} />
            <cfset variables.temp['seats']=seatDet.seats /> 
            <cfset ArrayAppend(retval, temp)>
        </cfloop>
        <cfset variables.result = {} />
        <cfset variables.result['items'] = retVal />
        <cfreturn variables.result/> 
    </cffunction> 
    <cffunction name="getMoviesListByTitle" hint="get now playing movies"  access="remote" output="false"  returntype="any" returnformat="JSON" >	 
        <cfset variables.retVal = ArrayNew(1)>
        <cfquery name = "moviesList"> 
            SELECT shows.movieID,shows.startDate,shows.startTime,movies.*,theaters.fld_theaterName,theaters.theaterID 
            FROM shows as shows
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            LEFT JOIN theaters as theaters
            ON shows.theaterID   = theaters.theaterID  
            where shows.endDate >= CURDATE() ORDER BY movies.fld_moviename ASC     
        </cfquery>
        <cfloop query="moviesList"> 
            <cfset variables.temp = {} /> 
            <cfset variables.temp['fld_theaterName'] = moviesList.fld_theaterName />
            <cfset variables.temp['fld_moviename'] = moviesList.fld_moviename />
            <cfset variables.temp['fld_details'] = moviesList.fld_details />
            <cfset variables.temp['fld_cast'] = moviesList.fld_cast />
            <cfset variables.temp['fld_poster'] = moviesList.fld_poster />
            <cfset variables.temp['startTime'] = moviesList.startTime />
            <cfset variables.temp['movieID'] = moviesList.movieID />
            <cfset ArrayAppend(retval, temp)>
        </cfloop>
        <cfset variables.result = {} />
        <cfset variables.result['items'] = retVal />
        <cfreturn variables.result/>  
    </cffunction> 
    <cffunction name="getTheaters" hint="get theater"  access="public" output="false" >	 
        <cfquery name = "qry.theaterList"> 
            SELECT *
            FROM theaters
            where 1
        </cfquery>
        <cfreturn qry.theaterList/>  
    </cffunction> 
     <cffunction name="selectAvailSeat" hint="get seat available details"  access="remote"  returntype="any" returnformat="JSON" output="false" >	 
        <cfargument name="cartID" type="numeric" required="yes" >
        <cfset variables.retVal = ArrayNew(1)>
        <cfquery name = "seatDet" result="pageResult" > 
            SELECT * 
            FROM cart
            where cartID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cartID#"> AND paymentStatus ="Success"
        </cfquery>
        <cfloop query="seatDet"> 
            <cfset variables.temp = {} />
            <cfset variables.temp['goldFullCount'] = seatDet.goldFullCount />  
            <cfset variables.temp['goldHalfCount'] = seatDet.goldHalfCount /> 
            <cfset variables.temp['odcFullCount'] = seatDet.odcFullCount /> 
            <cfset variables.temp['odcHalfCount'] = seatDet.odcHalfCount /> 
            <cfset variables.temp['boxCount'] = seatDet.boxCount />  
            <cfset ArrayAppend(retval, temp)>
        </cfloop>
        <cfset variables.result = {} />
        <cfset variables.result['items'] = retVal />
        <cfreturn variables.result/> 
    </cffunction> 
    <cffunction name="sendMessageWithTwilio" output="false" access="public" returnType="string" hint="order success sms">
        <cfargument name="aMessage" type="string" required="true" />
        <cfargument name="destinationNumber" type="string" required="true" />  
        <cfset variables.twilioAccountSid =  "AC166f0034dccf016f80268b7cfe5b0318" />
        <cfset variables.twilioAuthToken =  "dd5d0232e811773dacd33cb7d8a78f93" /> 
        <cfset variables.twilioPhoneNumber =  "+19804092167" /> 	
        <cfhttp  
            result="result" 
            method="POST" 
            charset="utf-8" 
            url="https://api.twilio.com/2010-04-01/Accounts/#twilioAccountSid#/Messages.json"
            username="#twilioAccountSid#" 
            password="#twilioAuthToken#" >
            <cfhttpparam name="From" type="formfield" value="#twilioPhoneNumber#" />
            <cfhttpparam name="Body" type="formfield" value="#arguments.aMessage#" />
            <cfhttpparam name="To" type="formfield" value="#arguments.destinationNumber#" />
        </cfhttp>
        <cfif result.Statuscode IS "201 CREATED">
            <cfreturn deserializeJSON(result.Filecontent.toString()).sid />
        <cfelse>
            <cfreturn result.Statuscode />
        </cfif>
    </cffunction>
</cfcomponent>     
