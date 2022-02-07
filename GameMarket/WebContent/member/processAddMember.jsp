<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ include file="../dbconn.jsp" %>
<%
	String fileName = "";
	String storeFolder = "C:\\Users\\rhe97\\eclipse-workspace\\GameMarket\\WebContent\\resources\\images";
	int maxSize = 5*1024*1024;
	String encType="utf-8";
	
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, storeFolder, maxSize, encType, policy);
	request.setCharacterEncoding("utf-8");
	
	String id=multi.getParameter("id");
	String password=multi.getParameter("password");
	String name= multi.getParameter("name");
	String phoneNumber=multi.getParameter("phoneNumber");
	String address=multi.getParameter("address");
	String regist_day = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	
	Integer price;
	
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into member values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, phoneNumber);
	pstmt.setString(5, address);
	pstmt.setString(6, regist_day);
	pstmt.setString(7, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("./resultMember.jsp");
	
%>