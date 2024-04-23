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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" type="text/css" href="css/adminMain.css">
<title>AddNewProducts</title>


<style>
      
      .product-image {
        width: 160px; 
        height: 100px;
        object-fit: cover;
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
      <%
      if(auth != null){
      %>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="addNewProducts.jsp">Add New Products</a>
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
<div class="container mt-5">
      <h2>Product List</h2>
      <table class="table">
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>Category</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>
              <img
                src="https://mir-s3-cdn-cf.behance.net/projects/404/90d873190593687.Y3JvcCwzODM1LDMwMDAsODUsMA.jpg"
                alt="Product Image"
                class="product-image"
              />
            </td>
            <td>Product A</td>
            <td>$10.00</td>
            <td>Category A</td>
            <td>
              <button type="button" class="btn btn-warning">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>
              <img
                src="https://i.ytimg.com/vi/cyv-RYl7nHA/maxresdefault.jpg"
                alt="Product Image"
                class="product-image"
              />
            </td>
            <td>Product B</td>
            <td>$15.00</td>
            <td>Category B</td>
            <td>
              <button type="button" class="btn btn-warning">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </td>
          </tr>
          <tr>
            <td>3</td>
        
                <td><img src="https://media.istockphoto.com/id/650233226/photo/military-style-watch.jpg?s=612x612&w=0&k=20&c=PknuHX2Dh0SN2JTKF60Ftxowdiwoudc_zTu9Vd2UD-w=" alt="Product Image" class="product-image"></td>
            
            <td>Product C</td>
            <td>$20.00</td>
            <td>Category A</td>
            <td>
              <button type="button" class="btn btn-warning">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </td>
          </tr>
          <tr>
            <td>4</td>
            
                <td><img src="https://lk-live-21.slatic.net/kf/S972caa08aefd44478486cc7619c86755j.jpg" alt="Product Image" class="product-image"></td>
        
            <td>Product D</td>
            <td>$25.00</td>
            <td>Category B</td>
            <td>
              <button type="button" class="btn btn-warning">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </td>
          </tr>
          <tr>
            <td>5</td>
            
                <td><img src="https://m.media-amazon.com/images/I/615flyfwK3L.jpg" alt="Product Image" class="product-image"></td>
            
            <td>Product E</td>
            <td>$30.00</td>
            <td>Category A</td>
            <td>
              <button type="button" class="btn btn-warning">Edit</button>
              <button type="button" class="btn btn-danger">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>



</body>
</html>