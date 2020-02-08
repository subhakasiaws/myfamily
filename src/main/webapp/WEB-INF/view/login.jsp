<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
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
	});
   </script>
</head>
<body>
<div class="container">
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
</div>
</body>
</html>