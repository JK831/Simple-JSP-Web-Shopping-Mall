<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel = "stylesheet" href = "./resources/css/style.css">
<meta charset="UTF-8">
<title>배송 정보</title>
</head>
<body>

<%@ include file="menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class = "display-3">배송 정보</h1>
	</div>
</div>

<div class="container">
	<form action="./processShoppingInfo.jsp" class="form-horizontal" method="post">
		<input type="hidden" name="cartId" value="<%= request.getParameter("cartId") %>"/>
		<div class="form-group row">
			<label class="col-sm-2">성명</label>
			<div class="col-sm-3">
				<input name="name" type="text" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이메일 주소</label>
			<div class="col-sm-3">
				<input name="email" type="text" class="form-control"/>
			</div>
		</div>
			<div class="form-group row">
			<label class="col-sm-2">국가명</label>
			<div class="col-sm-3">
				<input name="country" type="text" class="form-control"/>
			</div>
		</div>
					<div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input name="zipCode" type="text" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-5">
				<input name="addressName" type="text" class="form-control"/>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전</a>
				<input type="submit" class="btn btn-primary" value="등록"/>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			</div>
		</div>		
	</form>
</div>

</body>
</html>