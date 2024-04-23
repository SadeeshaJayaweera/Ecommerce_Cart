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
      <%@ page import="productManagement.model.Product" %>
      <%@ page import="java.util.List" %>
      <%@ page import="productManagement.dao.ProductDAO" %>
      
      <% 
        ProductDAO productDAO = new ProductDAO();
        List<Product> productList = productDAO.selectAllProducts();
        for (Product product : productList) {
      %>
      <tr>
        <td><%= product.getId() %></td>
        <td><img src="<%= product.getImageLink() %>" alt="Product Image" class="product-image"></td>
        <td><%= product.getName() %></td>
        <td>$<%= product.getPrice() %></td>
        <td><%= product.getCategory() %></td>
        <td>
        <a class="btn btn-warning">Edit</a>
        <a class="btn btn-danger">Delete</a>
        
        
    </td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>



</body>
</html>