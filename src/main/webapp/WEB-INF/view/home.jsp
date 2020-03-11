<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link rel="stylesheet" href="css/mystyle.css" >
</head>
<%@ include file="header.jsp" %> 

   <!-- Page Content -->
  <div class="container-fluid makeScroll homeccbground">
      <div>
        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" >${name}</label> </h1>
        
<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#leaderBoard">LeaderBoard</a></li>
    <li><a data-toggle="tab" href="#weeklyWinner">WeeklyWinner</a></li>
  </ul>

  <div class="tab-content">
    <div id="leaderBoard" class="tab-pane fade in active">
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
    <tr>
      <th scope="row">2</th>
      <td>Thulasi</td>
      <td>50</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Sankara</td>
      <td>50</td>
    </tr>
  </tbody>
</table>
    </div>
    <div id="weeklyWinner" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
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
   
   $("#myTask").click(function() {
	   console.log("loding tasks");
		$("body").load("/tasks");
		history.pushState(null, null, "/task");
   });
   
   $("#calendar").click(function() {
	   console.log("loding calendar");
		$("body").load("/calendar");
		history.pushState(null, null, "/calendar");
   });
   
});
</script>
