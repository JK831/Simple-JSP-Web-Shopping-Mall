<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
	session.invalidate();
	response.sendRedirect("login.jsp");
%>