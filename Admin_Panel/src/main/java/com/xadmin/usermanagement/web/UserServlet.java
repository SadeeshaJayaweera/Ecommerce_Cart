package com.xadmin.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xadmin.usermanagement.bean.User;
import com.xadmin.usermanagement.dao.UserDao;


import javax.servlet.RequestDispatcher;


@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;  

   
	public void init() throws ServletException {
		userDao=new UserDao();
		// TODO Auto-generated method stub
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getServletPath();
		switch(action)
		{
		case "/new":
			showNewForm(request,response);
			break;
		
		
		case"/insert":
			try {
				insertUser (request,response) ;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		break;
		case"edit":
			try {
				editUser(request,response);
			}catch (SQLException e) {
			//TODO Auto-gererated catch block
			e.printStackTrace();
			}
			
		break;
		
		case"/delete":
			try {
				deleteUser(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case"/update":
			try {
			updateUser(request,response);
			}catch(SQLException e) {
				//TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
			default:
			try {
				listUser(request,response);
			} catch (SQLException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				break;
		}
		}
	
		private void showNewForm(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException 
		{
			
		RequestDispatcher dispatcher=request.getRequestDispatcher("user-form.jsp");	
		dispatcher.forward(request,response);
		
	    }
		
		
		//insert user
		private void insertUser(HttpServletRequest request,HttpServletResponse response)throws SQLException , IOException
		 {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			User newUser=new User(name,email);	
				userDao.insertUser(newUser);
			response.sendRedirect("list");
			
			
		 } 
		
		
		
		
		//Delete user
		private void deleteUser(HttpServletRequest request ,HttpServletResponse response) throws SQLException,IOException
		{
			int id=Integer.parseInt(request.getParameter("id"));
			try {
				userDao.deleteUser(id);
			}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("list");
 


		}
		
		//edit
		private void editUser(HttpServletRequest request ,HttpServletResponse response) throws SQLException,IOException,ServletException{
			int id=Integer.parseInt(request.getParameter("id"));
			User existingUser;
			try {
				existingUser=userDao. selectUser(id);
				RequestDispatcher dispatcher=request.getRequestDispatcher("user-form.jsp");
			request.setAttribute("user",existingUser);
			dispatcher.forward(request, response);
			}catch(Exception e) {
				//TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//Update
		private void updateUser(HttpServletRequest request ,HttpServletResponse response) throws SQLException,IOException
		{
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			
			User user=new User(id,name,email);
			userDao.updateUser(user);
			response.sendRedirect("list");
			
		}
		
		//default
		private void listUser(HttpServletRequest request,HttpServletResponse reponse) throws SQLException,ServletException,IOException
		{
			try {
				List<User>listUser=userDao.selectAllUsers();
				request.setAttribute("listUser", listUser);
				RequestDispatcher dispatcher=request.getRequestDispatcher("user-list.jsp");
				dispatcher.forward(request, reponse);
		}catch(Exception e) {
			e.printStackTrace();
		}
		}
		
		
		
	
}


