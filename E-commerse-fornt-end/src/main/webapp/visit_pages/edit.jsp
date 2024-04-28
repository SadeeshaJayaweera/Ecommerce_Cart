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
<title>Edit Profile</title>
</head>
<body>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Edit Your Profile</div>
			<div class="card-body">
				<form action="" method="post">
					<div class="form-group">
						<label>First Name</label> <input class="form-control"
							name="Login-name" type="text" placeholder="Enter Your First Name"
							required>
					</div>
                                    <div class="form-group">
						<label>Last Name</label> <input class="form-control"
							name="Login-name" type="text" placeholder="Enter Your Last Name"
							required>
					</div>
					<div class="form-group">
						<label>Email Address</label> <input class="form-control"
							name="Login-email" type="email" placeholder="Please Enter Your Email"
							required>
					</div>
                                    <div>
                                        Change Password
                                        <input type="checkbox" id="abc" onclick="checkMe()" ><br><br>
                                        <div id="msg" style="display: none;">
                                            <div class="form-group">
						<label>New Password</label> <input class="form-control"
							name="new-pass" type="password" placeholder="Enter New Password">
					</div>
                                    <div class="form-group">
						<label>Confirm New Password</label> <input class="form-control"
							name="con-pass" type="password" placeholder="Confirm Password">
					</div>
                                        </div>
                                    </div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Save Changes</button>
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
                
                <script>
                    function checkMe(){
                        var cb = document.getElementById("abc");
                        var text = document.getElementById("msg");
                        if(cb.checked==true){
                            text.style.display="block";
                        }else{
                            text.style.display="none";
                        }
                    }
                </script>        
                
</body>
</html>