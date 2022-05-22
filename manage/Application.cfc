<cfcomponent output="false">
    <cfset this.name = 'CF Online Movie Booking'/>
	<cfset this.datasource = 'cf_task_employee'/>  
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />    
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />  
	<cfset this.clientManagement = true>
	<cfset this.setClientCookies = true /> 
	<cfset this.ormenabled = "true">
	<cfset this.ormsettings={datasource="cf_task_employee", logsql="true"}>
	<cfset This.scriptProtect="all"/> 
	<cffunction name="onApplicationStart" returntype="boolean" >		
		<cfreturn true />
	</cffunction>
	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />	 
		<cfif structKeyExists(URL,'logout')>
			<cfset structdelete(session,'stLoggedInUser') />			
		</cfif>	
		<cfset variables.whiteList = "booking.cfm,home.cfm,index.cfm,movies.cfm,password.cfm,users.cfm,times.cfm,theaters-list.cfm">   
		<cfif ListContains(variables.whiteList, GetFileFromPath(CGI.CF_TEMPLATE_PATH)) AND session.stLoggedInUser.loggedin EQ false >
			<cflocation url = "./login.cfm" addtoken="false" />  
		</cfif>
		<cfreturn true />
	</cffunction>
	<cffunction name="onSessionStart" access="public" output="false" returntype="void">
     	<cflock timeout=20 scope="Session" type="Exclusive">      
			<cfset session.stLoggedInUser = {'loggedin'=false,'emailID' = '',
			'userID' = 0} />   
     	</cflock> 
	</cffunction>
	<cffunction name="onError">  
		<cfargument name="Exception" required=true/> 
		<cfargument type="String" name="EventName" required=true/> 
		<!--- Log all errors. ---> 
		<cflog file="#This.Name#" type="error"  
				text="Event Name: #Arguments.Eventname#" > 
		<cflog file="#This.Name#" type="error"  
				text="Message: #Arguments.Exception.message#"> 
		<cflog file="#This.Name#" type="error"  
			text="Root Cause Message: #Arguments.Exception.rootcause.message#"> 
		<!--- Display an error message if there is a page context. ---> 
		<cfif NOT (Arguments.EventName IS "onSessionEnd") OR  
				(Arguments.EventName IS "onApplicationEnd")> 
			<cfoutput> 
				<h2>An unexpected error occurred.</h2> 
				<p>Please provide the following information to technical support:</p> 
				<p>Error Event: #Arguments.EventName#</p> 
				<p>Error details:<br> 
				<!---<cfdump var=#Arguments.Exception#></p> ---> 
			</cfoutput>   
		</cfif>   
		<!---  <cflocation url="./login.cfm" /> ---> 
	</cffunction> 
	<cffunction name="onMissingTemplate" returntype="Boolean" output="false">
		<cfargument name="templateName" required="true" type="String" />
		<!--- Put your home page file name here --->
		<cflocation url="./login.cfm" /> 
    <cfreturn true />
	</cffunction>
</cfcomponent> 