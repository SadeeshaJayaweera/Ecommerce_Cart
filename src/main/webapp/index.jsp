<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>

    <div class="container my-3">
        <h2 class="text-center">All Products</h2>
        <div class="row">
            <%
            if (!products.isEmpty()) {
                for (Product p : products) {
            %>
            <div class="col-md-4">
                <div class="card mb-3">
                    <img class="card-img-top" src="product-image/<%=p.getImage() %>"
                        alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title"><%=p.getName() %></h5>
                        <p class="card-text">Price: $<%=p.getPrice() %></p>
                        <p class="card-text">Category: <%=p.getCategory() %></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
                            <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
                out.println("There are no products available.");
            }
            %>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
