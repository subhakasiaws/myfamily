<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <title>MyFamily</title>
  <script src="webjars/jquery/3.2.1/jquery.min.js" ></script>
  <script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
  <script src="js/jquery.min.js"></script>
  <link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
  
   <link href="css/style.css" rel="stylesheet" />
   <script  type="text/javascript">
   $(document).ready(function(){
	    $('#login').click(function(){
	    	console.log("your clicked");
	    	window.location.href = '/home';
	    	return false;
	    });
	    
	    $('.selectpicker').on('change', function(){
	        var selected = $(this).val();
	        console.log("selected val is"+selected);
	        //changeLang('en_EN');
	       // changeLang('pt_PT');
	    });
	    
	});
   </script>
</head>
<body>
<div class="container">
		<div class="page-header">
			<div style="text-align:right">
				<select class="selectpicker" data-width="fit">
					<option	data-content='<span class="flag-icon flag-icon-us"></span> English'	value="en_EN">English</option>
				</select>
			</div>
		</div>
		<div class="d-flex justify-content-center h-100">
	<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="Enter Your Name">
						
					</div>
					<div class="form-group">
						<input type="submit" value="Login" id="login" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			</div>
		</div>
		
<footer class="page-footer font-small blue" style="background-color:green">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
   <a href="http://manafamily.herokuapp.com"> MANAFAMILY.com</a>
  </div>
  <!-- Copyright -->

</footer>

</div>

</body>
  <script type="text/javascript" language="JavaScript"  src="js/jquery.i18n.properties.min.js"></script>
<script type="text/javascript">
function changeLang(lang) {
    jQuery.i18n.properties({
        name: 'Messages', 
        path: 'bundle/', 
        mode: 'both',
        language: lang, 
        callback: function() {
            $("#msg_hello").text(jQuery.i18n.prop('msg_hello'));
        }
    });
}
</script>
</html>