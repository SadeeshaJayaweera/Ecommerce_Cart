<%@page import="Admin_Panel.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Admin auth = (Admin) request.getSession().getAttribute("auth");
if(auth !=null){
	request.setAttribute("auth", auth);
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/adminMain.css">
<title>AddNewProducts</title>
<style>
    /* Custom CSS for admin user management table */

.custom-table {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
    background-color: #fff; /* White background for the table */
}

.custom-table th {
    font-weight: 600;
    background-color: #f8f9fa; /* Light gray background for table header */
}

.custom-table td, .custom-table th {
    vertical-align: middle !important;
}

.custom-table .btn {
    transition: all 0.3s ease;
}

.custom-table .btn:hover {
    transform: scale(1.1);
}

  .nav-link:hover {
    color: #007bff !important;}
   .active {
    color: #007bff !important;
   }
  }
  

</style>
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
      
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="addNewProducts.jsp">Add New Products</a>
        </li>
      
       
        <li class="nav-item">
          <a class="nav-link active" href="userManagement.jsp">User Management</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="productManagement.jsp">Product Management</a>
        </li>
      
        
      </ul>
    </div>
     <div class="navbar-nav ml-auto">
      <ul class="navbar-nav">
        <!-- Move the 'go back' link to the right -->
        
        <!-- Move the 'Log Out' link to the right -->
        <li class="nav-item">
          <a class="nav-link text-danger" href="log-out">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid bg-dark text-light py-5 vh-100">
    <div class="container">
        <h2 class="mb-4 row justify-content-center">ADMIN USER MANAGEMENT </h2> 
        <table class="table table-striped custom-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td><button class="btn btn-danger btn-sm">Delete</button></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td><button class="btn btn-danger btn-sm">Delete</button></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td><button class="btn btn-danger btn-sm">Delete</button></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td><button class="btn btn-danger btn-sm">Delete</button></td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td><button class="btn btn-danger btn-sm">Delete</button></td>
                </tr>
                <!-- Add more rows for other users -->
            </tbody>
        </table>
    </div>
</div>

</body>
</html>