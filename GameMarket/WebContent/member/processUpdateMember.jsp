<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "./resources/images";
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType, new DefaultFileRenamePolicy());
	String id = multi.getParameter("id");
	String name = multi.getParameter("name");
	String password = multi.getParameter("password");
	String phoneNumber = multi.getParameter("phoneNumber");
	String address = multi.getParameter("address");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (fileName != null) {
			sql = "UPDATE product SET password=? name=?, phone=?, address=?, profile_fileName=?, WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, phoneNumber);
			pstmt.setString(4, address);
			pstmt.setString(5, fileName);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE product SET password=? name=?, phone=?, address=?, WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, phoneNumber);
			pstmt.setString(4, address);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		}
	}
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("./resultUpdate.jsp");
%>