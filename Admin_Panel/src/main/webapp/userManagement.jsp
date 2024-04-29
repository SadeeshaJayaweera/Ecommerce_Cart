<%@page import="Admin_Panel.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.xadmin.usermanagement.bean.User" %>
<%@ page import="com.xadmin.usermanagement.dao.UserDao" %>
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
body {
        
        background-color: #f4f4f4;
    }
.table {
        background-color: #fff;
        box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
    }

    .table th {
        background-color: #f8f9fa;
        font-weight: bold;
    }

    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-danger:hover {
        background-color: #c82333;
        border-color: #bd2130;
    }

    .btn-danger:focus {
        box-shadow: 0 0 0 0.2rem rgba(225, 83, 97, 0.5);
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

<div class="container my-5">
    <h2 class="text-center mb-4">Admin User Management</h2> 
    <table class="table table-striped">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            UserDao userDao = new UserDao();
            List<User> userList = userDao.selectAllUsers();
            for (User user : userList) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td>
                    <a href="users/deleteUser?id=<%= user.getId() %>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <% 
            }
            %>
        </tbody>
    </table>
</div>

</body>
</html>