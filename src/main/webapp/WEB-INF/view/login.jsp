<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>My Family</title>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.i18n.properties.min.js"></script>
<script src="js/myfamily.js"></script>
<link href="css/bootstrap.min.css"	rel="stylesheet" />
<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link rel="stylesheet" href="css/mystyle.css" >

<script type="text/javascript">
$(document).ready(function() {
						
		$('#login').click(function() {

			var $regexname = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
			var temp = $('#name').val();
			
			if (!temp.match($regexname)) {
				
				$('#myLogin').addClass("alert alert-danger alert-dismissible fade show text-danger p-3 mb-2 bg-danger");
				} else {
					$('#myLogin').addClass("was-validated");
					$("body").load("/home?name="+temp,setNotifications);
					history.pushState(null, null, "/home");
					}
					
			return false;
		});

		function setNotifications(){
			 
				// $("#myTask").append('<span id="taskNotification" class="badge badge-pill badge-danger my-top-12">1</span>');
				 //$("#calendar").append('<span id="celebrNotification" class="badge badge-pill badge-danger my-top-12">1</span>');
				 //TODO
				 localStorage.setItem("taskNoti", "1");
				 localStorage.setItem("calNoti", "1");
			}

			$('.selectpicker').on('change', function() {
				var selected = $(this).val();
				
				$('.selectpicker option[value='+selected+']').attr('selected','selected');
	
				localStorage.setItem("selectedLanguage", selected);
				if("1" == selected ){
					selected = "?lang=te";
				}else if("2" == selected){
					selected = "?lang=en";
				}else if("3" == selected){
					selected = "?lang=hi";
				}else if("4" == selected){
					selected = "?lang=cn";
				}else if("5" == selected){
					selected = "?lang=de";
				}
				
				window.location.href=selected;
			}); 
	
		 	var sLang= localStorage.getItem("selectedLanguage");
		 	if(null !=sLang){
		 		$('.selectpicker option[value='+sLang+']').attr('selected','selected');
		 	}
});
</script>
</head>
<body>
	<div class="container-fluid" >
		<div class="page-header" >
			<div style="text-align: right">
				<select class="selectpicker" data-width="fit" style="padding-bottom: 3px;"> 
					<option data-content='<span class="flag-icon flag-icon-us"></span> Telugu' value="1"><spring:message code="app.lang.telugu"/></option>	
					<option data-content='<span class="flag-icon flag-icon-us"></span> English' value="2"><spring:message code="app.lang.english"/></option>
					<option data-content='<span class="flag-icon flag-icon-us"></span> Hindi' value="3"><spring:message code="app.lang.hindi"/></option>
					<option data-content='<span class="flag-icon flag-icon-us"></span> Chinese' value="4"><spring:message code="app.lang.chinese"/></option>
					<option data-content='<span class="flag-icon flag-icon-us"></span> German' value="5"><spring:message code="app.lang.german"/></option>
				</select>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div class="card  m-10" >
				<div class="card-header font20">
					<h4><i class="fa fa-users"></i> <spring:message code="app.page.title"/></h4>
				</div>
				<div class="card-body">
					<form>
						<div id="myLogin" class="input-group form-group">
							<div class="input-group-prepend">
							</div>
							<input id="name" type="text" class="form-control" placeholder="<spring:message code="app.page.enteryourname"/>">

						</div>
						<div class="form-group">
							<span class="login_icon" style="cursor: pointer;float: right; margin-left: -2px;"><i class="fa fa-sign-in" aria-hidden="true" style="float:right;font-size: 40px;background-color: #FFC312;height: 38px;width: 38px;"></i></span>
							<input type="submit" value="<spring:message code="app.page.login"/>" id="login"	class="btn float-right login_btn">
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div class="fixed-bottom my-h-50">
		<footer class="page-footer font-small blue"
			style="background-color:#2d6d3b!important"> <!-- Copyright -->
		<div class="footer-copyright text-center py-3 wcolor"
			style="padding-bottom: 2rem !important; color: white">
			 <a style="color: white"
				href="http://manafamily.herokuapp.com"> <spring:message code="app.page.footer"/></a>
		</div>
		</footer>
	</div>
</body>
</html>