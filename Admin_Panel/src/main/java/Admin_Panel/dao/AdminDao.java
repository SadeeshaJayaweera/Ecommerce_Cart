package Admin_Panel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Admin_Panel.model.Admin;

public class AdminDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public AdminDao(Connection con) {
		
		this.con = con;
	}
	
	public Admin adminLogin(String email, String password) {
		Admin admin = null;
		try {
			query = "select * from adminlogin where email=? and password=?";
			pst = this .con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt("id"));
				admin.setEmail(rs.getString("email"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		
		return admin;
	}

}
