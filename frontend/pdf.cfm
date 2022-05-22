<cfset moviesObj=CreateObject("component","components.movies")/>
<cfif URL.id NEQ "">
    <cfset variables.cartID = URL.id/>
</cfif>
<cfset result=moviesObj.getPaymentDetails(cartID)/> 
<link rel="stylesheet" type="text/css" href="./css/thanks.css" />
    <cfdocument format="PDF" filename="ticket.pdf" overwrite="Yes"> 
        <cfdocumentsection> 
            <cfdocumentitem type="header"> 
                <font size="-3"><i>Ticket</i></font> 
            </cfdocumentitem> 
            <cfdocumentitem type="footer"> 
                <font size="-3">Page #cfdocument.currentpagenumber#</font> 
            </cfdocumentitem>         
            <div class="cardWrap">
                <cfoutput>
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
                </cfoutput>
            </div>
        </cfdocumentsection>  
    </cfdocument> 
<cfheader name="Content-Disposition" value="attachment; filename=ticket.pdf">
<cfcontent type="application/pdf"  file="#expandPath('.')#\ticket.pdf"><cfdocument format="PDF">Some text.</cfdocument>

