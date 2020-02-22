<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:message code=""/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>MyFamily</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.i18n.properties.min.js"></script>
<link href="css/bootstrap.min.css"	rel="stylesheet" />
<link href="css/font-awesome.min.css"	rel="stylesheet" />	
<link media="all" type="text/css" rel="stylesheet" href="css/fullscreen.css">
<link rel="stylesheet" href="css/all.css" >


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
	<div class="container" >
		<div class="page-header" style="margin-top: 5px">
			<div style="text-align: right">
				<select class="selectpicker" data-width="fit"> <!--  onchange="location = this.value;" -->
					<option data-content='<span class="flag-icon flag-icon-us"></span> Telugu' value="1"><spring:message code="app.lang.telugu"/></option>	
					<option data-content='<span class="flag-icon flag-icon-us"></span> English' value="2"><spring:message code="app.lang.english"/></option>
					<option data-content='<span class="flag-icon flag-icon-us"></span> Hindi' value="3"><spring:message code="app.lang.hindi"/></option>
					<option data-content='<span class="flag-icon flag-icon-us"></span> Chinese' value="4"><spring:message code="app.lang.chinese"/></option>
					<option data-content='<span class="flag-icon flag-icon-us"></span> German' value="5"><spring:message code="app.lang.german"/></option>
				</select>
			</div>
		</div>
		<div class="d-flex justify-content-center h-100">
			<div class="card" >
				<div class="card-header">
					<h3><spring:message code="app.page.title"/></h3>
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

	<div class="fixed-bottom">
		<footer class="page-footer font-small blue"
			style="background-color:#9370DB"> <!-- Copyright -->
		<div class="footer-copyright text-center py-3 wcolor"
			style="padding-bottom: 2rem !important; color: white">
			 <a style="color: white"
				href="http://manafamily.herokuapp.com"> <spring:message code="app.page.footer"/></a>
		</div>
		</footer>
	</div>
</body>
</html>