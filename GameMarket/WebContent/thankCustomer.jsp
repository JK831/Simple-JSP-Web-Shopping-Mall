<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLDecoder" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String cartId = session.getId();
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	

%>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "./resources/css/style.css">
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">주문 완료</h1>
	</div>
</div>

<div class="container">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	<p> 게임코드는 이메일 주소로 전송될 예정입니다!
	<p> 주문 번호 : <% out.println(shipping_cartId); %>
</div>

<div class="container">
	<p><a href="./books.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
</div>

</body>
</html>

<%
session.invalidate();

for(int i=0; i<cookies.length; i++){
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if(n.equals("Shipping_cartId"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_name"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_shippingDate"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_country"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_zipCode"))
		thisCookie.setMaxAge(0);
	if(n.equals("Shipping_addressName"))
		thisCookie.setMaxAge(0);
}
%>