<cfcomponent  accessors="true" output="false">
    <cffunction name="insertMovie" access="remote"  hint="add new Movie page" returntype="struct" returnformat="json" output="false">
        <cfargument name="userID" type="numeric">
        <cfargument name="fld_moviename" type="string">
        <cfargument name="fld_poster" type="string">
        <cfargument name="fld_details" type="string">
        <cfargument name="fld_cast" type="string">
        <cfargument name="fld_facts" type="string">
        <cfargument name="fld_link" type="string">
        <cfargument name="fld_ratings" type="string">
        <cfargument name="old_img" type="string">
        <cfset variables.errorMessage= arrayNew(1) />
        <cfif trim(arguments.fld_moviename) EQ ''>
            <cfset arrayAppend(errorMessage, 'Please Enter Name')>
        </cfif>	
        <cfif arguments.fld_poster NEQ ''>        
            <cfset variables.validMimeTypes =  {
                                            'image/jpeg': {extension: 'jpg'}
                                            ,'image/png': {extension: 'png'},'image/jpg': {extension: 'jpg'}
                                            } />
            <cfset variables.thisPath=expandPath('..') & '/movies/' /> 
            <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
            <cftry>
                <cffile action="upload" filefield="fld_poster" destination="#variables.f_dir#" mode="777"
                    accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                    nameconflict="makeunique">
                    <cfset variables.poster = #uploadResult.serverFile#>
                <cfcatch type="any">
                    <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                        <cfset arrayAppend(errorMessage, 'Zero length file')>
                    <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                        <cfset arrayAppend(errorMessage, 'Invalid file type')>
                    <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                        <cfset arrayAppend(errorMessage, 'Empty form field')>
                    <cfelse>
                        <cfset arrayAppend(errorMessage, 'Unhandled File Upload Error')>
                    </cfif> 
                </cfcatch> 
            </cftry>
        <cfelse>
            <cfset variables.poster = #arguments.old_img#>    	
        </cfif>	   
        <cfif arrayIsEmpty(errorMessage)>	
            <cfif arguments.movieID NEQ ''>
                <cfquery name = "updateMovies"  result="res">  
                    update  movies
                    set    
                        fld_moviename = <cfqueryparam value = "#arguments.fld_moviename#" cfsqltype = "cf_sql_varchar">,  
                        fld_poster = <cfqueryparam value = "#variables.poster#" cfsqltype = "cf_sql_varchar">,  
                        fld_details = <cfqueryparam value = "#arguments.fld_details#" cfsqltype = "cf_sql_longvarchar">, 
                        fld_cast = <cfqueryparam value = "#arguments.fld_cast#" cfsqltype = "cf_sql_longvarchar">, 
                        fld_facts = <cfqueryparam value = "#arguments.fld_facts#" cfsqltype = "cf_sql_longvarchar">, 
                        fld_link = <cfqueryparam value = "#arguments.fld_link#" cfsqltype = "cf_sql_varchar">, 
                        fld_ratings = <cfqueryparam value = "#arguments.fld_ratings#" cfsqltype = "cf_sql_integer">, 
                        createdDate = #Now()#,
                        userID = <cfqueryparam value = "#arguments.userID#" cfsqltype = "cf_sql_integer">,
                        displayHome = "No"
                        where movieID = <cfqueryparam value = "#arguments.movieID#" cfsqltype = "cf_sql_integer"/>
                </cfquery> 
                <cfset variables.Response.Success = true />     	  
            <cfelse>
                <cfquery name = "insertMoviesDetails" result="res">  
                    insert into  movies(fld_moviename,fld_poster,fld_details,fld_cast,fld_facts,fld_link,fld_ratings,createdDate,userID,displayHome) 
                    values(
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fld_moviename#" />  
                        ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.poster#" />   
                        ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.fld_details#" />      
                        ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.fld_cast#" />  
                        ,<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.fld_facts#" />     
                        ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fld_link#" />    
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.fld_ratings#" />                        
                        ,#Now()#
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
                        ,"No"
                    )
                </cfquery> 
                <cfset variables.Response.Success = true />
            </cfif>
        <cfelse>
            <cfset Session.errormsg = errorMessage/>   
        </cfif>  
        <cfreturn variables.Response />
    </cffunction> 
    <cffunction name="getMovies" hint="get movies"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.moviesList"> 
            SELECT *
            FROM movies
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   > ORDER BY movies.movieID desc
        </cfquery>
        <cfreturn qry.moviesList/>  
    </cffunction> 
    <cffunction name="deleteMovies" access="remote" returntype="struct" hint="delete Movie" returnformat="json"  output="false">
        <cfargument name="movieID" type="any" required="true">		     
            <cfquery name="deleteDet" result="deleteResult">
                delete from movies  where movieID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.movieID#">
            </cfquery>
            <cfset variables.cfcResults = deleteResult.recordcount>
            <cfif  variables.cfcResults NEQ 0>
                <cfset variables.Response.Success = true />    
            <cfelse> 
                <cfset variables.Response.Success = false />            
            </cfif>
            <cfreturn variables.Response>
    </cffunction>   
    <cffunction name="getMovieByID" access="remote"  output="false" hint="get movies by id" returntype="any" returnformat="JSON" >   	 
        <cfargument name="movieID" type="numeric" required="yes" > 
        <cfset variables.retVal = ArrayNew(1)>
            <cfquery name = "movieDetails">  
                SELECT *
                FROM movies
                where movieID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.movieID#">
            </cfquery>
            <cfloop query="movieDetails"> 
                <cfset variables.temp = {} />
                <cfset variables.temp['fld_moviename']=movieDetails.fld_moviename />
                <cfset variables.temp['movieID']=movieDetails.movieID />
                <cfset variables.temp['fld_poster']=movieDetails.fld_poster />
                <cfset variables.temp['fld_details']=movieDetails.fld_details />
                <cfset variables.temp['fld_cast']=movieDetails.fld_cast />
                <cfset variables.temp['fld_facts']=movieDetails.fld_facts />
                <cfset variables.temp['fld_link']=movieDetails.fld_link />
                <cfset variables.temp['fld_ratings']=movieDetails.fld_ratings />
                <cfset ArrayAppend(retval, temp)>
            </cfloop>
            <cfset variables.result = {} />
            <cfset variables.result['items'] = retVal />
            <cfreturn variables.result> 
    </cffunction>
    <cffunction name="activateMovies" access="remote" returntype="struct" hint="activate Movie" returnformat="json"  output="false">
        <cfargument name="movieID" type="any" required="true">		
        <cfargument name="status" type="any" required="true">		       
            <cfquery name="updateStatus" result="upResult">
                UPDATE movies 
                SET displayHome  = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.status#">
                WHERE movieID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.movieID#">
            </cfquery>
            <cfset variables.Response.Success = true />   
            <cfreturn variables.Response>
    </cffunction>
    <cffunction name="getMoviesCounts" hint="get movies Count"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.getMoviesCount"> 
            SELECT COUNT(*) as cnt
            FROM movies
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn qry.getMoviesCount/>  
    </cffunction> 
    <cffunction name="getTeaterCounts" hint="get Teater Count"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.getTeaterCount"> 
            SELECT COUNT(*) as cnt
            FROM theaters
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"   >
        </cfquery>
        <cfreturn qry.getTeaterCount/>  
    </cffunction>  
    <cffunction name="getUserCounts" hint="get User Count"  access="public" output="false" >	 
        <cfquery name = "qry.getUserCount"> 
            SELECT COUNT(*) as cnt
            FROM user
        </cfquery>
        <cfreturn qry.getUserCount/>  
    </cffunction>  
    <cffunction name="getBookingCountS" hint="get booking Count"  access="public" output="false" >	 
        <cfquery name = "qry.getBookingCountS"> 
            SELECT COUNT(*) as cnt
            FROM cart
        </cfquery>
        <cfreturn qry.getBookingCountS/>  
    </cffunction>  
</cfcomponent>     
