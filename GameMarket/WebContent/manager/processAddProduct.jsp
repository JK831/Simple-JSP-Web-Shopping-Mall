<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	String fileName = "";
	String storeFolder = "C:\\Users\\rhe97\\eclipse-workspace\\GameMarket\\WebContent\\resources\\images";
	int maxSize = 5*1024*1024;
	String encType="utf-8";
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, storeFolder, maxSize, encType, policy);
	request.setCharacterEncoding("utf-8");
	
	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	Integer unitPrice= Integer.parseInt(multi.getParameter("unitPrice"));
	String producer=multi.getParameter("producer");
	String releaseDate=multi.getParameter("releaseDate");
	String description=multi.getParameter("description");
	String genre=multi.getParameter("genre");
	
	Integer price;
	
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, unitPrice);
	pstmt.setString(4, producer);
	pstmt.setString(5, description);
	pstmt.setString(6, genre);
	pstmt.setString(7, releaseDate);
	pstmt.setString(8, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("./editProduct.jsp?edit=update");
	
%>