<cfset session.stLoggedInFrUser.loggedin = false>
<cfset sessionInvalidate()/>
<cfset StructDelete(Session, "stLoggedInFrUser")/> 
<cfset StructDelete(Session, "cart")/>  
<cfset StructClear(Session) />
<cflocation url = "./index.cfm" addtoken="no">