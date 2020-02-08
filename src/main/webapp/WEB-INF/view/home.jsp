<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <title>MyFamily</title>
  <script src="webjars/jquery/3.2.1/jquery.min.js" ></script>
  <script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
   <link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
   <link href="css/mystyle.css" rel="stylesheet" />
   <script>
   $(document).ready(function() {

	    if ($('.content').height() > $('.container1').height()) {
	        setInterval(function () {

	            start();
	       }, 3000); 
	   
	    }
	});

	function animateContent(direction) {  
	    var animationOffset = $('.container1').height() - $('.content').height()-30;
	    if (direction == 'up') {
	        animationOffset = 0;
	    }

	    console.log("animationOffset:"+animationOffset);
	    $('.content').animate({ "marginTop": (animationOffset)+ "px" }, 5000);
	}

	function up(){
	    animateContent("up")
	}
	function down(){
	    animateContent("down")
	}

	function start(){
	 setTimeout(function () {
	    down();
	}, 2000);
	 setTimeout(function () {
	    up();
	}, 2000);
	   setTimeout(function () {
	    console.log("wait...");
	}, 5000);
	}
   </script>
</head>
<body>
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
  <div class="container" style="height:64% !important">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5">WELCOME</h1>
        <p class="lead">MR Name!</p>
        <ul class="list-unstyled">
          <li>Bootstrap 4.3.1</li>
          <li>jQuery 3.4.1</li>
        </ul>
      </div>
  </div>
  <footer class="page-footer font-small special-color-dark pt-4" style="background-color: #2d6d3b!important">

  <!-- Footer Elements -->
  <div class="container">

    <!--Grid row-->
    <div class="row">

      <!--Grid column-->
      <div class="col-md-6 mb-4">

        <!-- Form -->
        <form class="form-inline">
          <input class="form-control form-control-sm mr-3" type="text" placeholder="Search"
            aria-label="Search">
          <i class="fas fa-search" aria-hidden="true"></i>
        </form>
        <!-- Form -->

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-md-6 mb-4">

        <form class="input-group">
          <input type="text" class="form-control form-control-sm" placeholder="Your email"
            aria-label="Your email" aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-sm btn-outline-white my-0" type="button">Sign up</button>
          </div>
        </form>

      </div>
      <!--Grid column-->

    </div>
    <!--Grid row-->

  </div>
  <!-- Footer Elements -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3" style="color:white" >� 2020 Copyright:
    <a style="color:white" href="http://manafamily.herokuapp.com"> MANAFAMILY.com</a>
  </div>
  <!-- Copyright -->

</footer>

</body>
</html>