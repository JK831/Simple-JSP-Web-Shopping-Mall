<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ include file="./dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "./resources/css/style.css">
<%
String cartId = session.getId();
%>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">장바구니</h1>
	</div>
</div>

<div class="container">
	<div class="row">
		<table width="100%">
			<tr>
				<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="./shoppingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>게임</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>				
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
					price = rs.getInt("p_unitPrice");
				}
				
				int total = price * qnt;
				sum += total;
			%>
			<tr>
				<td><%=id%> - <%=name %></td>
				<td><%=price %></td>
				<td><%=qnt %></td>
				<td><%=total %></td>
				<td><a href="./removeCart.jsp?id=<%=id%>" class="badge badge-danger"> 삭제</a></td>
				
			</tr>
			<%
			}
			%>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum %></th>
				<th></th>
			</tr>
			
		</table>
	</div>
	<hr>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>