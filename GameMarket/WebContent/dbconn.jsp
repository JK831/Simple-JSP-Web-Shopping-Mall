<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
	<%
		Connection conn = null;
		try {
			String url = "jdbc:mariadb://127.0.0.1:3306/gamevendor_db";
			String user = "rhe";
			String password = "ad972530";
			
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException ex) {
			out.println("Connection failed.<br>");
			out.println("SQLException: "+ ex.getMessage());
		} finally {
			
		}
	%>
</body>
</html>