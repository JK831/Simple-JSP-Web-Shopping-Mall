<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="./resources/css/style.css"/>
<title>판매 게임 목록</title>
</head>    
<body>
	<jsp:include page = "menu.jsp" />

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게임 목록</h1>
    </div>
</div>

<div class="container">
        <div class="row" align="center">
        <%@ include file="dbconn.jsp" %>
        <%
        	PreparedStatement pstmt = null;
       		ResultSet rs = null;
       		String sql = "select * from product";
       		pstmt = conn.prepareStatement(sql);
       		rs = pstmt.executeQuery();
       		while (rs.next()) {
        %>
            <div class="col-md-4">
            	<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%;" />
                <h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_genre")%>
                <p><%=rs.getString("p_unitprice")%>원
                <a href="./product.jsp?id=<%=rs.getString("p_id")%>"
                class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
                <hr>
            </div>
            <%} %> 
            <%
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
	<jsp:include page="footer.jsp" />
</body>
</html>