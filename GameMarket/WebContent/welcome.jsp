<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
	href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "./resources/css/style.css">
<title>Welcome to GameWorld!</title>
</head>
<body>
	<%@ include file = "./menu.jsp" %>
	<%!
		String greeting = "Game World";
		String tagline = "다양한 게임들을 둘러보세요! 게임들은 지속적으로 추가 됩니다.";
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
				<%= tagline %>
			</h3>
			<br>
			<h4>
				찾는 게임이 없다면 원하는 게임에 대해 자유롭게 얘기 나눠볼 수도 있습니다!
			</h4>
			<h4>
				요청하신 게임은 개발자 분들이 살펴보고 개발을 진행하여 완성되는대로 판매됩니다.
			</h4>
			<br>
			<h4>
				개발자라면 개발을 함께할 사람들을 찾아보세요!
			</h4>
		</div>
	</div>
	<%@ include file = "./footer.jsp" %>
</body>
</html>