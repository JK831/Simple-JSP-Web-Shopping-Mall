<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/style.css"/>
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
	    <div class="container">
	        <h1 class="display-3">회원 정보 수정</h1>
	    </div>
	</div>
	<%@ include file="../dbconn.jsp" %>
	<%
		String id = (String)session.getAttribute("sessionId");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
	%>
	<div class = "container">
		<div class="row">
			<div class="col-md-5">
				<img src="../resources/images/<%=rs.getString("profile_fileName")%>" style="width:100%;" />
			</div>
	<div class = "col-md-7">
		<form name = "form-horizontal" action="./processUpdateMember.jsp" method = "post" enctype="multimart/form-data">
		<div class = "form-group row">
				<label class = "col-sm-2"> ID</label>
				<div class = "col-sm-3">
					<input type="text"  id="id" name="id"
					class = "form-control" value='<%=rs.getString("id") %>' readonly>
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"> 이름</label>
				<div class = "col-sm-3">
					<input type="text" id="name" name="name"
					class = "form-control" value='<%=rs.getString("name") %>'>
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"> 전화번호</label>
				<div class = "col-sm-3">
					<input type="text" id="phoneNumber" name="phoneNumber"
					class = "form-control" value='<%=rs.getString("phone") %>'>
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"> 주소</label>
				<div class = "col-sm-5">
					<textarea name="description" cols="50" rows="2"
					class="form-control"><%=rs.getString("address") %></textarea>
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2">비밀번호</label>
				<div class = "col-sm-3">
					<input type="password" id="password" name="password"
					class = "form-control" value='<%=rs.getString("password") %>'>
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2">프로필 이미지</label>
				<div class = "col-sm-5">
					<input type="file" name="image"
					class = "form-control">
				</div>
			</div>
			<div class = "form-group row">
				<div class = "col-sm-offset-2 col-sm-10">
					<input type="submit" class = "btn btn-primary"
					value="등록">
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
	<%
		}
		
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	
</body>
</html>