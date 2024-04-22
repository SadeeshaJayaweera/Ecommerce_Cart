package Admin_Panel.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Admin_Panel.connection.DbCoa;
import Admin_Panel.dao.AdminDao;
import Admin_Panel.model.Admin;

@WebServlet("/admin-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("adminLogin.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter()){
			
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
			
			try {
				AdminDao adao = new AdminDao(DbCoa.getConnection());
				Admin admin = adao.adminLogin(email, password);
				
				if(admin != null) {
					
					request.getSession().setAttribute("auth", admin);
					response.sendRedirect("addNewProducts.jsp");
				}else {
					out.print("admin login failed");
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
					
			
		}
		
	}

}
