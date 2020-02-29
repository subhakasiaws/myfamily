<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>

<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link media="all" type="text/css" rel="stylesheet" href="css/fullscreen.css">
<link rel="stylesheet" href="css/all.css" >
<link rel="stylesheet" href="css/mystyle.css" >

 <!-- Navigation -->
  <nav id="mynavbar" class="navbar navbar-expand-lg navbar-dark static-top homebgcolor" >
    <div class="container-fluid"  style="height:71% !important">
      <a class="navbar-brand" href="#"><spring:message code="app.page.welcome"/></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#"><spring:message code="app.page.home"/>
              <span class="sr-only">(current)</span>
            </a>
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
        <li class="nav-item">
            <a class="nav-link" href="/calendar"><spring:message code="app.page.celebrations"/></a>
          </li>
        </ul>
  
      </div>
    </div>
  </nav>
   <!-- Page Content -->
  <div class="container-fluid makeScroll homeccbground">
      <div>
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" >${name}</label> </h1>
        
        <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Points</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>100</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>50</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>50</td>
    </tr>
  </tbody>
</table>
      </div>
  
  </div>
 <div class="fixed-bottom">

	<footer class="page-footer font-small special-color-dark"
		style="background-color: #2d6d3b !important">
		<div class="row my-h-50"> 
				<a class="btn btn-primary col homebgcolor my-padd-18" href="#" role="button"><spring:message code="app.page.home"/></a>
				<span class="border border-success homeccbg"></span>
				<a class="btn btn-primary col homebgcolor my-padd-18" href="/tasks" role="button"><spring:message code="app.page.task"/></a>
				<span class="border border-success homeccbg"></span>
				<a class="btn btn-primary col homebgcolor my-padd-18" href="/board" role="button"><spring:message code="app.page.awards"/></a>
		</div>
	</footer>
</div>
<script type="text/javascript">
$(window).on('load', function () { 
   var modelAttributeValue = '${name}';
   $("#name").val(modelAttributeValue);
   console.log("modelAttributeValue");
   console.log(modelAttributeValue);
});
</script>
