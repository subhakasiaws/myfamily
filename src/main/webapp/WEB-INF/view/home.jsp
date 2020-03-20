<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:message code=""/>
<head>
<meta name="viewport" http-equiv="Refresh" content="width=device-width, initial-scale=1, maximum-scale=1, 5; url=/login">

<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link rel="stylesheet" href="css/mystyle.css" >
</head>
<%@ include file="header.jsp" %> 

   <!-- Page Content -->
  <div class="container-fluid makeScroll homeccbground">
      <div>
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" value='${userBoard.userName}'>${userBoard.userName}</label> </h1>
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item">
			<a class="nav-link active" data-toggle="tab" href="#leaderBoard">LeaderBoard</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#weeklyWinner">WeeklyWinner</a>
			</li>
		</ul>

		<div class="tab-content">
    <div id="leaderBoard" class="container tab-pane active">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Rank</th>
      <th scope="col">Name</th>
      <th scope="col">Points</th>
    </tr>
  </thead>
  <tbody> 
  <c:set var="count" value="1" scope="page" />
			<c:forEach var="users" items="${leaderList}">
				<tr>
					<td>${count}</td>
					<c:set var="count" value="${count + 1}" scope="page"/>
					<td>${users.users.name}</td>
					<td>${users.points}</td>
				</tr>
			</c:forEach>
  </tbody>
</table>
    </div>
    <div id="weeklyWinner" class="container tab-pane fade">
      <table class="table">
  <thead>
    <tr>
      <th scope="col">Rank</th>
      <th scope="col">Name</th>
      <th scope="col">Points</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Chandra</td>
      <td>100</td>
    </tr>
  </tbody>
</table>
<div class="whatsapp"><a class="fa fa-whatsapp" href="" target="_blank"></a></div>
    </div>
  </div>
  
      </div>
  
  </div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	   var loginName = '${userBoard.userName}';
   var userId = '${userBoard.userId}';
   console.log("userId:"+userId);
   var points = '${userBoard.points}';
   console.log("points:"+points);
   $("#totalPoints").text(points);
   
   $("#myTask").click(function() {
	   console.log("loding tasks");
		$("body").load("/tasks?name="+loginName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/task");
   });
   
   $("#calendar").click(function() {
	   console.log("loding calendar");
		$("body").load("/calendar?name="+loginName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/calendar");
   });
   
   function decorateWhatsAppLink() {
	   //set up the url
	   var url = 'whatsapp://send?text=';

	   //define the message text
	   var text = 'Chandra is the Winner of this Week from Our Family';

	   //encode the text
	   var encodedText = encodeURIComponent(text);

	   //find the link
	   var $whatsApp = $('.whatsapp a');

	   //set the href attribute on the link
	   $whatsApp.attr('href', url + encodedText);
	 }

		 //call the decorator function
		 decorateWhatsAppLink();
		 
			/* localStorage.setItem("notifyTask", true);
			localStorage.setItem("notifyCel", true); */
});
</script>
