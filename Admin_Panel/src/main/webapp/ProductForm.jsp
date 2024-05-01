

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/adminMain.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
  .form-container {
    border: 1px solid #ced4da; 
    padding: 20px;
    width: 50%; 
    margin: auto;
  }
  .btn-primary {
    width: 20%; 
  }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <!-- Navbar brand aligned to the left -->
    <a class="navbar-brand" href="#">Admin Panel</a>
    
    <!-- Use ml-auto class to push the items to the right -->
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

<div class="container mt-5">
  <div class="form-container">
    <h2>Edit Product</h2>
    <form action="update" method="post">
    
    <%@ page import="productManagement.model.Product" %>
  <%@ page import="productManagement.dao.ProductDAO" %>
  
  <% 
    // Retrieve product details based on the passed ID
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.selectProduct(productId);
  %>
      <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
      <div class="mb-3">
        <label for="productName" class="form-label">Product Name</label>
        <input type="text" class="form-control" id="productName" name="name" value="<%= product.getName() %>">
      </div>
      <div class="mb-3">
        <label for="productPrice" class="form-label">Product Price</label>
        <input type="text" class="form-control" id="productPrice" name="price" value="<%= product.getPrice() %>">
      </div>
      <div class="mb-3">
        <label for="productCategory" class="form-label">Product Category</label>
        <input type="text" class="form-control" id="productCategory" name="category" value="<%= product.getCategory() %>">
      </div>
      <div class="mb-3">
        <label for="productCategory" class="form-label">Image Link</label>
        <input type="text" class="form-control" id="productCategory" name="image_link" value="<%= product.getImageLink() %>">
      </div>
      <button type="submit" class="btn btn-primary d-block mx-auto">Save</button> <!-- Center the button -->
    </form>
  </div>
</div>
</body>
</html>
