package productManagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import productManagement.model.Product;

public class ProductDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/products?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345678";

	private static final String SELECT_PRODUCT_BY_ID = "SELECT id, name, image_link, price, category FROM products WHERE id = ?";
	private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";

	public ProductDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public Product selectProduct(int id) {
		Product product = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String imageLink = rs.getString("image_link");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				product = new Product(id, name, imageLink, price, category);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return product;
	}

	public List<Product> selectAllProducts() {
		List<Product> products = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String imageLink = rs.getString("image_link");
				int price = rs.getInt("price");
				String category = rs.getString("category");
				products.add(new Product(id, name, imageLink, price, category));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return products;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
