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
   
   function decorateWhatsAppLink() {
	   //set up the url
	   var url = 'whatsapp://send?text=';

	   //define the message text
	   var text = 'Hey check out this awesome blog at https://madole.xyz';

	   //encode the text
	   var encodedText = encodeURIComponent(text);

	   //find the link
	   var $whatsApp = $('.whatsapp a');

	   //set the href attribute on the link
	   $whatsApp.attr('href', url + encodedText);
	 }

	 //call the decorator function
	 decorateWhatsAppLink()
   
});
</script>
