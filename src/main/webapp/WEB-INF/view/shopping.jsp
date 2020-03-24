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

	<div class="container main-section">
        <label id="userId" name="userId" style="display: none;" value='${param.userId}'>${param.userId}</label>
        <label id="name" name="name" style="display: none;" value='${param.name}'>${param.name}</label>
		<div class="row">
			<div class="col-lg-12 pb-2 my-shopping">
				<h4>Welcome to Shopping Cart</h4>
			</div>
			<div class="col-lg-12 pl-3 pt-3" style="margin-bottom: 66px;">
				<table class="table table-hover border bg-white">
				    <thead>
				      	<tr>
					        <th>Product</th>
					        <th>Points</th>
					        <th style="width:10%;">Quantity</th>
					        <th>Subtotal</th>
					        <th>Action</th>
				      	</tr>
				    </thead>
				    <tbody>
				    	<tr>
					        <td>
					        	<div class="row">
									<div class="col-lg-4 Product-img">
										<img src="images/coffee.jpg" alt="..." class="img-responsive"/>
									</div>
									<div class="col-lg-4">
										<h4 class="nomargin">Coffee Cup's</h4>
										<p>It's better than glass, your coffee will stay warmer much longer.</p>
									</div>
								</div>
					        </td>
					        <td> 500 </td>
					        <td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td> 500 </td>
					        <td class="actions" data-th="" style="width:10%;">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
				      	</tr>
				    	<tr>
					        <td>
					        	<div class="row">
									<div class="col-lg-4 Product-img">
										<img src="images/iphone11-pro.jpg" alt="..." class="img-responsive"/>
									</div>
									<div class="col-lg-4">
										<h4 class="nomargin">Iphone 11 PRO</h4>
										<p> The first iPhone powerful enough to be called Pro.</p>
									</div>
								</div>
					        </td>
					        <td> 2000 </td>
					        <td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td> 2000 </td>
					        <td class="actions" data-th="" style="width:10%;">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
				      	</tr>
				      	<tr>
					        <td>
					        	<div class="row">
									<div class="col-lg-4 Product-img">
										<img src="images/gold_biscut.JPG" alt="..." class="img-responsive"/>
									</div>
									<div class="col-lg-4">
										<h4 class="nomargin">Gold Biscuit</h4>
										<p>24K is pure gold, it is usually more expensive than 22K or 18K.</p>
									</div>
								</div>
					        </td>
					        <td> 5000 </td>
					        <td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td> 5000 </td>
					        <td class="actions" data-th="" style="width:10%;">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
				      	</tr>
				    </tbody>
				    <tfoot>
						<tr>
							<td><a href="#" class="btn btn-warning text-white"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center" style="width:10%;"><strong>Total : 47,000</strong></td>
							<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %> 
<script type="text/javascript">
$(document).ready(function() {
	
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