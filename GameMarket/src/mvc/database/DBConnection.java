package mvc.database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection getConnection() throws SQLException,
	ClassNotFoundException {
		
		Connection conn = null;
		
		String url = "jdbc:mariadb://127.0.0.1:3306/gamevendor_db";
		String user = "rhe";
		String password = "ad972530";
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
		return conn;
	}
}
