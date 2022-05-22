<cfcomponent  accessors="true" output="false">
    <cffunction name="insertShow" access="remote"  hint="add new show page"  output="yes"  returntype="any" returnformat="JSON">
        <cfargument name="userID" type="numeric"> 
        <cfargument name="theaterID" type="numeric">
        <cfargument name="movieID" type="numeric">
        <cfargument name="startDate" type="date">
        <cfargument name="endDate" type="date">
        <cfargument name="startTime" type="string">
        <cfargument name="endTime" type="string"> 
        <cfargument name="goldFull" type="float">
        <cfargument name="goldHalf" type="float">
        <cfargument name="odcFull" type="float"> 
        <cfargument name="odcHalf" type="float">
        <cfargument name="box" type="float">   
        <cfargument name="seats" type="numeric">
        <cfset variables.errorMessage= arrayNew(1) />
        <cfif arguments.theaterID EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter theater Name')>
        </cfif>	 
        <cfif arguments.movieID EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter movie Name')>
        </cfif>
        <cfif arguments.startDate EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter start Date')>
        </cfif>	
        <cfif arguments.endDate EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter end Date')>
        </cfif>
        <cfif arguments.startTime EQ ''>
            <cfset arrayAppend(errorMessage, 'Please  enter start Time')>
        </cfif>	
        <cfif arguments.endTime EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter  end Time')>
        </cfif>	
        <cfif arguments.goldFull EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter gold Full')>
        </cfif>
        <cfif arguments.goldHalf EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter  gold Half')>
        </cfif>
        <cfif arguments.odcFull EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter odc Full')>
        </cfif>
        <cfif arguments.odcHalf EQ ''>
            <cfset arrayAppend(errorMessage, 'Please  enter odc Half')>
        </cfif>
        <cfif arguments.box EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter  box')>
        </cfif>	
        <cfif arguments.seats EQ ''>
            <cfset arrayAppend(errorMessage, 'Please enter  seats')>
        </cfif>		  
        <cfif arrayIsEmpty(errorMessage)>	
            <cfif arguments.showID NEQ ''>
                <cfquery name = "updateShows"  result="res">  
                    update  shows
                    set    
                        theaterID = <cfqueryparam value = "#arguments.theaterID#" cfsqltype = "cf_sql_integer">,  
                        movieID = <cfqueryparam value = "#arguments.movieID#" cfsqltype = "cf_sql_integer">,  
                        startDate = <cfqueryparam value = "#arguments.startDate#" cfsqltype = "CF_SQL_DATE">, 
                        endDate = <cfqueryparam value = "#arguments.endDate#" cfsqltype = "CF_SQL_DATE">, 
                        startTime = <cfqueryparam value = "#arguments.startTime#" cfsqltype = "cf_sql_varchar">, 
                        endTime = <cfqueryparam value = "#arguments.endTime#" cfsqltype = "cf_sql_varchar">, 
                        goldFull = <cfqueryparam value = "#arguments.goldFull#" cfsqltype = "CF_SQL_FLOAT">, 
                        goldHalf = <cfqueryparam value = "#arguments.goldHalf#" cfsqltype = "CF_SQL_FLOAT">,
                        odcFull = <cfqueryparam value = "#arguments.odcFull#" cfsqltype = "CF_SQL_FLOAT">,
                        odcHalf = <cfqueryparam value = "#arguments.odcHalf#" cfsqltype = "CF_SQL_FLOAT">,
                        box = <cfqueryparam value = "#arguments.box#" cfsqltype = "CF_SQL_FLOAT">,
                        createdDate = #Now()#,
                        userID = <cfqueryparam value = "#arguments.userID#" cfsqltype = "cf_sql_integer">,
                        seats = <cfqueryparam value = "#arguments.seats#" cfsqltype = "cf_sql_integer">
                        where showID = <cfqueryparam value = "#arguments.showID#" cfsqltype = "cf_sql_integer"/>
                </cfquery>      	  
            <cfelse>
                <cfquery name = "insertShowDetails" result="res">  
                    insert into  shows(theaterID,movieID,startDate,endDate,startTime,endTime,goldFull,goldHalf,odcFull,
                    odcHalf,box,createdDate,userID,seats) 
                    values(
                        <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.theaterID#" />  
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.movieID#" />     
                        ,<cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.startDate#" />      
                        ,<cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.endDate#" />  
                        ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.startTime#" />     
                        ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.endTime#" />    
                        ,<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#arguments.goldFull#" />  
                        ,<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#arguments.goldHalf#" /> 
                        ,<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#arguments.odcFull#" />                       
                        ,<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#arguments.odcHalf#" /> 
                        ,<cfqueryparam cfsqltype="CF_SQL_FLOAT" value="#arguments.box#" /> 
                        ,#Now()#
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.seats#" />
                    )
                </cfquery> 
            </cfif> 
        <cfelse>
            <cfset Session.errormsg = errorMessage/>    
        </cfif>      
            <cfreturn variables.errorMessage />	
    </cffunction> 
    <cffunction name="getShows" hint="get Shows"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.showsList"> 
            SELECT shows.*,theaters.fld_theaterName,movies.fld_moviename
            FROM shows as shows
            LEFT JOIN  theaters as theaters
            ON shows.theaterID = theaters.theaterID
            LEFT JOIN movies as movies
            ON shows.movieID  = movies.movieID 
            where shows.userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"> ORDER BY shows.showID desc
        </cfquery>
        <cfreturn qry.showsList/>  
    </cffunction> 
    <cffunction name="deleteShows" access="remote" returntype="struct" hint="delete Shows" returnformat="json"  output="false">
        <cfargument name="showID" type="any" required="true">		     
            <cfquery name="deleteDet" result="deleteResult">
                delete from shows  where showID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.showID#">
            </cfquery>
            <cfset variables.cfcResults = deleteResult.recordcount> 
            <cfif  variables.cfcResults NEQ 0>
                <cfset variables.Response.Success = true />   
            <cfelse> 
                <cfset variables.Response.Success = false />            
            </cfif>
            <cfreturn variables.Response>
    </cffunction>   
    <cffunction name="getShowByID" access="remote"  output="false" hint="get show by id" returntype="any" returnformat="JSON" >   	 
        <cfargument name="showID" type="numeric" required="yes" > 
        <cfset variables.retVal = ArrayNew(1)>
            <cfquery name = "showDetails">  
                SELECT *
                FROM shows
                where showID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.showID#">
            </cfquery>
            <cfloop query="showDetails"> 
                <cfset variables.temp = {} />
                <cfset variables.temp['theaterID']=showDetails.theaterID />
                <cfset variables.temp['showID']=showDetails.showID />
                <cfset variables.temp['movieID']=showDetails.movieID />
                <cfset variables.temp['startDate']=showDetails.startDate />
                <cfset variables.temp['endDate']=showDetails.endDate />
                <cfset variables.temp['startTime']=showDetails.startTime />
                <cfset variables.temp['endTime']=showDetails.endTime />
                <cfset variables.temp['goldFull']=showDetails.goldFull />
                <cfset variables.temp['goldHalf']=showDetails.goldHalf />
                <cfset variables.temp['odcFull']=showDetails.odcFull />
                <cfset variables.temp['odcHalf']=showDetails.odcHalf />
                <cfset variables.temp['box']=showDetails.box /> 
                <cfset variables.temp['seats']=showDetails.seats /> 
                <cfset ArrayAppend(retval, temp)>
            </cfloop>
            <cfset variables.result = {} />
            <cfset variables.result['items'] = retVal />
        <cfreturn variables.result> 
    </cffunction>  
    <cffunction name="gettheatreList" hint="get theatre"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.gettheatre"> 
            SELECT theaterID,fld_theaterName 
            FROM theaters
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn qry.gettheatre/>   
    </cffunction> 
    <cffunction name="getmovieList" hint="get movie"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.getmovie"> 
            SELECT movieID,fld_moviename 
            FROM movies
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn qry.getmovie/>  
    </cffunction> 
</cfcomponent>      