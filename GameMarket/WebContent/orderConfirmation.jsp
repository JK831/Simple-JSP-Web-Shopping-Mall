<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ include file="./dbconn.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String cartId = session.getId();
String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingEmail = "";
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
		if(n.equals("Shipping_name"))
			shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_email"))
			shipping_shippingEmail = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_country"))
			shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_zipCode"))
			shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if(n.equals("Shipping_addressName"))
			shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
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
<title>주문 정보</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">주문정보</h1>
	</div>
</div>

<div class="container col-8 alert alert-info">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>

	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송주소</strong>
			<br> 성명 : <% out.println(shipping_name); %>
			<br> 우편번호 : <% out.println(shipping_zipCode); %>
			<br> 주소 : <% out.println(shipping_addressName); %><% out.println(shipping_country); %>
			<br>			
		</div>
		<div class="col-4" align="right">
			<p> <em>이메일 : <% out.println(shipping_shippingEmail); %></em>
		</div>
	</div>
	
	<div>
		<table class="table table-hover">
			<tr>
				<th>게임</th>
				<th>#</th>
				<th>가격</th>
				<th>소계</th>			
			</tr>
			<%
			String sql = "select * from product where p_id=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int sum = 0;
			HashMap<String, Integer> cartList = (HashMap<String, Integer>) session.getAttribute("cartlist");
			if(cartList == null)
				cartList = new HashMap<String, Integer>();
			for(Map.Entry<String, Integer> es: cartList.entrySet()){
				String id = es.getKey();
				int qnt = es.getValue();
				String name = null;
				
				int price = 0;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					name = rs.getString("p_name");
					price = rs.getInt("p_unitprice");
				}
				
				int total = price * qnt;
				sum += total;
			%>
			<tr>
				<td class="text-center"><em><%=name%></em></td>
				<td class="text-center"><%=qnt %></td>
				<td class="text-center"><%=price %></td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액 : </strong></td>
				<td class="text-center text-danger"><strong><%=sum %> </strong></td>
			</tr>
		</table>
		
		<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
		<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
		<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
	</div>
</div>
</body>
</html>