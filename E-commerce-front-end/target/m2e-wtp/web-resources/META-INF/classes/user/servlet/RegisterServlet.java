package cn.techtutorial.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("login-name");
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "1234");
			PreparedStatement pst = con.prepareStatement("insert into users(name,password,email)values(?,?,?)");
			pst.setString(1, name);
			pst.setString(2, password);
			pst.setString(3, email);
			
		int	rowCount = pst.executeUpdate();
		dispatcher = request.getRequestDispatcher("register.jsp");
		if(rowCount>0) {
			request.setAttribute("status","success");
		}
		else {
			request.setAttribute("status", "failed");
		}
		dispatcher.forward(request,response);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	

}
