package com.xadmin.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xadmin.usermanagement.bean.User;
import com.xadmin.usermanagement.dao.UserDao;

@WebServlet("/users/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() throws ServletException {
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getPathInfo(); // Get the path after "/users/"
		if (action == null || action.equals("/")) { // If no specific action is specified, default to listing users
			try {
				listUser(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (action.equals("/deleteUser")) { // Handle delete user action
			try {
				deleteUser(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			// Handle other actions if needed
			response.sendError(HttpServletResponse.SC_NOT_FOUND); // Return 404 for unknown actions
		}
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		try {
			List<User> listUser = userDao.selectAllUsers();
			request.setAttribute("listUser", listUser);
			request.getRequestDispatcher("userManagement.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			userDao.deleteUser(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/userManagement.jsp");
	}
}
