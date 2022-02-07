<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/css/style.css"/>
<script type="text/javascript" src="../resources/js/validation.js"></script>
<title>게임 등록</title>
</head>
<body>

<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message" >

	<jsp:include page="./menu_manager.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
		<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
		<a href="../logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
	</div>

		<form name="newProduct" action="./processAddProduct.jsp"class="form-horizontal" method="post"
			enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			</div>
		<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="producer"/></label>
				<div class="col-sm-3">
					<input type="text" name="producer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="genre"/></label>
				<div class="col-sm-3">
					<input type="text" name="genre" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value='<fmt:message key="button"/>' onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"/>
	</fmt:bundle>
</body>
</html>