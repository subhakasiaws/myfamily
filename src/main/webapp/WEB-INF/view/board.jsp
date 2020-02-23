<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>My Family</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.i18n.properties.min.js"></script>
<link href="css/bootstrap.min.css"	rel="stylesheet" />
<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link media="all" type="text/css" rel="stylesheet" href="css/fullscreen.css">
<link rel="stylesheet" href="css/all.css" >
<link rel="stylesheet" href="css/mystyle.css" >


</head>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark static-top homebgcolor" >
    <div class="container-fluid"  style="height:71% !important">
      <a class="navbar-brand" href="#">WELCOME</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Shopping</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="#">News</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
        <div style="margin-left: 1rem">
         <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        </div>
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
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
      </div>
  
  </div>
 <div class="fixed-bottom">

	<footer class="page-footer font-small special-color-dark"
		style="background-color: #2d6d3b !important">
		<div class="row"> 
				<a class="btn btn-primary col homebgcolor" href="/home" role="button">HOME</a>
				<span class="border border-success homeccbg"></span>
				<a class="btn btn-primary col homebgcolor" href="/tasks" role="button">Tasks</a>
				<span class="border border-success homeccbg"></span>
				<a class="btn btn-primary col homebgcolor" href="/board" role="button">LeaderBoard</a>
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
