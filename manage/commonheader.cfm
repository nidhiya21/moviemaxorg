<cfif StructKeyExists(session.stLoggedInUser,"loggedin") AND session.stLoggedInUser.loggedin EQ true and  StructKeyExists(session.stLoggedInUser,"userID")>
     <cfset variables.userID=session.stLoggedInUser.userID />
     <cfset variables.userName=session.stLoggedInUser.userName />
<cfelse>
     <cfset variables.userID=0 />
</cfif>
<div class="header-top-area">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="header-top-wraper">
                    <div class="row">
                        <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                            <div class="menu-switcher-pro">
                                <button type="button" id="sidebarCollapse" class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
                                    <i class="icon nalika-menu-task"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12"></div>
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <div class="header-right-info">
                                <ul class="nav navbar-nav mai-top-nav header-right-menu">
                                    <li class="nav-item">
                                        <a href="##" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                                            <i class="icon nalika-alarm" aria-hidden="true"></i>
                                            <span class="indicator-nt"></span>
                                        </a>
                                        <div role="menu" class="notification-author dropdown-menu animated zoomIn">
                                            <div class="notification-single-top">
                                                <h1>Notifications</h1>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a href="##" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                                                <i class="icon nalika-user"></i>
                                                <span class="admin-name"><cfoutput>#userName#</cfoutput></span>
                                                <i class="icon nalika-down-arrow nalika-angle-dw"></i>
                                            </a>
                                        <ul role="menu" class="dropdown-header-top author-log dropdown-menu animated zoomIn">                                                       
                                            <li>
                                                <a href="##">
                                                    <span class="icon nalika-user author-log-ic"></span> My Profile
                                                </a>
                                            </li>                                                      
                                            <li>
                                                <a href="logout.cfm">
                                                    <span class="icon nalika-unlocked author-log-ic"></span> Log Out
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item nav-setting-open"><a href="##" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="icon nalika-menu-task"></i></a>
                                        <div role="menu" class="admintab-wrap menu-setting-wrap menu-setting-wrap-bg dropdown-menu animated zoomIn">
                                            <ul class="nav nav-tabs custon-set-tab">
                                                <li class="active">
                                                    <a data-toggle="tab" href="##Notes">News</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="##Projects">Activity</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="##Settings">Settings</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content custom-bdr-nt">
                                                <div id="Notes" class="tab-pane fade in active">
                                                    <div class="notes-area-wrap">
                                                        <div class="note-heading-indicate">
                                                            <h2><i class="icon nalika-chat"></i> Latest News</h2>
                                                            <p>You have 10 New News.</p>
                                                        </div>
                                                        <div class="notes-list-area notes-menu-scrollbar">
                                                            <ul class="notes-menu-list"> 
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Projects" class="tab-pane fade">
                                                    <div class="projects-settings-wrap">
                                                        <div class="note-heading-indicate">
                                                            <h2><i class="icon nalika-happiness"></i> Recent Activity</h2>
                                                            <p> You have 20 Recent Activity.</p>
                                                        </div>
                                                        <div class="project-st-list-area project-st-menu-scrollbar">
                                                            <ul class="projects-st-menu-list">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Settings" class="tab-pane fade">
                                                    <div class="setting-panel-area">
                                                        <div class="note-heading-indicate">
                                                            <h2><i class="icon nalika-gear"></i> Settings Panel</h2>
                                                            <p> You have 20 Settings. 5 not completed.</p>
                                                        </div>
                                                        <ul class="setting-panel-list">
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
