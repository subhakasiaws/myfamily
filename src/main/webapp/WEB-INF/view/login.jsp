<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>MyFamily</title>
<script src="webjars/jquery/3.2.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.i18n.properties.min.js"></script>
<link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="css/font-awesome.min.css"
	rel="stylesheet" />	

<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function() {
						
		$('#login').click(function() {
			console.log("your clicked");
			var $regexname = /^([a-zA-Z]{3,16})$/;
			var temp = $('#name').val();
			
			if (!temp.match($regexname)) {
			
				console.log("worng name");
				$('#myLogin').addClass("alert alert-danger alert-dismissible fade show text-danger p-3 mb-2 bg-danger");
				} else {
					console.log("correct name");
					$('#myLogin').addClass("was-validated");
					$("body").load("/home", {name:temp});
					}
					
			return false;
		});

			$('.selectpicker').on('change', function() {
				var selected = $(this).val();
				console.log("selected val is" + selected);
				$('.selectpicker option[value='+selected+']').attr('selected','selected');
	
				localStorage.setItem("selectedLanguage", selected);
				if("1" == selected ){
					selected = "?lang=te";
				}else if("2" == selected){
					selected = "?lang=en";
				}else if("3" == selected){
					selected = "?lang=hi";
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
	<div class="container" style="height: 91% !important">
		<div class="page-header" style="margin-top: 5px">
			<div style="text-align: right">
				<select class="selectpicker" data-width="fit"> <!--  onchange="location = this.value;" -->
					<option 
						data-content='<span class="flag-icon flag-icon-us"></span> Telugu'
						value="1"><spring:message code="app.lang.telugu"/></option>	
					<option
						data-content='<span class="flag-icon flag-icon-us"></span> English'
						value="2"><spring:message code="app.lang.english"/></option>
											<option
						data-content='<span class="flag-icon flag-icon-us"></span> English'
						value="3"><spring:message code="app.lang.hindi"/></option>
				</select>
			</div>
		</div>
		<div class="d-flex justify-content-center h-100"
			style="margin-top: 100px">
			<div class="card">
				<div class="card-header">
					<h3><spring:message code="app.page.signin"/></h3>
				</div>
				<div class="card-body">
					<form>
						<div id="myLogin" class="input-group form-group">
							<div class="input-group-prepend">
							</div>
							<input id="name" type="text" class="form-control" placeholder="<spring:message code="app.page.enteryourname"/>">

						</div>
						<div class="form-group">
							<input type="submit" value="<spring:message code="app.page.login"/>" id="login"
								class="btn float-right login_btn">
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div style="margin-top: 90px;">
		<footer class="page-footer font-small blue"
			style="background-color:#9370DB"> <!-- Copyright -->
		<div class="footer-copyright text-center py-3 wcolor"
			style="padding-bottom: 2rem !important; color: white">
			© 2020 Copyright: <a style="color: white"
				href="http://manafamily.herokuapp.com"> MANAFAMILY.com</a>
		</div>
		<!-- Copyright --> </footer>
	</div>
</body>
</html>