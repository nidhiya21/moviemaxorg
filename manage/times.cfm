<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Show Timings |  Movie Max Digital </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
        <script type="text/javascript" src="./js/moment.min.js"></script>
        <link href= "./css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script src="./js/bootstrap-datetimepicker.min.js"> </script>
        <script src="./js/times.js"></script> 
        <script src="./js/jquery.validate.min.js"></script>
    </head>
    <body>
        <cfoutput>
            <cfinclude template="leftsidemenu.cfm"> 
            <cfset variables.userID=session.stLoggedInUser.userID />
            <cfset showsObj=CreateObject("component","components.times")/>
            <!-- Start Welcome area -->
            <div class="all-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="logo-pro">
                                <a href="index.cfm">
                                    <img class="main-logo" src="img/logo/logo.png" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="header-advance-area">
                    <cfinclude template="commonheader.cfm">  
                    <div class="breadcome-area">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="breadcome-list">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="breadcomb-wp">
                                                    <div class="breadcomb-icon">
                                                        <i class="icon nalika-home"></i>
                                                    </div>
                                                    <div class="breadcomb-ctn">
                                                        <h2>Show Timings</h2>
                                                        <p>List all Show Timings</p>
                                                    </div>
                                                </div>
                                            </div>                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-status mg-b-30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="product-status-wrap">
                                    <h4>Show Timings</h4>
                                    <div class="add-product">
                                        <a href="##addEmployeeModal" class="myform-btnVal pd-setting"  data-toggle="modal">
                                            <span class="modal-txt1">ADD SHOW TIMINGS</span>
                                        </a> 
                                    </div>
                                    <cfset showList=showsObj.getShows(variables.userID)/>                          
                                    <table id="table_id" class="display">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Theater</th> 
                                                <th>Movies Name</th>
                                                <th>Start Date / End Date</th>
                                                <th>Start Time / End Time</th>
                                                <th>Gold Full</th>
                                                <th>Gold Half</th>
                                                <th>ODC Full</th>
                                                <th>ODC Half</th>
                                                <th>Box</th>
                                                <th>Seats</th>
                                                <th>Action</th>
                                            </tr> 
                                        </thead>
                                        <tbody> 
                                            <cfloop query="showList"> 
                                                <tr>
                                                    <td>#showList.CurrentRow#</td>
                                                    <td>#showList.fld_theaterName# </td>
                                                    <td>#showList.fld_moviename# </td>
                                                    <td>#showList.startDate# / #showList.endDate#</td>
                                                    <td>#showList.startTime# / #showList.endTime#</td>
                                                    <td><i class="fa fa-inr"></i> #showList.goldFull#</td> 
                                                    <td><i class="fa fa-inr"></i> #showList.goldHalf#</td> 
                                                    <td><i class="fa fa-inr"></i> #showList.odcFull#</td> 
                                                    <td><i class="fa fa-inr"></i> #showList.odcHalf#</td> 
                                                    <td><i class="fa fa-inr"></i> #showList.box#</td> 
                                                    <td>#showList.seats#</td> 
                                                    <td>
                                                        <a href="##addEmployeeModal" class="edit modal-trigger-edit icon-clr"  data-id=#showList.showID#  data-toggle="modal">
                                                            <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                                        </a>
                                                        <a href="" class="delete modal-trigger icon-clr"   data-toggle="modal" data-id=#showList.showID# data-target=".deleteEmployeeModal">
                                                            <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </cfloop>
                                        </tbody>         
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- Edit Modal HTML -->
                <div id="addEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <cfparam name="form.theaterID" default=""> 
                            <cfparam name="form.movieID" default=""> 
                            <cfparam name="form.startDate" default=""> 
                            <cfparam name="form.endDate" default=""> 
                            <cfparam name="form.goldFull" default="" > 
                            <cfparam name="form.goldHalf" default=""> 
                            <cfparam name="form.odcFull" default=""> 
                            <cfparam name="form.odcHalf" default=""> 
                            <cfparam name="form.box" default=""> 
                            <cfparam name="form.seats" default="">
                            <cfparam name="form.startTime" default="" type="string"> 
                            <cfparam name="form.endTime" default="" type="string">  
                            <cfif isDefined("session.errormsg")> 
                                <p class="fail-alert"><cfoutput>#session.errormsg[1]#</cfoutput></p>
                            </cfif>
                            <cfset errormsgs = StructDelete(session, "errormsg", "True")>  
                            <form action="" method="post" name="showtime" id="showtime" enctype="multipart/form-data">
                                <input type="hidden" id="userID" name="userID" value= "#variables.userID#"/>
                                <input type="hidden" id="showID" name="showID" value="" />  
                                <div class="modal-header">						
                                    <h4 class="modal-title mod-title"></h4>
                                    <button type="button" class="close mod-clos" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <cfset theatreList=showsObj.gettheatreList(variables.userID)/>   
                                        <label>Select Theater:</label>  
                                        <select class="form-select form-control" name="theaterID" id="theaterID">  
                                            <option label="Select Theater">Select Theater</option>          
                                            <cfloop query="theatreList">  
                                                <option value="#theatreList.theaterID#">#theatreList.fld_theaterName#</option>
                                            </cfloop>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <cfset movieList=showsObj.getmovieList(variables.userID)/>   
                                        <label>Select Movie:</label>  
                                        <select class="form-select form-control" name="movieID" id="movieID" > 
                                            <option label="Select Movie">Select Movie</option>                   
                                            <cfloop query="movieList"> 
                                                <option value="#movieList.movieID#">#movieList.fld_moviename#</option>
                                            </cfloop>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <div class="priceblock">
                                            <div>
                                                <label>Show Start Date:</label>
                                                <input type="date" name="startDate" id="startDate" class="form-control  dateslt" />    
                                            </div>
                                            <div  class="endTimes">
                                                <label>Show End Date:</label>
                                                <input type="date" name="endDate" id="endDate" class="form-control dateslt " />
                                            </div>
                                        </div>    
                                    </div>
                                    <div class="form-group">
                                        <div class="priceblock">
                                        <div>
                                            <label>Show Start Times:</label>
                                            <input class="form-control" type="text" placeholder="--:--" class="startTime" name="startTime" id="startTime" /> 
                                        </div>
                                        <div class="endTimes">
                                            <label>Show End Times:</label>
                                            <input class="form-control" type="text"  placeholder="--:--" class="endTime" name="endTime" id="endTime" /> 
                                        </div>
                                        </div>
                                    </div>
                                    <div class="form-group"> 
                                        <div class="priceblock">
                                            <div>
                                                <label>Gold Full:</label>
                                                <input class="form-control showprice"id="goldFull"  type="number" name="goldFull" step="1">
                                            </div>
                                            <div class="price-box">
                                                <label>Gold Half:</label>
                                                <input class="form-control showprice" id="goldHalf" type="number" name="goldHalf" step="1">
                                            </div>
                                            <div  class="price-box">
                                                <label>ODC Full:</label>
                                                <input class="form-control showprice" id="odcFull" type="number" name="odcFull" step="1">
                                            </div>
                                            <div  class="price-box">
                                                <label>ODC Half:</label>
                                                <input class="form-control showprice" id="odcHalf" type="number" name="odcHalf" step="1">
                                            </div>
                                            <div  class="price-box"> 
                                                <label>BOX:</label>
                                                <input class="form-control showprice" id="box" type="number" name="box" step="1">
                                            </div>
                                        </div> 
                                    </div> 	
                                    <div class="form-group"> 
                                        <div class="priceblock">
                                            <div>
                                                <label>Total Seats:</label>
                                                <input class="form-control showprice" id="seats"  type="number" name="seats" step="1">
                                            </div>
                                        </div> 
                                    </div> 			
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit"  name="formTimeSubmit" id ="formTimeSubmit"  class="btn add-theatre formTimeSubmit" value="Add">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="deleteEmployeeModal" class="modal fade deleteEmployeeModal">
                    <div class="modal-dialog">
                        <div class="modal-content dltcontent">
                            <form action="" method="post">
                                <div class="modal-contentVal">
                                    <input type="hidden" id="showIDVal" name="showIDVal" value="" />
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Show Timings</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <p>Are you sure you want to delete these Records?</p> 
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
                                        <input type="submit" name="deleteSubmit" data-id=#showList.showID#  class="btn btn-danger deleteSubmit" value="Delete">
                                    </div>
                                </div>	
                            </form>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright-area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="footer-copy-right">
                                    <p>Copyright © 2018 <a href="##">Movie Max Digital</a> All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            <script>
                $('##startTime').datetimepicker({ 
                    format: 'hh:mm a'  
                });
                $('##endTime').datetimepicker({
                    format: 'hh:mm a' 
                });
            </script>
            <cfinclude template="commonfooter.cfm">
        </cfoutput>
    </body>
</html> 