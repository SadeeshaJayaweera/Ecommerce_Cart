<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>



	
<!DOCTYPE html>
<html>
<head>

<%@include file="/includes/head.jsp"%>

<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Edit Profile</title>

</head>
<body>

<h1 align="center">Edit Profile</h1>
                <table align="center" border="1" cellpadding="0" width="50%">
               <tr>
                <th>id</th>
                <th>name</th>
                <th>email</th>
                <th>password</th>
               </tr>
               <%
                Connection con;
	       		PreparedStatement pst;
	       		ResultSet rs;
	       		
	       		Class.forName("com.mysql.cj.jdbc.Driver");
	       		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "1234");
	            String query = "select * from users";
	            Statement st = con.createStatement();
	            rs = st.executeQuery(query);
	            
	            while(rs.next())
	            {
	            	String id = rs.getString("id");
	            
               
               %>
               
               
               <tr>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("password") %></td>
                <td><a href="update.jsp?id=<%=id %>">Edit</a></td>
                
               </tr>
               <% } %>
                </table>
                <div align="center"><a href="index.jsp">Click Back</a></div>       
                
</body>
</html>
