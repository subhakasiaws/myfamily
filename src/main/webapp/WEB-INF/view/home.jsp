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
  <div class="container-fluid makeScroll">
		<c:set var="notiCount" value="1" scope="request" />
      <div>
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" value='${userBoard.userName}'>${userBoard.userName}</label> </h1>
		<div class="div-h-40">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item">
				<a class="nav-link my-tab-active active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true"><spring:message code="app.page.leaders"/></a>
				</li>
				<li class="nav-item">
				<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false"><spring:message code="app.page.weekly"/></a>
				</li>
		</ul>
		</div>
		<div class="tab-content homeccbground"  id="pills-tabContent">
    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
<table class="table my-border-co">
  <thead>
    <tr>
      <th scope="col"><spring:message code="app.page.rank"/></th>
      <th scope="col"><spring:message code="app.page.name"/></th>
      <th scope="col"><spring:message code="app.page.points"/></th>
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
    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
      <table class="table my-border-co">
  <thead>
    <tr>
      <th scope="col"><spring:message code="app.page.rank"/></th>
      <th scope="col"><spring:message code="app.page.name"/></th>
      <th scope="col"><spring:message code="app.page.points"/></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td><c:out   value="${leaderList[0].users.name}"/></td>
      <td><c:out   value="${leaderList[0].points}"/></td>
    </tr>
  </tbody>
</table>

<div> <h4><spring:message code="app.page.whatsapp"/></h4>
<div class="whatsapp"><a class="fa fa-whatsapp" href="" target="_blank"></a></div>
</div>

    </div>
  </div>
  
      </div>
  
  </div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	   var loginName = '${userBoard.userName}';
   var userId = '${userBoard.userId}';
   var points = '${userBoard.points}';
   $("#totalPoints").text(points);
   
   $("#myTask").click(function() {
		$("body").load("/tasks?name="+loginName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/task");
   });
   
   $("#calendar").click(function() {
		$("body").load("/calendar?name="+loginName+"&userId="+userId+"&points="+points);
		history.pushState(null, null, "/calendar");
   });
   
   $("#pills-home-tab").click(function() {
	   $("#pills-profile-tab").removeClass('my-tab-active');
	   $( this ).css("background-color","#a9cfd5!important");
	   $( this ).addClass('my-tab-active');
   });
   
   $("#pills-profile-tab").click(function() {
	   $( this ).css("background-color","#a9cfd5!important");
	   $( this ).addClass('my-tab-active');
	   $("#pills-home-tab").removeClass('my-tab-active');
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
