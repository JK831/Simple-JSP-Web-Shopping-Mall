<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "C:\\Users\\rhe97\\eclipse-workspace\\GameMarket\\WebContent\\resources\\images";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());
	request.setCharacterEncoding("utf-8");
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String producer = multi.getParameter("producer");
	String genre = multi.getParameter("genre");
	
	Integer price;
	
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (fileName != null) {
			sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_producer=?, p_genre=?, p_fileName WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, producer);
			pstmt.setString(5, genre);
			pstmt.setString(6, fileName);
			pstmt.setString(7, productId);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_producer=?, p_genre=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, producer);
			pstmt.setString(5, genre);
			pstmt.setString(6, productId);
			pstmt.executeUpdate();
		}
	}
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>