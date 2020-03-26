<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:message code=""/>
<head>
<meta name="viewport" http-equiv="Refresh" content="width=device-width, initial-scale=1, maximum-scale=1, 5; url=/login">

<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<script src="js/shopping.js"></script>
</head>
<%@ include file="header.jsp" %> 

	<div class="container main-section">
        <label id="userId" name="userId" style="display: none;" value='${param.userId}'>${param.userId}</label>
        <label id="name" name="name" style="display: none;" value='${param.name}'>${param.name}</label>
       
       		        			<div class="col-lg-12 pb-2 my-shopping">
							<h4><spring:message code="app.page.shoptitle"/></h4>
							</div>
					
					 <!-- Modal -->
						<div class="modal fade" id="orderplaced" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle"> <spring:message code="app.page.success"/></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <spring:message code="app.page.successText"/>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="app.page.close"/></button>
						      </div>
						    </div>
						  </div>
						</div> 
						
						<div class="modal fade" id="cancelOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="app.page.failure"/></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        <spring:message code="app.page.failText"/>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="app.page.close"/></button>
						      </div>
						    </div>
						  </div>
						</div> 
		
		        <div class="row" style="background-color: white;">
		    	  <div class="col my-margin-top my-m-b">
				        <div class="my-shopping-item">
						  <img class="" src="images/coffee.jpg" alt="Card image cap" style="height: 233px;">
						  <div class="card-block my-shopping-item-align">
						    <h4 class="card-title"><spring:message code="app.page.coffeecup"/></h4>
						    <p><spring:message code="app.page.coffeecupTitle"/>.</p>
						    <p class="card-text"><spring:message code="app.page.pointss"/>: 500</p>
						    <span><spring:message code="app.page.quantity"/></span>
						    <input type="number" class="text-center" value="1" style="width: 60%;" id="cup_q">
						    <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
						  </div>
						</div>
				      </div>
				      <div class="col my-margin-top">
				        <div class="my-shopping-item">
				  <img class="" src="images/iphone11-pro.jpg" alt="Card image cap" style="height: 172px;">
				  <div class="card-block my-shopping-item-align my-margin-top my-m-b">
				    <h4 class="card-title"><spring:message code="app.page.iphone"/></h4>
				    <p><spring:message code="app.page.iphoneText"/>.</p>
				    <p class="card-text"><spring:message code="app.page.pointss"/>: 2000</p>
					   <span style="margin-right:5px;"><spring:message code="app.page.quantity"/></span>
					   <input type="number" class="text-center" value="0" style="width: 60%;" id="iphone_q">
					   <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
				  </div>
				</div>
				      </div>
				      <div class="col my-margin-top my-m-b">
				        <div class="my-shopping-item">
				  <img class="" src="images/gold_biscut.JPG" alt="Card image cap" style="height: 188px;">
				  <div class="card-block my-shopping-item-align my-margin-top">
				    <h4 class="card-title"><spring:message code="app.page.gold"/></h4>
				    <p><spring:message code="app.page.goldText"/>.</p>
				    <p class="card-text"><spring:message code="app.page.pointss"/>: 5000</p>
				      <span><spring:message code="app.page.quantity"/></span>
					   <input type="number" class="text-center" value="0" style="width: 60%;" id="gold_q">
					   <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
				  </div>
				</div>
		      </div>
		    </div>
    	<div class="row" style="background-color: white;margin-bottom: 70px;">
	    	<div style="margin-left: 75%; margin-bottom: 20px;">
	    	<span style="margin-left: 10px;"><spring:message code="app.page.total"/>: <span id="totalVal">500</span></span>
	    	<span><a id="place_order" class="btn btn-success btn-block"><spring:message code="app.page.order"/><i class="fa fa-angle-right"></i></a></span>
	    	</div>
    	</div>
		
	</div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	
	   var loginName = '${param.name}';
	   $("#name").val(loginName);
	   var userId = '${param.userId}';
	   $("#userId").val(userId);
	   var points = '${param.points}';
	   $('#totalPoints').text(points);
	   
	   $("#home").click(function() {
		   var temp = loginName;
			$("body").load("/home?name="+temp+"&userId="+userId);
			history.pushState(null, null, "/home");
	   });
	   
	   $("#myTask").click(function() {
			$("body").load("/tasks?name="+loginName+"&userId="+userId+"&points="+points);
			history.pushState(null, null, "/task");
	   });
	   
	   $("#calendar").click(function() {
			$("body").load("/calendar?name="+loginName+"&userId="+userId+"&points="+points);
			history.pushState(null, null, "/calendar");
	   });
	   
	   $('#logout').click(function() {
		   
		   var lang = getLanguageConverter(localStorage.getItem("selectedLanguage"));
		   if(null == lang){
				 $("body").load("/login?lang=te");
				 history.pushState(null, null, "/login?lang=te");
		   }else{
				 $("body").load("/login"+lang);
				 history.pushState(null, null, "/login"+lang);
		   }

    	});
});
</script>