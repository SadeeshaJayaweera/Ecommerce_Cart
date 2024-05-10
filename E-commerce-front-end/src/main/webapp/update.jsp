<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
   
   <% 
	if(request.getParameter("submit")!=null)
	{	
		String id = request.getParameter("id");
		String name = request.getParameter("login-name");
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");

		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "1234");
		pst=con.prepareStatement("update users set name=?,email=?,password=? where id=?");
		pst.setString(1,name);
		pst.setString(2,email);
		pst.setString(3,password);
		pst.setString(4, id);
		pst.executeUpdate();
		
	
	%>
	<script>alert("Record Updated")</script>
	<%} %>
	
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/includes/head.jsp"%>
</head>
<body>
<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Edit Your Profile</div>
			<div class="card-body">
				<form action="#" method="post">
				
				<%
					Connection con;
					PreparedStatement pst;
					ResultSet rs;
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "1234");
					
					String id =request.getParameter("id");
					pst = con.prepareStatement("select * from users where id = ?");
					pst.setString(1,id);
					rs = pst.executeQuery();
					
					while(rs.next())
					{
				%>
				
				
				
					<div class="form-group">
						<label>First Name</label> <input class="form-control"
							name="login-name" id="login-name" type="text" placeholder="Enter Your First Name" value = "<%=rs.getString("name") %>"
							required>
					</div>
                                  
					<div class="form-group">
						<label>Email Address</label> <input class="form-control"
							name="login-email" id="login-email" type="email" placeholder="Please Enter Your Email"  value = "<%=rs.getString("email") %>"
							required>
					</div>
                                    <div>
                                        Change Password
                                        <input type="checkbox" id="abc" onclick="checkMe()" ><br><br>
                                        <div id="msg" style="display: none;">
                                            <div class="form-group">
						<label>New Password</label> <input class="form-control"
							name="login-password" id="login-password"type="password" placeholder="Enter New Password"  value = "<%=rs.getString("password") %>">
					</div>
                                    <div class="form-group">
						<label>Confirm New Password</label> <input class="form-control"
							name="new-pass" type="password" placeholder="Confirm Password">
					</div>
                                        </div>
                                    </div>
                                   <% 
                                   }  %>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary" name="submit">Save Changes</button>
					</div>
					
					<div align="left">
					<a href="edit.jsp">Click Back</a>
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