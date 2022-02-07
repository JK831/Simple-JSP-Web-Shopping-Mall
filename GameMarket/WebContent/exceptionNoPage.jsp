<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/css/style.css"/>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./menu.jsp" %>

<%!
	String main = "요청하신 페이지를 찾을 수 없습니다.";
%>
<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3"><%=main %></h1>
	</div>
</div>

<main role="main">
<div class="contaimer">
	<div class="text-center">
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
		<p> <a href="./products.jsp" class="btn btn-secondary"> 게임 목록 &raquo;</a>
	</div>
</div>
<%@ include file="./footer.jsp" %>
</main>
</body>
</html>