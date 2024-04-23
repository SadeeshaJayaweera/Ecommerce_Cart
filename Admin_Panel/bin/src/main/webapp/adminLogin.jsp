<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Admin_Panel.model.*"%>
<%
Admin auth = (Admin) request.getSession().getAttribute("auth");
if(auth !=null){
	response.sendRedirect("addNewProducts.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="css/adminLogin.css">
<title>Admin Login</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Admin Panel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <%
      if(auth != null){
      %>
        <li class="nav-item">
          <a class="nav-link active" href="addNewProducts.jsp">Add New Products</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="userManagement.jsp">User Management</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="productManagement.jsp">Product Management</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="log-out">Log Out</a>
        </li>
        <%}else{ %>
         <li class="nav-item">
          <a class="nav-link" href="adminLogin.jsp">Login</a>
        </li>
       <%} %> 
     
      </ul>
    </div>
  </div>
  </nav>
<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2">Admin Login</h2>
              <p class="text-white-50 mb-5">Please enter your login and password!</p>

              <form  action="admin-login" method="post">
  
  <!-- Added form element -->
                <div data-mdb-input-init class="form-outline form-white mb-4">
                  <input type="email" id="typeEmailX" class="form-control form-control-lg" name="login-email" required />
                  <label class="form-label" for="typeEmailX">Email</label>
                </div>

                <div data-mdb-input-init class="form-outline form-white mb-4">
                  <input type="password" id="typePasswordX" class="form-control form-control-lg" name="login-password" required />
                  <label class="form-label" for="typePasswordX">Password</label>
                </div>

                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
              </form>

            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  // JavaScript to handle form submission and redirection
  document.getElementById("loginForm").addEventListener("submit", function(event) {
    // Prevent default form submission
    event.preventDefault();

    // Redirect to adminMain.jsp page
    window.location.href = "LoginServlet.java";
  });
</script>

</body>
</html>