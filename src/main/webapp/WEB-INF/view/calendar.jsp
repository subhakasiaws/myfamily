<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:message code=""/>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <link href="css/mystyle.css" rel="stylesheet" />
   <link rel="stylesheet" href="css/mycal.css" />
   <link rel="stylesheet" href="css/ourhome.css" />
  <script src="js/calendar.js"></script>
</head> 
  <!-- Navigation -->
<%@ include file="header.jsp" %> 
   <!-- Page Content -->
   <div class="row my-height-40">
   <marquee behavior="scroll" direction="left" scrollamount="10" class="my-margin-top">
   <p>• <spring:message code="app.page.marquee"/></p>
   </marquee>
	</div>
	
  <div class="container-fluid makeScroll margin-b-100">
      <div class="col-lg-12 text-center">
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" value='${param.name}' >${param.name}</label> </h1>
         <label id="userId" name="userId" style="display: none;" value='${param.userId}'>${param.userId}</label>
      </div>
	  
	  <p>
  <a id="createEvent" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Create Event
  </a>
</p>

<div class="collapse" id="collapseExample">
  <div class="card card-body my-family-width-100">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm my-family-flex-width">
            <legend><a href="http://www.jquery2dotnet.com"><i class="glyphicon glyphicon-globe"></i></a></legend>
            <input class="form-control" name="eventName" id="eventName" placeholder="Event Name" type="text" />
            <textarea name="desc" id="desc" class="form-control" rows="9" cols="25" required="required" placeholder="Event Description"></textarea>
            <label for="">
                Event Date</label>
            <div class="row">
                <div class="col-xs-4 col-md-4">
                    <select class="form-control" id="day">
                        <option value="Day">Day</option>
                        <option value="Day">1</option>
                    </select>
                </div>
                <div class="col-xs-4 col-md-4">
                    <select class="form-control" id="month">
                        <option value="Month">January</option>
                    </select>
                </div>
                <div class="col-xs-4 col-md-4">
                    <select class="form-control" id="year">
                        <option value="Year">Year</option>
                    </select>
                </div>
            </div>
            <button id="eventSubmit" class="btn btn-lg btn-primary btn-block" type="submit">Create Event</button>
        </div>
  </div>
</div>
</div>
      		<div class="row">
			<div class="col">
				<ul class="event-list">
				             
				                <c:forEach var="event" items="${events}">
										<li>
											<time datetime="2014-07-20 2000">
												<span class="day">20</span>
												<span class="month">Jan</span>
												<span class="year">${event.eventDate}</span>
												<span class="time">8:00 PM</span>
											</time>
											<img alt="My 24th Birthday!" src="https://farm5.staticflickr.com/4150/5045502202_1d867c8a41_q.jpg" />
											<div class="info">
											<c:choose>
												<c:when test="${event.eventName == 'Birthday'}">
												<h2 class="title"><spring:message code="app.page.birthday"/></h2>
												<p class="desc">${event.eventDescription}</p>
												</c:when>
												<c:otherwise>
												    <h2 class="title"><spring:message code="app.page.marriageday"/></h2>
													<p class="desc">PS Vita</p>
													<ul>
														<li style="width:50%;"><a href="#website"><span class="fa fa-globe"></span> Website</a></li>
														<li style="width:50%;"><span class="fa fa-money"></span> $39.99</li>
													</ul>
												 </c:otherwise>
											</c:choose>
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
               					 </c:forEach>
				</ul>
			</div>
		</div>
  </div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {

	   var userName = '${param.name}';
	   $("#name").val(userName);
	   console.log("userName:"+userName);
	   var userId = '${param.userId}';
	   $("#userId").val(userId);
	   console.log(userId);
	   var points = '${param.points}';
	   $('#totalPoints').text(points);
	   console.log("points "+points);
   
   $("#home").click(function() {
	   console.log("loding home");
	   var temp = userName;
		$("body").load("/home?name="+temp+"&userId="+userId+"&isFromLogin=false");
		history.pushState(null, null, "/home");
   });
   
   $("#myTask").click(function() {
	   console.log("loding tasks");
		$("body").load("/tasks?name="+userName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/task");
   });
   
   $("#celebrNotification").remove();
   
   var dayOption = '';
   for (var i=2;i<=31;i++){
	   dayOption += '<option value="'+ i + '">' + i + '</option>';
   }
   $('#day').append(dayOption);
   
   var month= ["February","March","April","May","June","July","August","September","October","November","December"];
   var monthOption = '';
   for (var i=0;i<month.length;i++){
	   monthOption += '<option value="'+ i + '">' + month[i] + '</option>';
   }
   $('#month').append(monthOption);
   
   var yearOption = '';
   for (var i=1920;i<2021;i++){
	   yearOption += '<option value="'+ i + '">' + i + '</option>';
   }
   $('#year').append(yearOption);
   
   $('#eventSubmit').click(function() {
	   var fullDate = $('#day').val()+$('#month').val()+$('#year').val();
	   console.log('in eventSubmit');
	   console.log('date: '+fullDate);
	   console.log('name: '+$('#eventName').val());
	   console.log('desc: '+$('#desc').val());
	   eventDataSubmit($('#eventName').val(),$('#desc').val(),fullDate,$('#name').val());
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
