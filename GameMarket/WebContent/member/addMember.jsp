<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../resources/css/style.css"/>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>회원 가입</title>
</head>
<body>

	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" >
	<jsp:include page="../menu.jsp"/>	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="Registration" /></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko" >Korean</a>|<a href="?language=en" >English</a>
		</div>
		<form name="newMember" action="./processAddMember.jsp"
		class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "Id" /></label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "Password" /></label>
				<div class="col-sm-3">
					<input type="password" id="password" name="password" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "name" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "PhoneNumber"/></label>
				<div class="col-sm-5">
					<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "Address"/></label>
				<div class="col-sm-3">
					<input type="text" name="address" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "ProfileImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="profileImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value='<fmt:message key="button"/>'>
				</div>
			</div>
		</form>
	</div>
</fmt:bundle>
</body>

</html>