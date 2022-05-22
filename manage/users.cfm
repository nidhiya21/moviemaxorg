<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Users|  Movie Max Digital </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
        <script src="js/theater.js"></script> 
        <script src="./js/jquery.validate.min.js"></script>
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
                                                        <h2>Manage Users</h2>
                                                        <p>List all User</p>
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
                                    <h4>List all User</h4>
                                    <cfset userList=theaterObj.getUsers()/>                          
                                    <table id="table_id" class="display">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>User Name</th>
                                                <th>EmailID</th> 
                                                <th>Phone Number</th>
                                                <th>Action</th>
                                            </tr> 
                                        </thead>
                                        <tbody>  
                                            <cfloop query="userList"> 
                                                <tr>
                                                    <td>#userList.CurrentRow#</td>
                                                    <td>#userList.userName# </td>
                                                    <td>#userList.emailID# </td>
                                                    <td> 
                                                        #userList.phoneNumber#
                                                    </td>
                                                    <td> 
                                                        <a href="" class="delete modal-trigger icon-clr"   data-toggle="modal" data-id=#userList.userID# data-target=".deleteEmployeeModal">
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
                <div id="deleteEmployeeModal" class="modal fade deleteEmployeeModal">
                    <div class="modal-dialog">
                        <div class="modal-content dltcontent">
                            <form action="" method="post">
                                <div class="modal-contentVal">
                                    <input type="hidden" id="userIDVal" name="userIDVal" value="" />
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete User</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <p>Are you sure you want to delete these Records?</p> 
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
                                        <input type="submit" name="deleteuserSubmit" data-id=#userList.userID#  class="btn btn-danger deleteuserSubmit" value="Delete">
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
            <cfinclude template="commonfooter.cfm">
        </cfoutput>
    </body>
</html>