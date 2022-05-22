<cfcomponent accessors = "yes" >
    <cffunction name="insertTheater" access="remote"  hint="add new theater page"  output="false"  returntype="struct"  returnformat="JSON">
        <cfargument name="userID" ype="numeric">
        <cfargument name="fld_theaterName" type="string">
        <cfargument name="fld_theaterImage" type="string">
        <cfargument name="old_img" type="string">
        <cfargument name="theaterID" ype="numeric">
        <cfset variables.errorMessage= arrayNew(1) />
        <cfif trim(arguments.fld_theaterName) EQ ''> 
            <cfset arrayAppend(errorMessage, 'Please Enter Name')> 
        </cfif>	
        <cfif arguments.fld_theaterImage NEQ ''> 
            <cfset variables.validMimeTypes =  {
                                            'image/jpeg': {extension: 'jpg'}
                                            ,'image/png': {extension: 'png'},'image/jpg': {extension: 'jpg'}
                                            } />
            <cfset variables.thisPath=expandPath('..') & '/img/theaterimages/' />
            <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
            <cftry>
                <cffile action="upload" filefield="fld_theaterImage" destination="#variables.f_dir#" mode="777"
                    accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                    nameconflict="makeunique">
                    <cfset variables.theaterImage = #uploadResult.serverFile#>
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
            <cfset variables.theaterImage = #arguments.old_img#>    	
        </cfif>	   
        <cfif arrayIsEmpty(errorMessage)>	
            <cfif arguments.theaterID NEQ ''>
                <cfquery name = "updateTheater"  result="res"> 
                    update  theaters
                    set    
                        fld_theaterName = <cfqueryparam value = "#arguments.fld_theaterName#" cfsqltype = "cf_sql_varchar">,  
                        fld_theaterImage = <cfqueryparam value = "#variables.theaterImage#" cfsqltype = "cf_sql_varchar">,  
                        createdDate = #Now()#,
                        userID = <cfqueryparam value = "#arguments.userID#" cfsqltype = "cf_sql_integer">
                        where theaterID = <cfqueryparam value = "#arguments.theaterID#" cfsqltype = "cf_sql_integer"/>
                </cfquery>  
                <cfset variables.Response.Success = true />       	  
            <cfelse>
                <cfquery name = "insertTheaterDetails" result="res">  
                    insert into  theaters(fld_theaterName,fld_theaterImage,createdDate,userID) 
                    values(
                        <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fld_theaterName#" />  
                        ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.theaterImage#" />             
                        ,#Now()#
                        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#" />
                    )
                </cfquery> 
                <cfset variables.Response.Success = true />    
            </cfif> 
        <cfelse>
                <cfset Session.errormsg = errorMessage/>  
        </cfif> 
        <cfreturn variables.Response />	  
    </cffunction> 
    <cffunction name="getTheaters" hint="get theater"  access="public" output="false" >	 
        <cfargument name="userID" type="numeric" required="yes" >
        <cfquery name = "qry.theaterList"> 
            SELECT *
            FROM theaters
            where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#"> ORDER BY theaters.theaterID desc
        </cfquery>
        <cfreturn qry.theaterList/>  
    </cffunction> 
    <cffunction name="deleteTheater" access="remote" returntype="struct" hint="delete Theater" returnformat="json"  output="false">
        <cfargument name="theaterID" type="any" required="true">		     
            <cfquery name="deleteDet" result="deleteResult">
                delete from theaters  where theaterID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.theaterID#">
            </cfquery>
            <cfset variables.cfcResults = deleteResult.recordcount>
            <cfif  variables.cfcResults NEQ 0>
                <cfset variables.Response.Success = true />   
            <cfelse> 
                <cfset variables.Response.Success = false />            
            </cfif>
            <cfreturn variables.Response>
    </cffunction>   
    <cffunction name="getTheaterByID" access="remote"  output="false" hint="get theater by id" returntype="any" returnformat="JSON" >   	 
        <cfargument name="theaterID" type="numeric" required="yes" > 
        <cfset variables.retVal = ArrayNew(1)>
            <cfquery name = "theaterDetails">  
                SELECT *
                FROM theaters
                where theaterID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.theaterID#">
            </cfquery>
            <cfloop query="theaterDetails"> 
                <cfset variables.temp = {} />
                <cfset variables.temp['fld_theaterName']=theaterDetails.fld_theaterName />
                <cfset variables.temp['theaterID']=theaterDetails.theaterID />
                <cfset variables.temp['fld_theaterImage']=theaterDetails.fld_theaterImage />
                <cfset ArrayAppend(retval, temp)>
            </cfloop>
            <cfset variables.result = {} />
            <cfset variables.result['items'] = retVal />
            <cfreturn variables.result> 
    </cffunction> 
    <cffunction name="getUsers" hint="get Users"  access="public" output="false" >	 
        <cfquery name = "qry.userList"> 
            SELECT *
            FROM user 
        </cfquery>
        <cfreturn qry.userList/>  
    </cffunction>
    <cffunction name="deleteUser" access="remote" returntype="struct" hint="delete user" returnformat="json"  output="false">
        <cfargument name="userID" type="any" required="true">		     
            <cfquery name="deleteDet" result="deleteResult">
                delete from user  where userID=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userID#">
            </cfquery>
            <cfset variables.cfcResults = deleteResult.recordcount>
            <cfif  variables.cfcResults NEQ 0>
                <cfset variables.Response.Success = true />   
            <cfelse> 
                <cfset variables.Response.Success = false />            
            </cfif>
            <cfreturn variables.Response>
    </cffunction>  
    <cffunction name="getOrderDetails" hint="get order details"  access="public" output="false" >	 
        <cfquery name = "qry.orderDet" result="pageResult" > 
            SELECT cart.*,payment.nameOnCard,movies.fld_moviename,user.userName,theaters.fld_theaterName 
            FROM cart as cart
            LEFT JOIN payment as payment
            ON cart.cartID  = payment.cartID 
            LEFT JOIN user as user
            ON cart.userID   = user.userID  
            LEFT JOIN movies as movies
            ON cart.movieID  = movies.movieID 
            LEFT JOIN theaters as theaters
            ON cart.theaterID  = theaters.theaterID 
            where 1 ORDER BY payment.paymentID DESC;
        </cfquery>
        <cfreturn qry.orderDet/>  
    </cffunction>    
</cfcomponent>     