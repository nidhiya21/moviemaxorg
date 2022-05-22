<cfif isDefined("session") and structKeyExists(session, 'cart')  and structKeyExists(session.cart, 'cartID')  >
    <cfset variables.cartID=session.cart.cartID />
</cfif>
<cfset moviesObj=CreateObject("component","components.movies")/>
<cfset result=moviesObj.getPaymentDetails(cartID)/>   
<cfdocument name="certificate" format="PDF" pagetype="custom" pageheight="5" pagewidth="6.5" margintop="0" marginbottom="0" marginright="0" marginleft="0" unit="in" fontembed="true" backgroundvisible="true" localurl="true">
    <cfoutput>
        <html> 
            <head>
                <style type="text/css">
                    <link rel="stylesheet" type="text/css" href="./css/thanks.css" />  
                </style>
            </head>
            <body>
                <cfloop query="result">
                    <div class="card cardLeft">
                        <h1>Movie Max <span>Digital</span></h1>
                        <div class="title">
                            <h2>#result.fld_moviename#</h2>
                            <span>movie</span>
                        </div>
                        <div class="name">
                            <h2>#result.userName#</h2>
                            <span>name</span>
                        </div>
                        <div class="time">
                            <h2>#result.bookedDate# #result.bookedTime#</h2>
                            <span>time</span>
                        </div>
                    </div>
                    <div class="card cardRight">
                        <div class="eye"></div>
                        <div class="number">
                            <h3>#result.seats#</h3>
                            <span>seat</span>
                        </div>
                        <div class="barcode"></div>
                    </div>
                </cfloop>
            </body>
        </html>
    </cfoutput>
</cfdocument>
<cfmail
    to="#result.emailID#"
    from="rishiba.pp.niitclt@gmail.com"  
    subject="Thank you for booking movie #result.userName#!"
    type="html"> 
    <p>Thank you for booking movie with our system #result.userName#. Plese find the attachment.</p>
    <cfmailparam file="ticket.pdf" type="application/pdf" content="#certificate#"/>  
</cfmail>