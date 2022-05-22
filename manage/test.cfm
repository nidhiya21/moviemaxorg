<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Movie Theaters |  Movie Max Digital </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
        <link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css">
        <script src="js/theater.js"></script> 
        <script src="./js/jquery.validate.min.js"></script>
        <script type="text/javascript" charset="utf8" src="./js/jquery.dataTables.js"></script>
    </head>
    <body>
        <cfoutput>
            <cfinclude template="leftsidemenu.cfm"> 
            <cfset variables.userID=session.stLoggedInUser.userID />
            <cfset theaterObj=CreateObject("component","components.theater")/>
            <!-- Start Welcome area -->
            <div class="all-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="logo-pro">
                                <a href="index.cfm"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
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
                                                        <h2>Movie Theaters</h2>
                                                        <p>List all Theaters</p>
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
                                    <h4>Movie Theaters</h4>
                                    <div class="add-product">
                                        <a href="##addEmployeeModal" class="myform-btnVal pd-setting"  data-toggle="modal"><span class="modal-txt1">ADD THEATER</span></a> 
                                    </div>
                                    <cfset theaterList=theaterObj.getTheaters(variables.userID)/>                          
                                    <table id="table_id" class="display">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Theater Name</th>
                                                <th>Image</th> 
                                                <th>Created Date</th>
                                                <th>Action</th>
                                            </tr> 
                                        </thead>
                                        <cfloop query="theaterList"> 
                                        <tbody>
                                            <tr>
                                                <td>#theaterList.CurrentRow#</td>
                                                <td>#theaterList.fld_theaterName# </td>
                                                <td>
                                                    <cfif theaterList.fld_theaterImage NEQ ''>
                                                        <img src="./img/theaterimages/#theaterList.fld_theaterImage#" class="user-img"/>
                                                    <cfelse> 
                                                        <img src="./img/theaterimages/no-man.jpg" class="user-img">
                                                    </cfif>
                                                </td>
                                                <td> 
                                                    #theaterList.createdDate#
                                                </td>
                                                <td>
                                                    <a href="##addEmployeeModal" class="edit modal-trigger-edit icon-clr"  data-id=#theaterList.theaterID#  data-toggle="modal">
                                                        <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                                    </a>
                                                    <a href="" class="delete modal-trigger icon-clr"   data-toggle="modal" data-id=#theaterList.theaterID# data-target=".deleteEmployeeModal">
                                                        <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                                    </a>
                                                </td>
                                            </tr>
                                        </tbody>
                                        </cfloop>    
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
                            <cfparam name="form.fld_theaterName" default="" type="string"> 
                            <cfparam name="form.fld_theaterImage" default="" type="string"> 
                            <form action="" method="post" name="theater" id="theater" enctype="multipart/form-data">
                                <input type="hidden" id="userID" name="userID" value= "#variables.userID#"/>
                                <input type="hidden" id="theaterID" name="theaterID" value="" />
                                <div class="modal-header">						
                                    <h4 class="modal-title mod-title"></h4>
                                    <button type="button" class="close mod-clos" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Theater Name:</label>
                                        <input type="text" name="fld_theaterName" id="fld_theaterName" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Theater Image:</label>
                                        <input type="file" name="fld_theaterImage" accept=".jpg,.jpeg,.png" id="fld_theaterImage" onchange="preview()">
                                        <input type="hidden" id="old_img" name="old_img" value="" />
                                        <div class="img-popup">
                                            <img src="./img/theaterimages/no-man.jpg" class="user-imgpopup" id="editimgsrc"/> 	 
                                        </div>
                                    </div>				
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit"  name="formTheaterSubmit" id ="formTheaterSubmit"  class="btn add-theatre formTheaterSubmit" value="Add">
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
                                    <input type="hidden" id="theaterIDVal" name="theaterIDVal" value="" />
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Theater</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <p>Are you sure you want to delete these Records?</p> 
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
                                        <input type="submit" name="deleteSubmit" data-id=#theaterList.theaterID#  class="btn btn-danger deleteSubmit" value="Delete">
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
                                    <p>Copyright © 2018 <a href="##">Nalika</a> All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
            <cfinclude template="commonfooter.cfm">
        </cfoutput>
    </body>
</html>