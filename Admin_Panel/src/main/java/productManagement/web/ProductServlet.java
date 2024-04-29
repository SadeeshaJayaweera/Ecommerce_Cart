package productManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import productManagement.dao.ProductDAO;
import productManagement.model.Product;

@WebServlet("/")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;

	public void init() {
		productDAO = new ProductDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertProduct(request, response);
				break;
			case "/delete":
				deleteProduct(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateProduct(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Product> listProduct = productDAO.selectAllProducts();
		request.setAttribute("listProduct", listProduct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productManagement.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("add-product.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Product existingProduct = productDAO.selectProduct(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ProductForm.jsp");
		request.setAttribute("product", existingProduct);
		dispatcher.forward(request, response);
	}

	private void insertProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String imageLink = request.getParameter("image_link");

		// Ensure price is not null or empty before parsing
		String priceParam = request.getParameter("price");
		int price = 0; // Default value if priceParam is null or empty

		if (priceParam != null && !priceParam.isEmpty()) {
			price = Integer.parseInt(priceParam);
		}

		String category = request.getParameter("category");

		Product newProduct = new Product(name, imageLink, price, category);
		productDAO.insertProduct(newProduct);
		response.sendRedirect("productManagement.jsp");
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String imageLink = request.getParameter("image_link");
		int price = Integer.parseInt(request.getParameter("price"));
		String category = request.getParameter("category");

		Product product = new Product(id, name, imageLink, price, category);
		productDAO.updateProduct(product);
		response.sendRedirect("productManagement.jsp");
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		productDAO.deleteProduct(id);
		response.sendRedirect("productManagement.jsp");
	}
}
