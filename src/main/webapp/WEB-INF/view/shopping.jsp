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
	        <h1 class="mt-5"><spring:message code="app.page.hi"/> <label for="name" id="name" value='${param.name}' >${param.name}</label> </h1>
        <label id="userId" name="userId" style="display: none;" value='${param.userId}'>${param.userId}</label>
		<div class="row">
			<div class="col-lg-12 pb-2">
				<h4>MyFamily Shoping Cart</h4>
			</div>
			<div class="col-lg-12 pl-3 pt-3">
				<table class="table table-hover border bg-white">
				    <thead>
				      	<tr>
					        <th>Product</th>
					        <th>Price</th>
					        <th style="width:10%;">Quantity</th>
					        <th>Subtotal</th>
					        <th>Action</th>
				      	</tr>
				    </thead>
				    <tbody>
				      	<tr>
					        <td>
					        	<div class="row">
									<div class="col-lg-2 Product-img">
										<img src="http://nicesnippets.com/demo/sc-images.jpg" alt="..." class="img-responsive"/>
									</div>
									<div class="col-lg-10">
										<h4 class="nomargin">Lenovo K6 Power</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
										tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
					        </td>
					        <td> 12,000 </td>
					        <td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td>12,000</td>
					        <td class="actions" data-th="" style="width:10%;">
								<button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>								
							</td>
				      	</tr>
				      	<tr>
					        <td>
					        	<div class="row">
									<div class="col-lg-2 Product-img">
										<img src="http://nicesnippets.com/demo/sc-KHIP6xxGLD-webres.jpg" alt="..." class="img-responsive"/>
									</div>
									<div class="col-lg-10">
										<h4 class="nomargin">Iphone 6s</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
										tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
					        </td>
					        <td> 35,000 </td>
					        <td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td> 35,000 </td>
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
	   $("#home").click(function() {
		   var temp = userName;
			$("body").load("/home?name="+temp+"&userId="+userId);
			history.pushState(null, null, "/home");
	   });
});
</script>