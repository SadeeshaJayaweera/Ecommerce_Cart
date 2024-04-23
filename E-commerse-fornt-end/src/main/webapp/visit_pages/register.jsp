<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Register</title>
</head>
<body>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Create Your Account</div>
			<div class="card-body">
				<form action="" method="post">
					<div class="form-group">
						<label>Full Name</label> <input class="form-control"
							name="Login-name" type="text" placeholder="Enter Your First and Last Name"
							required>
					</div>
					<div class="form-group">
						<label>Email Address</label> <input class="form-control"
							name="Login-email" type="email" placeholder="Please Enter Your Email"
							required>
					</div>
					<div class="form-group">
					<label>Password*</label> <input class="form-control"
							name="Login-password" type="password" placeholder="Please Enter a Password"
							required>
					
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Sign UP</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>