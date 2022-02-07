<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "../resources/css/style.css">
<title>관리 페이지</title>
</head>
<body>
	<%@ include file = "./menu_manager.jsp" %>
	<%!
		String greeting = "관리자 페이지";
	%>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<b><%= greeting %></b>
			</h1>
		</div>
	</div>
	<div class = "container">
		<div class = "text-center">
			<h3>
				<a href="./addProduct.jsp">상품 추가</a>
			</h3>
			<h3>
				<a href="./editProduct.jsp?edit=update">상품 수정</a>
			</h3>
			<h3>
				<a href="./editProduct.jsp?edit=delete">상품 삭제</a>
			</h3>
		</div>
	</div>
	<%@ include file = "../footer.jsp" %>
</body>
</html>