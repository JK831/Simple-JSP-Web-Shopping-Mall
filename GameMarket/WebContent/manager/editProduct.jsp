<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../resources/css/style.css"/>
<title>Edit Products</title>
<script type ="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!") == true)
			location.href = "./deleteProduct.jsp?id="+id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="./menu_manager.jsp" />
	<div class="jumbotron">
	    <div class="container">
	        <h1 class="display-3">Edit Products</h1>
	    </div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="../dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="../resources/images/<%=rs.getString("p_fileName")%>" style="width:100%;" />
				<h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_genre")%>
                <p><%=rs.getString("p_unitprice")%>원
                <p><%
                	if (edit.equals("update")) {
                %>
                <a href="./updateProduct.jsp?id=<%=rs.getString("p_id") %>"
                class="btn btn-success" role="button"> Revise &raquo;></a>
                <%
                	} else if (edit.equals("delete")) {
                %>
                <a href="#" onclick="deleteConfirm('<%=rs.getString("p_id") %>')"
                class="btn btn-danger" role="button"> Delete &raquo;></a>
                <%
                	}
                %>
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
		</div>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>