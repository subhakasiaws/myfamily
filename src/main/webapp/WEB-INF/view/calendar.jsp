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
        <h4><spring:message code="app.page.hi"/> <label for="name" id="name" value='${param.name}' >${param.name}</label> </h4>
         <label id="userId" name="userId" style="display: none;" value='${param.userId}'>${param.userId}</label>
      </div>
	  
	  <p>
  <a id="createEvent" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
  <spring:message code="app.page.event"/>
  </a>
</p>

<div class="collapse" id="collapseExample">
  <div class="card card-body my-family-width-100">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm my-family-flex-width">
            <legend></legend>
             <select class="form-control" id="eventName" name="eventName">
                        <option value="birthday"><spring:message code="app.page.birthday"/></option>
                        <option value="marriageday"><spring:message code="app.page.marriageday"/></option>
             </select>
            <textarea name="desc" id="desc" class="form-control" rows="9" cols="25" required="required" placeholder="<spring:message code="app.page.eventDesc"/>"></textarea>
            <label class="t-5" for=""><spring:message code="app.page.eventdate"/></label>
            <div class="row">
                <div class="col-xs-4 col-md-4">
                    <select class="form-control" id="day">
                        <option value="Day"><spring:message code="app.page.day"/></option>
                        <option value="1">1</option>
                    </select>
                </div>
                <div class="col-xs-4 col-md-4">
                    <select class="form-control" id="month">
                        <option value="Month"><spring:message code="app.page.month"/></option>
                    </select>
                </div>
            </div>
            <button id="eventSubmit" class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="app.page.submit"/></button>
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
												<span class="day">${event.eventDate.split('-')[0]}</span>
												<span class="month">${event.eventDate.split('-')[1]}</span>
												<span class="year">${event.eventDate}</span>
												<span class="time">8:00 PM</span>
											</time>

											<div class="info">
											<c:choose>
												<c:when test="${event.eventName == 'birthday'}">
												<h2 class="title">${event.eventDescription}</h2>
												<p class="desc"><spring:message code="app.page.birthday"/></p>
												</c:when>
												<c:otherwise>
													<h2 class="title">${event.eventDescription}</h2>
												    <p class="desc"><spring:message code="app.page.marriageday"/></p>
													<ul>
														<li style="width:50%;"><a href="#website"><span class="fa fa-globe"></span> </a></li>
														<li style="width:50%;"><span class="fa fa-money"></span> </li>
													</ul>
												 </c:otherwise>
											</c:choose>
												<ul>
													<li style="width:33%;">1 <span class="glyphicon glyphicon-ok"></span></li>
													<li style="width:34%;">3 <span class="fa fa-thumbs-up"></span></li>
													<li style="width:33%;"> <span class="fa fa-envelope"></span></li>
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

	 var notiCount = '${requestScope.notiCount}';
	 console.log("notiCount: "+notiCount);
	 
	   var userName = '${param.name}';
	   $("#name").val(userName);
	   var userId = '${param.userId}';
	   $("#userId").val(userId);
	   var points = '${param.points}';
	   $('#totalPoints').text(points);
   
   $("#home").click(function() {
	   var temp = userName;
		$("body").load("/home?name="+temp+"&userId="+userId);
		history.pushState(null, null, "/home");
   });
   
   $("#myTask").click(function() {
		$("body").load("/tasks?name="+userName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/task");
   });
   
   clearItems();
   $("#celebrNotification").remove();
   
   var dayOption = '';
   for (var i=2;i<=31;i++){
	   dayOption += '<option value="'+ i + '">' + i + '</option>';
   }
   $('#day').append(dayOption);
   
   var month= ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
   var monthOption = '';
   for (var i=0;i<month.length;i++){
	   monthOption += '<option value="'+  month[i] + '">' + month[i] + '</option>';
   }
   $('#month').append(monthOption);
   
   $('#eventSubmit').click(function() {
	   var day = $('#day').val();
	   var month =$('#month').val();
	   var date = day+'-'+month;
	   
	   if(day == "Day"){
		   $('#day').addClass("alert alert-danger alert-dismissible fade show text-danger p-3 mb-2 bg-danger");   
	   }else if(month == "Month"){
		   $('#month').addClass("alert alert-danger alert-dismissible fade show text-danger p-3 mb-2 bg-danger");   
	   }else {
		   eventDataSubmit($('#eventName').val(),$('#desc').val(),date,$('#name').val());
	   }
	   
	   
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
