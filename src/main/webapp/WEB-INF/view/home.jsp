<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>

   <link href="css/mystyle.css" rel="stylesheet" />
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark static-top" style="background-color: #2d6d3b!important">
    <div class="container"  style="height:71% !important">
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
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Services</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Coming Soon</a>
            </div>
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
  <div class="container-fluid" style="height:64% !important">
      <div class="col-lg-12 text-center">
      
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" >${name}</label> </h1>
        <ul class="list-unstyled">
          <li></li>
          <li></li>
        </ul>
      </div>
  </div>
 <div class="fixed-bottom">

  <footer class="page-footer font-small special-color-dark" style="background-color: #2d6d3b!important">
  <div  class="row">
<a class="btn btn-primary" href="#" role="button">HOME</a>
<a class="btn btn-primary" href="#" role="button">Calendar</a>
<a class="btn btn-primary" href="#" role="button">Tasks</a>
<a class="btn btn-primary" href="#" role="button">Rewards</a>
<a class="btn btn-primary" href="#" role="button">LeaderBoard</a>
<a class="btn btn-primary" href="#" role="button">Shopping/Groceries</a>
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
