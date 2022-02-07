<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/style.css"/>
<title>상품 상세 정보</title>
</head>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
<body>
	<jsp:include page="./menu.jsp"/>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">게임 정보</h1>
        </div>
    </div>
    <%
    	
        String id=request.getParameter("id");
    
    	String sql = "select * from product WHERE p_id=?";
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1,id);
    	rs = pstmt.executeQuery();

    	rs.next();
    %>
    <div class="container">
        <div class="row">
        <div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("p_fileName") %>
				" style="width: 100%" />
			</div>
            <div class="col-md-6">
                <h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_description")%>
                <p><b>상품 코드: </b><span class="badge badge-danger">
                
                <%=rs.getString("p_id") %></span>
                <p><b>제작자</b> : <%=rs.getString("p_producer")%>
                <p><b>출시일</b> : <%=rs.getString("p_releaseDate")%>
                <h4><%=rs.getString("p_unitPrice")%>원</h4>
                <p>
                <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" method="post">
                	<a href="#" class="btn btn-info" onclick="addToCart()"> 게임 구매&raquo;</a>
                	<a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
                	<a href="./products.jsp" class="btn btn-secondary">게임 목록 &raquo;</a>
                </form>
            </div>
                        
        </div> 
        <hr>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>