<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <link href="css/mystyle.css" rel="stylesheet" />
   <link rel="stylesheet" href="css/mycal.css" />
   <link rel="stylesheet" href="css/ourhome.css" />
  <!-- Navigation -->
<%@ include file="header.jsp" %> 
   <!-- Page Content -->
   <div class="row my-height-40">
   <marquee behavior="scroll" direction="right" scrollamount="10" class="my-margin-top">
   <p>• <spring:message code="app.page.marquee"/></p>
   </marquee>
	</div>
	
  <div class="container-fluid makeScroll margin-b-100">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" >${name}</label> </h1>
      </div>
      		<div class="row" >
			<div class="col">
				<ul class="event-list">
					<li>
						<time datetime="2014-07-20">
							<span class="day">4</span>
							<span class="month">Jul</span>
							<span class="year">2014</span>
							<span class="time">ALL DAY</span>
						</time>
						<img alt="Independence Day" src="https://farm4.staticflickr.com/3100/2693171833_3545fb852c_q.jpg" />
						<div class="info">
							<h2 class="title"><spring:message code="app.page.marriageday"/></h2>
							<p class="desc">United States Holiday</p>
						</div>
						<div class="social">
							<ul>
								<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
								<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
								<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
							</ul>
						</div>
					</li>

					<li>
						<time datetime="2014-07-20 0000">
							<span class="day">8</span>
							<span class="month">Jul</span>
							<span class="year">2014</span>
							<span class="time">12:00 AM</span>
						</time>
						<div class="info">
							<h2 class="title"><spring:message code="app.page.marriageday"/></h2>
							<p class="desc">PS Vita</p>
							<ul>
								<li style="width:50%;"><a href="#website"><span class="fa fa-globe"></span> Website</a></li>
								<li style="width:50%;"><span class="fa fa-money"></span> $39.99</li>
							</ul>
						</div>
						<div class="social">
							<ul>
								<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
								<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
								<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
							</ul>
						</div>
					</li>

					<li>
						<time datetime="2014-07-20 2000">
							<span class="day">20</span>
							<span class="month">Jan</span>
							<span class="year">2014</span>
							<span class="time">8:00 PM</span>
						</time>
						<img alt="My 24th Birthday!" src="https://farm5.staticflickr.com/4150/5045502202_1d867c8a41_q.jpg" />
						<div class="info">
							<h2 class="title"><spring:message code="app.page.birthday"/></h2>
							<p class="desc">Bar Hopping in Erie, Pa.</p>
							<ul>
								<li style="width:33%;">1 <span class="glyphicon glyphicon-ok"></span></li>
								<li style="width:34%;">3 <span class="fa fa-question"></span></li>
								<li style="width:33%;">103 <span class="fa fa-envelope"></span></li>
							</ul>
						</div>
						<div class="social">
							<ul>
								<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
								<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
								<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
  </div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
   var modelAttributeValue = '${name}';
   $("#name").val(modelAttributeValue);
   console.log("modelAttributeValue");
   console.log(modelAttributeValue);
   
   $("#home").click(function() {
	   console.log("loding home");
	   var temp = "Chandra";
		$("body").load("/home",{name:temp,isFromLogin:false});
		history.pushState(null, null, "/home");
   });
   
   $("#myTask").click(function() {
	   console.log("loding tasks");
		$("body").load("/tasks");
		history.pushState(null, null, "/task");
   });
   
});

$(window).scroll(function() {

    if ($(this).scrollTop()>0)
     {
        $('.my-margin-top').fadeOut();
     }
    else
     {
      $('.my-margin-top').fadeIn();
     }
 });

</script>
