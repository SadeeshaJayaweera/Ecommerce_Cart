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
<style>
.gradient-custom{background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1)) ;}
</style>
</head>
<body>

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
                 
              <%
            String errorMessage = "";
            String errorParam = request.getParameter("error");
            if (errorParam != null && errorParam.equals("1")) {
                errorMessage = "Admin login failed. Please check your credentials.";
            }
            %>
              <div style="color: red;"> <%= errorMessage %></div>
              
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
   this.submit();
  });
</script>


</body>
</html>
