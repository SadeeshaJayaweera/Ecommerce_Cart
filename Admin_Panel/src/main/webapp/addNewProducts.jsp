<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/adminMain.css">
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
          <a class="nav-link active" href="addNewProducts.jsp">Add New Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="userManagement.jsp">User Management</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="productManagement.jsp">Product Management</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminLogin.jsp">Log Out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
  <h2>Add New Product</h2>
  <form action="addProductServlet" method="post" enctype="multipart/form-data">
    <div class="mb-3">
  	  <label for="productImageLink" class="form-label">Enter Image Link</label>
      <input type="text" class="form-control" id="productImageLink" name="productImageLink" placeholder="https://example.com/image.jpg">
	</div>
    <div class="mb-3">
      <label for="productName" class="form-label">Product Name</label>
      <input type="text" class="form-control" id="productName" name="productName" required>
    </div>
    <div class="mb-3">
      <label for="productPrice" class="form-label">Price ($)</label>
      <input type="number" class="form-control" id="productPrice" name="productPrice" min="0" step="0.01" required>
    </div>
    <div class="mb-3">
      <label for="productCategory" class="form-label">Category</label>
      <select class="form-select" id="productCategory" name="productCategory" required>
        <option value="">Select Category</option>
        <option value="Electronics">Electronics</option>
        <option value="Clothing">Clothing</option>
        <option value="Books">Books</option>
        <!-- Add more options as needed -->
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Add Product</button>
  </form>
</div>

</body>
</html>
