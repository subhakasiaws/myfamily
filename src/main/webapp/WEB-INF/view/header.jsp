 <nav class="navbar navbar-expand-lg navbar-dark indigo static-top homebgcolor">
 <div class="container-fluid"  style="height:71% !important">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01" style="color:white">
    <a class="navbar-brand" id="welcome"><spring:message code="app.page.welcome"/></a>
    <ul class="navbar-nav mr-auto mt-lg-0">
      <li class="nav-item">
       <a class="nav-link"  id="shopping" href="shopping"><spring:message code="app.page.shopping"/></a>
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
	  <li class="nav-item">
	        <a class="nav-link whitesmokec" id="navbarDropdownMenuLink-4"><i class="fa fa-trophy my-font-20"></i>
	          <spring:message code="app.page.points"/>
	          <span id="totalPoints" class="badge badge-danger badge-counter my-padding-top">0</span>
	          <span class="fa fa-sign-out"></span>
	          </a>
	  </li>
   </ul>
 </div>
  </div>
</nav>