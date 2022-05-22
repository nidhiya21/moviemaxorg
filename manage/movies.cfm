<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Movies |  Movie Max Digital  </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <cfinclude template="common.cfm"> 
        <script src="./js/jquery.validate.min.js"></script>
    </head>
    <body>
        <cfoutput>
        <cfinclude template="leftsidemenu.cfm"> 
        <cfset variables.userID=session.stLoggedInUser.userID />
        <cfset moviesObj=CreateObject("component","components.movies")/>
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
                                                    <h2>Movies</h2>
                                                    <p>List all Movies</p>
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
                                <h4>Movies</h4> 
                                <div class="add-product">
                                    <a href="##addEmployeeModal" class="myform-btnVal pd-setting"  data-toggle="modal"><span class="modal-txt1">ADD MOVIE</span></a> 
                                </div>
                                <cfset movieList=moviesObj.getMovies(variables.userID)/>                          
                                <table id="table_id" class="display">
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Movies Name</th>
                                            <th>Poster</th> 
                                            <th>Trailer</th>
                                            <th>Created Date</th>
                                            <th>Cast</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead> 
                                    <tbody>    
                                        <cfloop query="movieList"> 
                                            <tr>
                                                <td>#movieList.CurrentRow#</td>
                                                <td>#movieList.fld_moviename# </td>
                                                <td>
                                                    <cfif movieList.fld_poster NEQ ''>
                                                        <img src="./movies/#movieList.fld_poster#" class="user-img"/>
                                                    <cfelse> 
                                                        <img src="./img/theaterimages/no-man.jpg" class="user-img">
                                                    </cfif>
                                                </td>
                                                <td> 
                                                    <iframe width="150" height="100" src=#movieList.fld_link#>
                                                     </iframe>
                                                </td>
                                                <td> 
                                                    #movieList.createdDate#
                                                </td>
                                                <td> 
                                                    #movieList.fld_cast#
                                                </td>
                                                <td>
                                                    <a href="##addEmployeeModal" class="edit modal-trigger-edit icon-clr"  data-id=#movieList.movieID#  data-toggle="modal">
                                                        <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                                    </a>
                                                    <a href="" class="delete modal-trigger icon-clr"   data-toggle="modal" data-id=#movieList.movieID# data-target=".deleteEmployeeModal">
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
                        <cfif isDefined("session.errormsg")> 
                            <p class="fail-alert"><cfoutput>#session.errormsg[1]#</cfoutput></p>
                        </cfif>
                        <cfset errormsgs = StructDelete(session, "errormsg", "True")>    
                        <cfparam name="form.fld_moviename" default="" type="string"> 
                        <cfparam name="form.fld_poster" default="" type="string"> 
                        <cfparam name="form.fld_details" default="" type="string"> 
                        <cfparam name="form.fld_cast" default="" type="string"> 
                        <cfparam name="form.fld_facts" default="" type="string">  
                        <cfparam name="form.fld_link" default="" type="string"> 
                        <cfparam name="form.fld_ratings" default="" type="string">   
                        <form action="" method="post" name="movie" id="movie" enctype="multipart/form-data">
                            <input type="hidden" id="userID" name="userID" value= "#variables.userID#"/>
                            <input type="hidden" id="movieID" name="movieID" value="" />
                            <div class="modal-header">						
                                <h4 class="modal-title mod-title"></h4>
                                <button type="button" class="close mod-clos" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div> 
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Movie Name:</label>  
                                    <input type="text" name="fld_moviename" id="fld_moviename" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Movie Poster:</label>
                                    <input type="file" name="fld_poster" accept=".jpg,.jpeg,.png" id="fld_poster" onchange="preview()">
                                    <input type="hidden" id="old_img" name="old_img" value="" />
                                    <div class="img-popup">
                                        <img src="./img/theaterimages/no-man.jpg" class="user-imgpopup" id="editimgsrc"/> 	 
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label>Movie Details:</label>
                                    <textArea name="fld_details" id="fld_details" class="form-control" ></textArea>
                                </div>
                                <div class="form-group">
                                    <label>Cast:</label>
                                    <textArea name="fld_cast" id="fld_cast" class="form-control" ></textArea>
                                </div>	
                                <div class="form-group">
                                    <label>Facts:</label>
                                    <textArea name="fld_facts" id="fld_facts" class="form-control" ></textArea>
                                </div>
                                <div class="form-group">
                                    <label>Movie Link:</label>
                                    <input type="text" name="fld_link" id="fld_link" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Movie Ratings:</label>
                                    <select class="form-select form-control"  name="fld_ratings" id="fld_ratings" aria-label="Default select example">
                                        <option selected>Select Ratings</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>			
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit"  name="formMovieSubmit" id ="formMovieSubmit"  class="btn add-theatre formMovieSubmit" value="Add">
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
                                <input type="hidden" id="movieIDVal" name="movieIDVal" value="" />
                                <div class="modal-header">						
                                    <h4 class="modal-title">Delete Movie</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <p>Are you sure you want to delete these Records?</p> 
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default cancel" data-dismiss="modal" value="Cancel">
                                    <input type="submit" name="deleteSubmit" data-id=#movieList.movieID#  class="btn btn-danger deleteSubmit" value="Delete">
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
        <script type="text/javascript" src="./js/movies.js"></script>  
    </body>
</html>