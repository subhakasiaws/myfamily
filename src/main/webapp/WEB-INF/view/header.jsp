 <nav class="navbar navbar-expand-lg navbar-dark indigo static-top homebgcolor">
 <div class="container-fluid"  style="height:71% !important">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="#"><spring:message code="app.page.welcome"/></a>
    <ul class="navbar-nav mr-auto mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#"><spring:message code="app.page.home"/> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="https://www.flipkart.com/"><spring:message code="app.page.shopping"/></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://www.sakshi.com/"><spring:message code="app.page.news"/></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><spring:message code="app.page.contact"/></a>
       </li>
  	 <li class="nav-item">
       <a class="nav-link" href="#"><spring:message code="app.page.astrology"/></a>
     </li>
    </ul>
  </div>
  <div>
  
   <ul class="navbar-nav mr-auto mt-lg-0">
              <!-- Nav Item - Alerts -->
        <!--  <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-bell"></i>
                Counter - Alerts
                <span class="badge badge-danger badge-counter my-padding-top">3+</span>
              </a>
              Dropdown - Alerts
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in homebgcolor" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
         </li> -->
	  <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
	          aria-haspopup="true" aria-expanded="false">
	          <i class="fa fa-users"></i><spring:message code="app.page.profile"/></a>
	        <div class="dropdown-menu dropdown-menu-right dropdown-info homebgcolor" aria-labelledby="navbarDropdownMenuLink-4">
	          <a class="dropdown-item" href="#"><spring:message code="app.page.myaccount"/></a>
	           <a class="dropdown-item" href="#"><spring:message code="app.page.dashboard"/></a>
	           <a class="dropdown-item" href="#"><spring:message code="app.page.settings"/></a>
	          <a class="dropdown-item" href="#"><spring:message code="app.page.logout"/></a>
	        </div>
	  </li>
   </ul>
 </div>
  </div>
</nav>