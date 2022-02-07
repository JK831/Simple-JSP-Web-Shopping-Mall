<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="./dbconn.jsp" %>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	String sql = "select * from product where p_id=?";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	int count = 0;

	while (rs.next()) {
		count++;
	}
	
	if (count == 0)
		response.sendRedirect("exceptionNoProductId.jsp");

	
	HashMap<String, Integer> list = (HashMap<String, Integer>) session.getAttribute("cartlist");
	if(list == null){
		list = new HashMap<String, Integer>();
		session.setAttribute("cartlist", list);
	}
	
	int productsQnt = 0;
	if (list.get(id) == null)
	{
		list.put(id, 1);
	}
	else
	{
		productsQnt = list.get(id);
		list.put(id, productsQnt++);
		
	}
	
	response.sendRedirect("product.jsp?id="+id);

%>
</body>
</html>